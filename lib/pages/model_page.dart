import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import '../models/car.dart';
import '../repository/car_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModelPage extends StatelessWidget {
  final String fuelType;
  final String manufacturer;

  const ModelPage({
    Key? key,
    @PathParam() required this.fuelType,
    @PathParam() required this.manufacturer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.model_title),
      ),
      body: FutureBuilder<List<Car>>(
          future: CarRepository.instance
              .getCarsListByManufacturer(fuelType, manufacturer),
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
                          snapshot.data![index].model,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    onTap: () {
                      context.router.push(EngineTypeRoute(
                          fuelType: fuelType,
                          manufacturer: manufacturer,
                          model: snapshot.data![index].model));
                    },
                  );
                }));
          })),
    );
  }
}
