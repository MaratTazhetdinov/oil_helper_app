class Request {
  int id;
  String fuelType;
  String manufacturer;
  String model;
  String engineType;
  String date;

  Request({
    required this.id,
    required this.fuelType,
    required this.manufacturer,
    required this.model,
    required this.engineType,
    required this.date,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['requestID'] ?? 0,
      fuelType: json['fuelType'] ?? 'Empty',
      manufacturer: json['manufacturer'] ?? 'Empty',
      model: json['model'] ?? 'Empty',
      engineType: json['engineType'] ?? 'Empty',
      date: json['date'] ?? 0,
    );
  }
}
