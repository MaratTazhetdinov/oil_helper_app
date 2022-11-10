import '../data/database_helper.dart';
import '../models/car.dart';

class CarRepository {
  CarRepository._();
  static final CarRepository _instance = CarRepository._();
  static CarRepository get instance => _instance;

  Future<List<Car>> getCarsList() async {
    final db = DatabaseHelper.instance;
    final result = await db.getCarsList();
    return result.map((e) => Car.fromJson(e)).toList();
  }

  Future<List<Car>> getCarsListByFuelType(String fuelType) async {
    final db = DatabaseHelper.instance;
    final result = await db.getCarsListByFuelType(fuelType);
    return result.map((e) => Car.fromJson(e)).toList();
  }

  Future<List<Car>> getCarsListByManufacturer(
      String fuelType, String manufacturer) async {
    final db = DatabaseHelper.instance;
    final result = await db.getCarsListByManufacturer(fuelType, manufacturer);
    return result.map((e) => Car.fromJson(e)).toList();
  }

  Future<List<Car>> getCarsListByModel(
      String fuelType, String manufacturer, String model) async {
    final db = DatabaseHelper.instance;
    final result = await db.getCarsListByModel(fuelType, manufacturer, model);
    return result.map((e) => Car.fromJson(e)).toList();
  }

  Future<Car> getCarsListByEngineType(String fuelType, String manufacturer,
      String model, String engineType) async {
    final db = DatabaseHelper.instance;
    final result = await db.getCarsListByEngineType(
        fuelType, manufacturer, model, engineType);
    return result.map((e) => Car.fromJson(e)).first;
  }
}
