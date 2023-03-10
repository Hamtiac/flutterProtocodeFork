import 'package:basic_utils/src/model/x509/ExtendedKeyUsage.dart';
import 'package:basic_utils/src/model/x509/X509CertificateDataExtensions.dart';
import 'package:basic_utils/src/model/x509/X509CertificatePublicKeyData.dart';
import 'package:json_annotation/json_annotation.dart';

import 'X509CertificateValidity.dart';

part 'X509CertificateData.g.dart';

///
/// Model that represents the data of a x509Certificate
///
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class X509CertificateData {
  /// The version of the certificate
  int version;

  /// The serialNumber of the certificate
  BigInt serialNumber;

  /// The signatureAlgorithm of the certificate
  String signatureAlgorithm;

  /// The issuer data of the certificate
  Map<String, String?> issuer;

  /// The validity of the certificate
  X509CertificateValidity validity;

  /// The subject data of the certificate
  Map<String, String?> subject;

  /// The sha1 thumbprint for the certificate
  String? sha1Thumbprint;

  /// The sha256 thumbprint for the certificate
  String? sha256Thumbprint;

  /// The md5 thumbprint for the certificate
  String? md5Thumbprint;

  /// The public key data from the certificate
  X509CertificatePublicKeyData publicKeyData;

  /// The subject alternative names
  @Deprecated('Use extensions.subjectAlternativNames instead')
  List<String>? subjectAlternativNames;

  /// The plain certificate pem string, that was used to decode.
  String? plain;

  /// The extended key usage extension
  @Deprecated('Use extensions.extKeyUsage instead')
  List<ExtendedKeyUsage>? extKeyUsage;

  /// The certificate extensions
  X509CertificateDataExtensions? extensions;

  X509CertificateData({
    required this.version,
    required this.serialNumber,
    required this.signatureAlgorithm,
    required this.issuer,
    required this.validity,
    required this.subject,
    this.sha1Thumbprint,
    this.sha256Thumbprint,
    this.md5Thumbprint,
    required this.publicKeyData,
    required this.subjectAlternativNames,
    this.plain,
    this.extKeyUsage,
    this.extensions,
  });

  /*
   * Json to X509CertificateData object
   */
  factory X509CertificateData.fromJson(Map<String, dynamic> json) =>
      _$X509CertificateDataFromJson(json);

  /*
   * X509CertificateData object to json
   */
  Map<String, dynamic> toJson() => _$X509CertificateDataToJson(this);
}
