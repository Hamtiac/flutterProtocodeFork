// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:http_multi_server/http_multi_server.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:vm_service/vm_service.dart';
import 'package:webkit_inspection_protocol/webkit_inspection_protocol.dart'
    as wip;

import 'package:dwds/src/services/chrome_debug_exception.dart';

VMRef toVMRef(VM vm) => VMRef(name: vm.name);

int _nextId = 0;
String createId() {
  _nextId++;
  return '$_nextId';
}

/// Returns `true` if [hostname] is bound to an IPv6 address.
Future<bool> useIPv6ForHost(String hostname) async {
  final addresses = await InternetAddress.lookup(hostname);
  if (addresses.isEmpty) return false;
  final address = addresses.firstWhere(
    (a) => a.type == InternetAddressType.IPv6,
    orElse: () => addresses.first,
  );
  return address.type == InternetAddressType.IPv6;
}

/// Returns a port that is probably, but not definitely, not in use.
///
/// This has a built-in race condition: another process may bind this port at
/// any time after this call has returned.
Future<int> findUnusedPort() async {
  int port;
  ServerSocket socket;
  ServerSocket socketTest;
  print('hello');
  // faux, marche pas...
  // InternetAddress customipv6;
  // await InternetAddress.lookup("test.e3.2f0q5enq.protocode.cloud", type: InternetAddressType.IPv6).then((value) => customipv6 = value[0]);
  // InternetAddress customipv4;
  // await InternetAddress.lookup("test.e3.2f0q5enq.protocode.cloud", type: InternetAddressType.IPv4).then((value) => customipv4 = value[0]);

  // try {
  //   socket =
  //       // await ServerSocket.bind("test.e3.2f0q5enq.protocode.cloud", 0, v6Only: true);
  //       await ServerSocket.bind(InternetAddress.loopbackIPv6, 0, v6Only: true);
  // } on SocketException {
  //   // socket = await ServerSocket.bind("test.e3.2f0q5enq.protocode.cloud", 0);
    
    // socket = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    socketTest = await ServerSocket.bind(InternetAddress.anyIPv4, 55555);
    socket = await ServerSocket.bind("test2.e3.2f0q5enq.protocode.cloud", 0);
  // }
  port = socket.port;
  print("(Mathias :D findUnusedPort() ) -> socket address shared : ${socket.address}");
  print("(Mathias :D findUnusedPort() ) -> socket address tostring shared : ${socket.address.toString()}");
  print("(Mathias :D findUnusedPort() ) -> socket address host shared : ${socket.address.host}");
  print("(Mathias :D findUnusedPort() ) -> socket address numeric adress shared : ${socket.address.address}");
  print("(Mathias :D findUnusedPort() ) -> socket address isLinkLocal shared : ${socket.address.isLinkLocal}");
  print("(Mathias :D findUnusedPort() ) -> socket address isLoopback shared : ${socket.address.isLoopback}");
  print("(Mathias :D findUnusedPort() ) -> socket address isMulticast shared : ${socket.address.isMulticast}");
  print("(Mathias :D findUnusedPort() ) -> socket address rawAddress shared : ${socket.address.rawAddress}");
  print("(Mathias :D findUnusedPort() ) -> socket port shared : ${port}");
  print("--------------------------------------------------------------------------------------------------------");
  print("(Mathias :D findUnusedPort() ) -> socketTest address shared : ${socketTest.address}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address tostring shared : ${socketTest.address.toString()}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address host shared : ${socketTest.address.host}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address numeric adress shared : ${socketTest.address.address}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address isLinkLocal shared : ${socketTest.address.isLinkLocal}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address isLoopback shared : ${socketTest.address.isLoopback}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address isMulticast shared : ${socketTest.address.isMulticast}");
  print("(Mathias :D findUnusedPort() ) -> socketTest address rawAddress shared : ${socketTest.address.rawAddress}");
  print("(Mathias :D findUnusedPort() ) -> socketTest port : ${socketTest.port}");

  // port = 443;
  // print("(Mathias :D findUnusedPort() ) -> raw modified port shared : ${port}");
  await socket.close();
  return port;
}

/// Finds unused port and binds a new http server to it.
///
/// Retries a few times to recover from errors due to
/// another thread or process opening the same port.
/// Starts by trying to bind to [port] if specified.
Future<HttpServer> startHttpServer(String hostname, {int? port}) async {
  HttpServer? httpServer;
  final retries = 5;
  var i = 0;
  var foundPort = port ?? await findUnusedPort();
    print("shared foundPort : $foundPort");
  // var foundPort = 443;
  while (i < retries) {
    i++;
    try {
      httpServer = await HttpMultiServer.bind(hostname, foundPort);
    } on SocketException {
      if (i == retries) rethrow;
    }
    if (httpServer != null || i == retries) return httpServer!;
    foundPort = await findUnusedPort();
    print("shared foundPort2 : $foundPort");
    // foundPort = 443;
    await Future<void>.delayed(const Duration(milliseconds: 100));
  }
  return httpServer!;
}

/// Handles [requests] using [handler].
///
/// Captures all sync and async stack error traces and passes
/// them to the [onError] handler.
void serveHttpRequests(Stream<HttpRequest> requests, Handler handler,
    void Function(Object, StackTrace) onError) {
  return Chain.capture(() {
    serveRequests(requests, handler);
  }, onError: onError);
}

/// Throws an [wip.ExceptionDetails] object if `exceptionDetails` is present on the
/// result.
void handleErrorIfPresent(wip.WipResponse? response,
    {String? evalContents, Object? additionalDetails}) {
  if (response == null || response.result == null) return;
  if (response.result!.containsKey('exceptionDetails')) {
    throw ChromeDebugException(
        response.result!['exceptionDetails'] as Map<String, dynamic>,
        evalContents: evalContents,
        additionalDetails: additionalDetails);
  }
}
