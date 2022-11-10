import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/managers/locale_manager.dart';
import 'package:oil_helper_app/managers/locale_state.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import 'package:oil_helper_app/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ProviderScope(child: AppWidget()));
}

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Locale appLocale = WidgetsBinding.instance.window.locale;

    return MaterialApp.router(
        locale: ref.watch(localeManagerProvider) is InitState
            ? appLocale
            : ref.read(localeManagerProvider.notifier).getLocale(),
        theme: AppTheme.define(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ]);
  }
}
