import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import '../models/car.dart';
import '../repository/car_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ManufacturerPage extends StatelessWidget {
  final String fuelType;

  const ManufacturerPage({
    Key? key,
    @PathParam() required this.fuelType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.manufacturer_title),
      ),
      body: FutureBuilder<List<Car>>(
          future: CarRepository.instance.getCarsListByFuelType(fuelType),
          builder: ((context, snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: width / 2,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 16),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      context.router.push(ModelRoute(
                          fuelType: fuelType,
                          manufacturer: snapshot.data![index].manufacturer));
                    },
                    child: Card(
                      margin: index % 2 == 0
                          ? const EdgeInsets.only(top: 16, left: 16)
                          : const EdgeInsets.only(top: 16, right: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            getImage(snapshot.data![index].manufacturer)),
                      ),
                    ),
                  );
                }));
          })),
    );
  }

  String getImage(String manufacturer) {
    switch (manufacturer) {
      case 'Audi':
        return 'assets/audi_logo.png';
      case 'BMW':
        return 'assets/bmw_logo.png';
      case 'LADA':
        return 'assets/lada_logo.png';
      case 'Mercedes-Benz':
        return 'assets/mercedes_benz_logo.png';
      case 'KIA':
        return 'assets/kia_logo.png';
      case 'Ford':
        return 'assets/ford_logo.png';
      default:
        return 'assets/not_available_image.png';
    }
  }
}
