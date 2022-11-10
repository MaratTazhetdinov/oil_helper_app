import 'package:oil_helper_app/models/request.dart';
import '../data/database_helper.dart';

class RequestRepository {
  RequestRepository._();
  static final RequestRepository _instance = RequestRepository._();
  static RequestRepository get instance => _instance;

  Future<List<Request>> getRequestsList() async {
    final db = DatabaseHelper.instance;
    final result = await db.getRequestsList();
    return result.map((e) => Request.fromJson(e)).toList();
  }

  Future<int> addRequest(String fuelType, String manufacturer, String model,
      String engineType, String date) async {
    final db = DatabaseHelper.instance;
    return db.addRequest(fuelType, manufacturer, model, engineType, date);
  }
}
