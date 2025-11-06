class Failures implements Exception {
  const Failures({this.message, this.responseCode});

  final String? message;
  final String? responseCode;
}

sealed class ProjectFailures extends Failures {
  const ProjectFailures();
}

final class ProjectApiFailure extends ProjectFailures {
  const ProjectApiFailure();
}
