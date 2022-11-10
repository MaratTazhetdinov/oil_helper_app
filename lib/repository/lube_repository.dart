import 'package:oil_helper_app/data/database_helper.dart';
import 'package:oil_helper_app/models/lube.dart';

class LubeRepository {
  LubeRepository._();
  static final LubeRepository _instance = LubeRepository._();
  static LubeRepository get instance => _instance;

  Future<Lube> getLukoilLube(int id) async {
    final db = DatabaseHelper.instance;
    final result = await db.getLukoilLube(id);
    return result.map((e) => Lube.fromJson(e)).first;
  }

  Future<Lube> getGazpromLube(int id) async {
    final db = DatabaseHelper.instance;
    final result = await db.getGazpromLube(id);
    return result.map((e) => Lube.fromJson(e)).first;
  }

  Future<Lube> getRosneftLube(int id) async {
    final db = DatabaseHelper.instance;
    final result = await db.getRosneftLube(id);
    return result.map((e) => Lube.fromJson(e)).first;
  }
}
