import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/managers/locale_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oil_helper_app/managers/locale_state.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings_title)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 20,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.language_option,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ]),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                ref
                                    .read(localeManagerProvider.notifier)
                                    .setEngLanguage();
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    ref.watch(localeManagerProvider)
                                                is EngState ||
                                            ref
                                                    .read(localeManagerProvider
                                                        .notifier)
                                                    .getLocale()
                                                    .languageCode ==
                                                'en'
                                        ? const Color(0xFFED1B34)
                                        : Colors.transparent,
                                side: const BorderSide(color: Colors.grey),
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: Text('ENG',
                                  style:
                                      Theme.of(context).textTheme.titleMedium)),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            onPressed: () {
                              ref
                                  .read(localeManagerProvider.notifier)
                                  .setRusLanguage();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ref.watch(localeManagerProvider)
                                          is RusState ||
                                      ref
                                              .read(localeManagerProvider
                                                  .notifier)
                                              .getLocale()
                                              .languageCode ==
                                          'ru'
                                  ? const Color(0xFFED1B34)
                                  : Colors.transparent,
                              side: const BorderSide(color: Colors.grey),
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: Text('RUS',
                                style: Theme.of(context).textTheme.titleMedium),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
