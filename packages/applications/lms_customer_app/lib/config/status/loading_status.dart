enum LoadingStatus {
  pure,
  loading,
  finish,
  success,
  error,
}

extension LoadingStatusExt on LoadingStatus {
  bool get isFinished => this == LoadingStatus.finish;
}
