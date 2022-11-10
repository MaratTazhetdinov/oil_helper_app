import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oil_helper_app/models/request.dart';
import 'package:oil_helper_app/repository/request_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/managers/request_manager.dart';
import 'package:oil_helper_app/managers/request_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../routes/router.gr.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar:
            AppBar(title: Text(AppLocalizations.of(context)!.history_title)),
        body: FutureBuilder<List<Request>>(
          future: ref.watch(requestManagerProvider) is InitialState
              ? RequestRepository.instance.getRequestsList()
              : _updateList(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: ((context, index) {
                  return InkWell(
                    child: Card(
                      margin: index != snapshot.data!.length - 1
                          ? const EdgeInsets.only(left: 16, right: 16, top: 16)
                          : const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data![index].date,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${AppLocalizations.of(context)!.fuel_type_title}: ${getText(snapshot.data![index].fuelType, context)}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.manufacturer_title}: ${snapshot.data![index].manufacturer}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.model_title}: ${snapshot.data![index].model}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.engine_type_title}: ${snapshot.data![index].engineType}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      context.router.push(LubesRoute(
                          fuelType: snapshot.data![index].fuelType,
                          manufacturer: snapshot.data![index].manufacturer,
                          model: snapshot.data![index].model,
                          engineType: snapshot.data![index].engineType,
                          isHistoryPage: true));
                    },
                  );
                }));
          },
        ));
  }

  Future<List<Request>> _updateList() {
    return RequestRepository.instance.getRequestsList();
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
