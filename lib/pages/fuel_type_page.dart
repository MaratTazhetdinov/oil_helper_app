import 'package:flutter/material.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import '../models/car.dart';
import '../repository/car_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FuelTypePage extends StatelessWidget {
  const FuelTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.fuel_type_title),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.2, right: width * 0.2, top: width * 0.2),
        child: FutureBuilder<List<Car>>(
            future: CarRepository.instance.getCarsList(),
            builder: ((context, snapshot) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          context.router.push(ManufacturerRoute(
                              fuelType: snapshot.data![index].fuelType));
                        },
                        child: SizedBox(
                          height: width * 0.6,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  getImage(snapshot.data![index].fuelType),
                                  height: width * 0.4,
                                ),
                                Text(
                                  getText(
                                      snapshot.data![index].fuelType, context),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }));
            })),
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

  String getImage(String fuelType) {
    switch (fuelType) {
      case 'Petrol':
        return 'assets/petrol_engine_image.png';
      case 'Diesel':
        return 'assets/diesel_engine_image.png';
      default:
        return 'assets/not_available_image.png';
    }
  }
}
