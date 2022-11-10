class Car {
  int id;
  String fuelType;
  String manufacturer;
  String model;
  String engineType;
  int lukoilLubeID;
  int gazpromLubeID;
  int rosneftLubeID;

  Car({
    required this.id,
    required this.fuelType,
    required this.manufacturer,
    required this.model,
    required this.engineType,
    required this.lukoilLubeID,
    required this.gazpromLubeID,
    required this.rosneftLubeID,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['carID'] ?? 0,
      fuelType: json['fuelType'] ?? 'Empty',
      manufacturer: json['manufacturer'] ?? 'Empty',
      model: json['model'] ?? 'Empty',
      engineType: json['engineType'] ?? 'Empty',
      lukoilLubeID: json['lukoilLubeID'] ?? 0,
      gazpromLubeID: json['gazpromLubeID'] ?? 0,
      rosneftLubeID: json['rosneftLubeID'] ?? 0,
    );
  }
}
