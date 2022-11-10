import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oil_helper_app/managers/request_manager.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import '../models/car.dart';
import '../repository/car_repository.dart';
import 'package:oil_helper_app/extensions/date_time_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EngineTypePage extends ConsumerWidget {
  final String fuelType;
  final String manufacturer;
  final String model;

  const EngineTypePage({
    Key? key,
    @PathParam() required this.fuelType,
    @PathParam() required this.manufacturer,
    @PathParam() required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.engine_type_title),
      ),
      body: FutureBuilder<List<Car>>(
          future: CarRepository.instance
              .getCarsListByModel(fuelType, manufacturer, model),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: ((context, index) {
                  return InkWell(
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          snapshot.data![index].engineType,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    onTap: () {
                      final String date = DateTime.now().formatDate();
                      ref.read(requestManagerProvider.notifier).addRequest(
                          fuelType,
                          manufacturer,
                          model,
                          snapshot.data![index].engineType,
                          date);
                      context.router.push(LubesRoute(
                          fuelType: fuelType,
                          manufacturer: manufacturer,
                          model: model,
                          engineType: snapshot.data![index].engineType,
                          isHistoryPage: false));
                    },
                  );
                }));
          })),
    );
  }
}
