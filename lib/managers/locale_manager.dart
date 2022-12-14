import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/managers/locale_state.dart';

final localeManagerProvider = StateNotifierProvider<LocaleManager, LocaleState>(
  (ref) {
    return LocaleManager();
  },
);

class LocaleManager extends StateNotifier<LocaleState> {
  Locale locale = WidgetsBinding.instance.window.locale;

  LocaleManager() : super(InitState());

  Locale getLocale() {
    return locale;
  }

  void setEngLanguage() {
    locale = const Locale('en');
    state = EngState();
  }

  void setRusLanguage() {
    locale = const Locale('ru');
    state = RusState();
  }
}
