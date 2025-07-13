
class Measurement {
  final int id;
  final double height;
  final String photoBase64;

  Measurement({
    required this.id,
    required this.height,
    required this.photoBase64,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      id: json['id'],
      height: (json['height'] ?? 0).toDouble(),
      photoBase64: json['photo_base64'] ?? '',
    );
  }
}
