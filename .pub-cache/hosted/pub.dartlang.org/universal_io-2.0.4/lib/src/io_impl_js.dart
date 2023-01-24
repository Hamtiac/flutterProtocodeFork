// Copyright 2020 terrier989@gmail.com.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Annotate as 'internal' so developers don't accidentally import this.
@internal
library universal_io.io.impl_js;

import 'package:meta/meta.dart';

export 'http/http.dart' hide HttpHeadersImpl;
export 'io/bytes_builder.dart';
export 'io/data_transformer.dart';
export 'io/directory.dart';
export 'io/exceptions.dart';
export 'io/file.dart';
export 'io/file_system_entity.dart';
export 'io/internet_address.dart';
export 'io/io_sink.dart';
export 'io/link.dart';
export 'io/network_policy.dart';
export 'io/overrides.dart';
export 'io/platform.dart';
export 'io/process.dart';
export 'io/secure_server_socket.dart';
export 'io/secure_socket.dart';
export 'io/security_context.dart';
export 'io/socket.dart';
export 'io/stdio.dart';
export 'io/string_transformer.dart';
export 'io/sync_socket.dart';