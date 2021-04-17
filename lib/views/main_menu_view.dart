import 'package:barbora_app/views/cached_stock_list_view.dart';
import 'package:barbora_app/views/lazy_stock_list_view.dart';
import 'package:flutter/material.dart';

class MainMenuView extends StatefulWidget {
  MainMenuView({Key? key}) : super(key: key);

  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Barbora App',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'LAZY LIST',
              ),
              Tab(
                text: 'CACHED LIST',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LazyStockListView(),
            CachedStockListView(),
          ],
        ),
      ),
    );
  }
}
