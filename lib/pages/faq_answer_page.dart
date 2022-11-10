import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/repository/faq_repository.dart';
import '../managers/locale_manager.dart';
import '../models/faq.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FaqAnswerPage extends ConsumerWidget {
  final int id;

  const FaqAnswerPage({
    Key? key,
    @PathParam() required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.read(localeManagerProvider.notifier).getLocale();

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.answer_title),
        ),
        body: FutureBuilder<FAQ>(
          future: FaqRepository.instance.getFaqAnswer(id, locale),
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      snapshot.data != null ? snapshot.data!.answer : 'Empty',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 80,
                  ),
                )
              ],
            );
          },
        ));
  }
}
