import 'package:barbora_app/views/lazy_stock_list_view.dart';
import 'package:barbora_app/views/main_menu_view.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'models/stock.dart';
import 'views/stock_detail_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.initialRoute:
        return MaterialPageRoute(
          builder: (_) => MainMenuView(),
        );
      case AppRoutes.lazyList:
        return MaterialPageRoute(
          builder: (_) => LazyStockListView(),
        );
      case AppRoutes.cachedList:
        return MaterialPageRoute(
          builder: (_) => LazyStockListView(),
        );
      case AppRoutes.stockDetail:
        return MaterialPageRoute(
          builder: (_) => StockDetailView(
            stock: settings.arguments as Stock,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Nothing to see here. Go home!'),
            ),
          ),
        );
    }
  }
}

class AppRoutes {
  static const String lazyList = '/lazy-list';
  static const String cachedList = '/cached-list';
  static const String stockDetail = '/stock-detail';
}
