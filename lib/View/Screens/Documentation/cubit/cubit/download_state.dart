part of 'download_cubit.dart';

@immutable
sealed class DownloadState {}

final class DownloadInitial extends DownloadState {}

class DownloadLoading extends DownloadState {}

class DownloadSuccess extends DownloadState {
  final String downloadUrl;

  DownloadSuccess(this.downloadUrl);
}

class DownloadError extends DownloadState {
  final String message;

  DownloadError(this.message);
}
