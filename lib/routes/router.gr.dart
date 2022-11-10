// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i13;

import '../pages/engine_type_page.dart' as _i6;
import '../pages/faq_answer_page.dart' as _i9;
import '../pages/faq_page.dart' as _i8;
import '../pages/fuel_type_page.dart' as _i3;
import '../pages/history_page.dart' as _i10;
import '../pages/home_page.dart' as _i1;
import '../pages/lubes_page.dart' as _i7;
import '../pages/manufacturer_page.dart' as _i4;
import '../pages/model_page.dart' as _i5;
import '../pages/settings_page.dart' as _i11;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LubsRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FaqRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HistoryRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FuelTypeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FuelTypePage(),
      );
    },
    ManufacturerRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ManufacturerRouteArgs>(
          orElse: () => ManufacturerRouteArgs(
              fuelType: pathParams.getString('fuelType')));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ManufacturerPage(
          key: args.key,
          fuelType: args.fuelType,
        ),
      );
    },
    ModelRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ModelRouteArgs>(
          orElse: () => ModelRouteArgs(
                fuelType: pathParams.getString('fuelType'),
                manufacturer: pathParams.getString('manufacturer'),
              ));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ModelPage(
          key: args.key,
          fuelType: args.fuelType,
          manufacturer: args.manufacturer,
        ),
      );
    },
    EngineTypeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EngineTypeRouteArgs>(
          orElse: () => EngineTypeRouteArgs(
                fuelType: pathParams.getString('fuelType'),
                manufacturer: pathParams.getString('manufacturer'),
                model: pathParams.getString('model'),
              ));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.EngineTypePage(
          key: args.key,
          fuelType: args.fuelType,
          manufacturer: args.manufacturer,
          model: args.model,
        ),
      );
    },
    LubesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LubesRouteArgs>(
          orElse: () => LubesRouteArgs(
                fuelType: pathParams.getString('fuelType'),
                manufacturer: pathParams.getString('manufacturer'),
                model: pathParams.getString('model'),
                engineType: pathParams.getString('engineType'),
                isHistoryPage: pathParams.getBool('isHistoryPage'),
              ));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.LubesPage(
          key: args.key,
          fuelType: args.fuelType,
          manufacturer: args.manufacturer,
          model: args.model,
          engineType: args.engineType,
          isHistoryPage: args.isHistoryPage,
        ),
      );
    },
    FaqRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.FaqPage(),
      );
    },
    FaqAnswerRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FaqAnswerRouteArgs>(
          orElse: () => FaqAnswerRouteArgs(id: pathParams.getInt('id')));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.FaqAnswerPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.HistoryPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.SettingsPage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i12.RouteConfig(
              LubsRouter.name,
              path: 'lubs',
              parent: HomeRoute.name,
              children: [
                _i12.RouteConfig(
                  FuelTypeRoute.name,
                  path: '',
                  parent: LubsRouter.name,
                ),
                _i12.RouteConfig(
                  ManufacturerRoute.name,
                  path: ':fuelType',
                  parent: LubsRouter.name,
                ),
                _i12.RouteConfig(
                  ModelRoute.name,
                  path: ':fuelType/:manufacturer',
                  parent: LubsRouter.name,
                ),
                _i12.RouteConfig(
                  EngineTypeRoute.name,
                  path: ':fuelType/:manufacturer/:model',
                  parent: LubsRouter.name,
                ),
                _i12.RouteConfig(
                  LubesRoute.name,
                  path:
                      ':fuelType/:manufacturer/:model/:engineType/:isHistoryPage',
                  parent: LubsRouter.name,
                ),
              ],
            ),
            _i12.RouteConfig(
              FaqRouter.name,
              path: 'faq',
              parent: HomeRoute.name,
              children: [
                _i12.RouteConfig(
                  FaqRoute.name,
                  path: '',
                  parent: FaqRouter.name,
                ),
                _i12.RouteConfig(
                  FaqAnswerRoute.name,
                  path: ':id',
                  parent: FaqRouter.name,
                ),
              ],
            ),
            _i12.RouteConfig(
              HistoryRouter.name,
              path: 'history',
              parent: HomeRoute.name,
              children: [
                _i12.RouteConfig(
                  HistoryRoute.name,
                  path: '',
                  parent: HistoryRouter.name,
                ),
                _i12.RouteConfig(
                  LubesRoute.name,
                  path:
                      ':fuelType/:manufacturer/:model/:engineType/:isHistoryPage',
                  parent: HistoryRouter.name,
                ),
              ],
            ),
            _i12.RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: HomeRoute.name,
              children: [
                _i12.RouteConfig(
                  SettingsRoute.name,
                  path: '',
                  parent: SettingsRouter.name,
                )
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class LubsRouter extends _i12.PageRouteInfo<void> {
  const LubsRouter({List<_i12.PageRouteInfo>? children})
      : super(
          LubsRouter.name,
          path: 'lubs',
          initialChildren: children,
        );

  static const String name = 'LubsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FaqRouter extends _i12.PageRouteInfo<void> {
  const FaqRouter({List<_i12.PageRouteInfo>? children})
      : super(
          FaqRouter.name,
          path: 'faq',
          initialChildren: children,
        );

  static const String name = 'FaqRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HistoryRouter extends _i12.PageRouteInfo<void> {
  const HistoryRouter({List<_i12.PageRouteInfo>? children})
      : super(
          HistoryRouter.name,
          path: 'history',
          initialChildren: children,
        );

  static const String name = 'HistoryRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SettingsRouter extends _i12.PageRouteInfo<void> {
  const SettingsRouter({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          path: 'settings',
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i3.FuelTypePage]
class FuelTypeRoute extends _i12.PageRouteInfo<void> {
  const FuelTypeRoute()
      : super(
          FuelTypeRoute.name,
          path: '',
        );

  static const String name = 'FuelTypeRoute';
}

/// generated route for
/// [_i4.ManufacturerPage]
class ManufacturerRoute extends _i12.PageRouteInfo<ManufacturerRouteArgs> {
  ManufacturerRoute({
    _i13.Key? key,
    required String fuelType,
  }) : super(
          ManufacturerRoute.name,
          path: ':fuelType',
          args: ManufacturerRouteArgs(
            key: key,
            fuelType: fuelType,
          ),
          rawPathParams: {'fuelType': fuelType},
        );

  static const String name = 'ManufacturerRoute';
}

class ManufacturerRouteArgs {
  const ManufacturerRouteArgs({
    this.key,
    required this.fuelType,
  });

  final _i13.Key? key;

  final String fuelType;

  @override
  String toString() {
    return 'ManufacturerRouteArgs{key: $key, fuelType: $fuelType}';
  }
}

/// generated route for
/// [_i5.ModelPage]
class ModelRoute extends _i12.PageRouteInfo<ModelRouteArgs> {
  ModelRoute({
    _i13.Key? key,
    required String fuelType,
    required String manufacturer,
  }) : super(
          ModelRoute.name,
          path: ':fuelType/:manufacturer',
          args: ModelRouteArgs(
            key: key,
            fuelType: fuelType,
            manufacturer: manufacturer,
          ),
          rawPathParams: {
            'fuelType': fuelType,
            'manufacturer': manufacturer,
          },
        );

  static const String name = 'ModelRoute';
}

class ModelRouteArgs {
  const ModelRouteArgs({
    this.key,
    required this.fuelType,
    required this.manufacturer,
  });

  final _i13.Key? key;

  final String fuelType;

  final String manufacturer;

  @override
  String toString() {
    return 'ModelRouteArgs{key: $key, fuelType: $fuelType, manufacturer: $manufacturer}';
  }
}

/// generated route for
/// [_i6.EngineTypePage]
class EngineTypeRoute extends _i12.PageRouteInfo<EngineTypeRouteArgs> {
  EngineTypeRoute({
    _i13.Key? key,
    required String fuelType,
    required String manufacturer,
    required String model,
  }) : super(
          EngineTypeRoute.name,
          path: ':fuelType/:manufacturer/:model',
          args: EngineTypeRouteArgs(
            key: key,
            fuelType: fuelType,
            manufacturer: manufacturer,
            model: model,
          ),
          rawPathParams: {
            'fuelType': fuelType,
            'manufacturer': manufacturer,
            'model': model,
          },
        );

  static const String name = 'EngineTypeRoute';
}

class EngineTypeRouteArgs {
  const EngineTypeRouteArgs({
    this.key,
    required this.fuelType,
    required this.manufacturer,
    required this.model,
  });

  final _i13.Key? key;

  final String fuelType;

  final String manufacturer;

  final String model;

  @override
  String toString() {
    return 'EngineTypeRouteArgs{key: $key, fuelType: $fuelType, manufacturer: $manufacturer, model: $model}';
  }
}

/// generated route for
/// [_i7.LubesPage]
class LubesRoute extends _i12.PageRouteInfo<LubesRouteArgs> {
  LubesRoute({
    _i13.Key? key,
    required String fuelType,
    required String manufacturer,
    required String model,
    required String engineType,
    required bool isHistoryPage,
  }) : super(
          LubesRoute.name,
          path: ':fuelType/:manufacturer/:model/:engineType/:isHistoryPage',
          args: LubesRouteArgs(
            key: key,
            fuelType: fuelType,
            manufacturer: manufacturer,
            model: model,
            engineType: engineType,
            isHistoryPage: isHistoryPage,
          ),
          rawPathParams: {
            'fuelType': fuelType,
            'manufacturer': manufacturer,
            'model': model,
            'engineType': engineType,
            'isHistoryPage': isHistoryPage,
          },
        );

  static const String name = 'LubesRoute';
}

class LubesRouteArgs {
  const LubesRouteArgs({
    this.key,
    required this.fuelType,
    required this.manufacturer,
    required this.model,
    required this.engineType,
    required this.isHistoryPage,
  });

  final _i13.Key? key;

  final String fuelType;

  final String manufacturer;

  final String model;

  final String engineType;

  final bool isHistoryPage;

  @override
  String toString() {
    return 'LubesRouteArgs{key: $key, fuelType: $fuelType, manufacturer: $manufacturer, model: $model, engineType: $engineType, isHistoryPage: $isHistoryPage}';
  }
}

/// generated route for
/// [_i8.FaqPage]
class FaqRoute extends _i12.PageRouteInfo<void> {
  const FaqRoute()
      : super(
          FaqRoute.name,
          path: '',
        );

  static const String name = 'FaqRoute';
}

/// generated route for
/// [_i9.FaqAnswerPage]
class FaqAnswerRoute extends _i12.PageRouteInfo<FaqAnswerRouteArgs> {
  FaqAnswerRoute({
    _i13.Key? key,
    required int id,
  }) : super(
          FaqAnswerRoute.name,
          path: ':id',
          args: FaqAnswerRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'FaqAnswerRoute';
}

class FaqAnswerRouteArgs {
  const FaqAnswerRouteArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final int id;

  @override
  String toString() {
    return 'FaqAnswerRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.HistoryPage]
class HistoryRoute extends _i12.PageRouteInfo<void> {
  const HistoryRoute()
      : super(
          HistoryRoute.name,
          path: '',
        );

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}
