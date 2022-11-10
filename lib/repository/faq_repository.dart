import 'package:oil_helper_app/models/faq.dart';
import '../data/database_helper.dart';

class FaqRepository {
  FaqRepository._();
  static final FaqRepository _instance = FaqRepository._();
  static FaqRepository get instance => _instance;

  Future<List<FAQ>> getFaqList() async {
    final db = DatabaseHelper.instance;
    final result = await db.getFaqList();
    return result.map((e) => FAQ.fromJson(e)).toList();
  }

  Future<FAQ> getFaqAnswer(int id) async {
    final db = DatabaseHelper.instance;
    final result = await db.getFaqAnswer(id);
    return result.map((e) => FAQ.fromJson(e)).first;
  }
}
