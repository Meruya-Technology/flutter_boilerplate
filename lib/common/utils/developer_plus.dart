import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_boilerplate/common/utils/build_profile.dart';

class DeveloperPlus {
  final CurrentBuildProfile currentBuildProfile;

  DeveloperPlus({
    this.currentBuildProfile = CurrentBuildProfile.development,
  });

  log(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (currentBuildProfile.isDevelopment) {
      developer.log(
        message,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        name: name,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
