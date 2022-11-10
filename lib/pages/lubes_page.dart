import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oil_helper_app/repository/lube_repository.dart';
import 'package:oil_helper_app/widgets/lube_card.dart';
import '../models/car.dart';
import '../repository/car_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LubesPage extends StatelessWidget {
  final String fuelType;
  final String manufacturer;
  final String model;
  final String engineType;
  final bool isHistoryPage;

  const LubesPage({
    Key? key,
    @PathParam() required this.fuelType,
    @PathParam() required this.manufacturer,
    @PathParam() required this.model,
    @PathParam() required this.engineType,
    @PathParam() required this.isHistoryPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.lubes_title),
        actions: !isHistoryPage
            ? [
                IconButton(
                    onPressed: () {
                      context.router.popUntilRoot();
                    },
                    icon: const Icon(Icons.refresh))
              ]
            : [],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${AppLocalizations.of(context)!.fuel_type_title}: ${getText(fuelType, context)}',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                      '${AppLocalizations.of(context)!.manufacturer_title}: $manufacturer',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text('${AppLocalizations.of(context)!.model_title}: $model',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                      '${AppLocalizations.of(context)!.engine_type_title}: $engineType',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
          FutureBuilder<Car>(
            future: CarRepository.instance.getCarsListByEngineType(
                fuelType, manufacturer, model, engineType),
            builder: (context, car) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  switch (index) {
                    case 0:
                      return LubeCard(
                        lube: LubeRepository.instance
                            .getLukoilLube(car.data!.lukoilLubeID),
                        screenWidth: width,
                      );
                    case 1:
                      return LubeCard(
                        lube: LubeRepository.instance
                            .getGazpromLube(car.data!.gazpromLubeID),
                        screenWidth: width,
                      );
                    case 2:
                      return LubeCard(
                        lube: LubeRepository.instance
                            .getRosneftLube(car.data!.rosneftLubeID),
                        screenWidth: width,
                      );
                    default:
                      return Container();
                  }
                }, childCount: car.data != null ? 3 : 0),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
  }

  String getText(String fuelType, BuildContext context) {
    switch (fuelType) {
      case 'Petrol':
        return AppLocalizations.of(context)!.fuel_type_petrol;
      case 'Diesel':
        return AppLocalizations.of(context)!.fuel_type_diesel;
      default:
        return 'Empty';
    }
  }
}
