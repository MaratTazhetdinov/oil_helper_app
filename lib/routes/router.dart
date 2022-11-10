import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:oil_helper_app/pages/engine_type_page.dart';
import 'package:oil_helper_app/pages/faq_answer_page.dart';
import 'package:oil_helper_app/pages/faq_page.dart';
import 'package:oil_helper_app/pages/fuel_type_page.dart';
import 'package:oil_helper_app/pages/history_page.dart';
import 'package:oil_helper_app/pages/lubes_page.dart';
import 'package:oil_helper_app/pages/manufacturer_page.dart';
import 'package:oil_helper_app/pages/settings_page.dart';
import 'package:oil_helper_app/pages/home_page.dart';

import '../pages/model_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(path: '/', page: HomePage, children: [
    AutoRoute(
        path: 'lubs',
        name: 'LubsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: FuelTypePage),
          AutoRoute(path: ':fuelType', page: ManufacturerPage),
          AutoRoute(path: ':fuelType/:manufacturer', page: ModelPage),
          AutoRoute(
              path: ':fuelType/:manufacturer/:model', page: EngineTypePage),
          AutoRoute(
              path: ':fuelType/:manufacturer/:model/:engineType/:isHistoryPage',
              page: LubesPage),
        ]),
    AutoRoute(path: 'faq', name: 'FaqRouter', page: EmptyRouterPage, children: [
      AutoRoute(path: '', page: FaqPage),
      AutoRoute(path: ':id', page: FaqAnswerPage),
    ]),
    AutoRoute(
        path: 'history',
        name: 'HistoryRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: HistoryPage),
          AutoRoute(
              path: ':fuelType/:manufacturer/:model/:engineType/:isHistoryPage',
              page: LubesPage),
        ]),
    AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: SettingsPage),
        ]),
  ])
])
class $AppRouter {}
