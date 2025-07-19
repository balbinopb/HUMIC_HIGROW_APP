class HeightRecord {
  final String id;
  final String? photoBase64;
  final String? height;
  final String createdAt;

  HeightRecord({
    required this.id,
    required this.photoBase64,
    required this.height,
    required this.createdAt,
  });

  factory HeightRecord.fromJson(Map<String, dynamic> json) {
    return HeightRecord(
      id: json['id'].toString(),
      photoBase64: json['photo_base64'],
      height: json['height_cm']?.toString(),
      createdAt: json['created_at'],
    );
  }
}