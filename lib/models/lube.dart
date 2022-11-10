class Lube {
  int id;
  String lubeName;
  String lubeImage;
  String lubeTDS;

  Lube({
    required this.id,
    required this.lubeName,
    required this.lubeImage,
    required this.lubeTDS,
  });

  factory Lube.fromJson(Map<String, dynamic> json) {
    return Lube(
      id: json['lubeID'] ?? 0,
      lubeName: json['lubeName'] ?? 'Empty',
      lubeImage: json['lubeImage'] ?? 'Empty',
      lubeTDS: json['lubeTDS'] ?? 'Empty',
    );
  }
}
