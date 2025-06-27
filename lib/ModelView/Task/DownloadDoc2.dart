class DownloadDoc2Model {
  final String downloadUrl;

  DownloadDoc2Model({required this.downloadUrl});

  factory DownloadDoc2Model.fromJson(Map<String, dynamic> json) {
    return DownloadDoc2Model(
      downloadUrl: json['download_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'download_url': downloadUrl,
    };
  }
}
