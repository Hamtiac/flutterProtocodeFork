import 'package:collection/collection.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_auth_platform_interface/src/pigeon/messages.pigeon.dart';

List<MultiFactorInfo> multiFactorInfoPigeonToObject(
  List<PigeonMultiFactorInfo?> pigeonMultiFactorInfo,
) {
  return pigeonMultiFactorInfo.whereNotNull().map((e) {
    if (e.phoneNumber != null) {
      return PhoneMultiFactorInfo(
        displayName: e.displayName,
        enrollmentTimestamp: e.enrollmentTimestamp,
        // Sometimes can be null on iOS when it shouldn't be.
        // Adding default value to prevent null exception.
        factorId: e.factorId ?? 'phone',
        uid: e.uid,
        phoneNumber: e.phoneNumber!,
      );
    }
    return MultiFactorInfo(
      displayName: e.displayName,
      enrollmentTimestamp: e.enrollmentTimestamp,
      factorId: e.factorId ?? '',
      uid: e.uid,
    );
  }).toList();
}
