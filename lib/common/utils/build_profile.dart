class BuildProfile {
  static CurrentBuildProfile get getCurrent {
    var profile = String.fromEnvironment('PROFILE');
    switch (profile) {
      case 'development':
        return CurrentBuildProfile.development;
      case 'staging':
        return CurrentBuildProfile.staging;
      case 'production':
        return CurrentBuildProfile.production;
      default:
        return CurrentBuildProfile.development;
    }
  }
}

enum CurrentBuildProfile { development, staging, production }

extension BuildProfileExt on CurrentBuildProfile {
  bool get isDevelopment => (this == CurrentBuildProfile.development);
}
