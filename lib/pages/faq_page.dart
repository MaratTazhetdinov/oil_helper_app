import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/models/faq.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import '../managers/locale_manager.dart';
import '../repository/faq_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FaqPage extends ConsumerWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.read(localeManagerProvider.notifier).getLocale();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.faq_title),
      ),
      body: FutureBuilder<List<FAQ>>(
          future: FaqRepository.instance.getFaqList(locale),
          builder: ((context, snapshot) {
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
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          snapshot.data![index].question,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    onTap: () {
                      context.router
                          .push(FaqAnswerRoute(id: snapshot.data![index].id));
                    },
                  );
                }));
          })),
    );
  }
}
