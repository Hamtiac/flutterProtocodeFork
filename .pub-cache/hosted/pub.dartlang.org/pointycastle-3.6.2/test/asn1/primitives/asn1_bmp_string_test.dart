import 'dart:typed_data';

import 'package:pointycastle/asn1/asn1_encoding_rule.dart';
import 'package:pointycastle/asn1/asn1_tags.dart';
import 'package:pointycastle/asn1/primitives/asn1_bmp_string.dart';
import 'package:pointycastle/asn1/primitives/asn1_ia5_string.dart';
import 'package:test/test.dart';

void main() {
  test('Test decode DER', () {
    var bytes = Uint8List.fromList([
      0x1E,
      0x5A,
      0x00,
      0x4D,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x73,
      0x00,
      0x6F,
      0x00,
      0x66,
      0x00,
      0x74,
      0x00,
      0x20,
      0x00,
      0x52,
      0x00,
      0x53,
      0x00,
      0x41,
      0x00,
      0x20,
      0x00,
      0x53,
      0x00,
      0x43,
      0x00,
      0x68,
      0x00,
      0x61,
      0x00,
      0x6E,
      0x00,
      0x6E,
      0x00,
      0x65,
      0x00,
      0x6C,
      0x00,
      0x20,
      0x00,
      0x43,
      0x00,
      0x72,
      0x00,
      0x79,
      0x00,
      0x70,
      0x00,
      0x74,
      0x00,
      0x6F,
      0x00,
      0x67,
      0x00,
      0x72,
      0x00,
      0x61,
      0x00,
      0x70,
      0x00,
      0x68,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x20,
      0x00,
      0x50,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x76,
      0x00,
      0x69,
      0x00,
      0x64,
      0x00,
      0x65,
      0x00,
      0x72
    ]);

    var valueBytes = Uint8List.fromList([
      0x00,
      0x4D,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x73,
      0x00,
      0x6F,
      0x00,
      0x66,
      0x00,
      0x74,
      0x00,
      0x20,
      0x00,
      0x52,
      0x00,
      0x53,
      0x00,
      0x41,
      0x00,
      0x20,
      0x00,
      0x53,
      0x00,
      0x43,
      0x00,
      0x68,
      0x00,
      0x61,
      0x00,
      0x6E,
      0x00,
      0x6E,
      0x00,
      0x65,
      0x00,
      0x6C,
      0x00,
      0x20,
      0x00,
      0x43,
      0x00,
      0x72,
      0x00,
      0x79,
      0x00,
      0x70,
      0x00,
      0x74,
      0x00,
      0x6F,
      0x00,
      0x67,
      0x00,
      0x72,
      0x00,
      0x61,
      0x00,
      0x70,
      0x00,
      0x68,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x20,
      0x00,
      0x50,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x76,
      0x00,
      0x69,
      0x00,
      0x64,
      0x00,
      0x65,
      0x00,
      0x72
    ]);

    var asn1Object = ASN1BMPString.fromBytes(bytes);
    expect(asn1Object.tag, 30);
    expect(asn1Object.isConstructed, false);
    expect(asn1Object.encodedBytes, bytes);
    expect(asn1Object.valueByteLength, 90);
    expect(asn1Object.valueStartPosition, 2);
    expect(asn1Object.stringValue,
        'Microsoft RSA SChannel Cryptographic Provider');
    expect(asn1Object.valueBytes, valueBytes);
  });

  test('Test encode DER', () {
    var asn1Object = ASN1BMPString(
        stringValue: 'Microsoft RSA SChannel Cryptographic Provider');

    var bytes = Uint8List.fromList([
      0x1E,
      0x5A,
      0x00,
      0x4D,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x73,
      0x00,
      0x6F,
      0x00,
      0x66,
      0x00,
      0x74,
      0x00,
      0x20,
      0x00,
      0x52,
      0x00,
      0x53,
      0x00,
      0x41,
      0x00,
      0x20,
      0x00,
      0x53,
      0x00,
      0x43,
      0x00,
      0x68,
      0x00,
      0x61,
      0x00,
      0x6E,
      0x00,
      0x6E,
      0x00,
      0x65,
      0x00,
      0x6C,
      0x00,
      0x20,
      0x00,
      0x43,
      0x00,
      0x72,
      0x00,
      0x79,
      0x00,
      0x70,
      0x00,
      0x74,
      0x00,
      0x6F,
      0x00,
      0x67,
      0x00,
      0x72,
      0x00,
      0x61,
      0x00,
      0x70,
      0x00,
      0x68,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x20,
      0x00,
      0x50,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x76,
      0x00,
      0x69,
      0x00,
      0x64,
      0x00,
      0x65,
      0x00,
      0x72
    ]);

    expect(asn1Object.encode(), bytes);
  });

  test('Test dump', () {
    var expected =
        '''BMPString Microsoft RSA SChannel Cryptographic Provider''';
    var bytes = Uint8List.fromList([
      0x1E,
      0x5A,
      0x00,
      0x4D,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x73,
      0x00,
      0x6F,
      0x00,
      0x66,
      0x00,
      0x74,
      0x00,
      0x20,
      0x00,
      0x52,
      0x00,
      0x53,
      0x00,
      0x41,
      0x00,
      0x20,
      0x00,
      0x53,
      0x00,
      0x43,
      0x00,
      0x68,
      0x00,
      0x61,
      0x00,
      0x6E,
      0x00,
      0x6E,
      0x00,
      0x65,
      0x00,
      0x6C,
      0x00,
      0x20,
      0x00,
      0x43,
      0x00,
      0x72,
      0x00,
      0x79,
      0x00,
      0x70,
      0x00,
      0x74,
      0x00,
      0x6F,
      0x00,
      0x67,
      0x00,
      0x72,
      0x00,
      0x61,
      0x00,
      0x70,
      0x00,
      0x68,
      0x00,
      0x69,
      0x00,
      0x63,
      0x00,
      0x20,
      0x00,
      0x50,
      0x00,
      0x72,
      0x00,
      0x6F,
      0x00,
      0x76,
      0x00,
      0x69,
      0x00,
      0x64,
      0x00,
      0x65,
      0x00,
      0x72
    ]);
    var asn1Object = ASN1BMPString.fromBytes(bytes);
    expect(asn1Object.dump(), expected);
  });
}
