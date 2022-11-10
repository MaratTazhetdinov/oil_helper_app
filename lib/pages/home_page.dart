import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oil_helper_app/routes/router.gr.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: const [
        LubsRouter(),
        FaqRouter(),
        HistoryRouter(),
        SettingsRouter()
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
              Colors.white,
          items: const [
            Icon(
              Icons.oil_barrel_rounded,
              color: Colors.white,
            ),
            Icon(
              Icons.question_mark,
              color: Colors.white,
            ),
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }

  String setPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Fuel Type';
      case 1:
        return 'FAQ';
      case 2:
        return 'History';
      case 3:
        return 'Settings';
      default:
        return '';
    }
  }
}
