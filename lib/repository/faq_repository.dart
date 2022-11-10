import 'package:flutter/material.dart';
import 'package:oil_helper_app/models/faq.dart';
import '../data/database_helper.dart';

class FaqRepository {
  FaqRepository._();
  static final FaqRepository _instance = FaqRepository._();
  static FaqRepository get instance => _instance;

  Future<List<FAQ>> getFaqList(Locale locale) async {
    final db = DatabaseHelper.instance;
    final result = await db.getFaqList(locale);
    return result.map((e) => FAQ.fromJson(e)).toList();
  }

  Future<FAQ> getFaqAnswer(int id, Locale locale) async {
    final db = DatabaseHelper.instance;
    final result = await db.getFaqAnswer(id, locale);
    return result.map((e) => FAQ.fromJson(e)).first;
  }
}
