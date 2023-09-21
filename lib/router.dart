import 'package:ecshop_techpit/pages/home_page/home_page.dart';
import 'package:ecshop_techpit/pages/item_page/item_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) => GoRouter(
      routes: [
        GoRoute(
          path: HomePage.path, //HomePage.path
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: ItemPage.path,
              builder: (context, state) => ItemPage(
                id: state.uri.queryParameters[ItemPage.params] ??
                    'default_value',
              ),
            )
          ],
        ),
      ],
    ));
