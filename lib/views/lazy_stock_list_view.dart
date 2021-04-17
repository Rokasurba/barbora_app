import 'package:barbora_app/providers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../constants.dart';
import '../widgets/card_items.dart';

class LazyStockListView extends StatefulWidget {
  LazyStockListView({Key? key}) : super(key: key);

  @override
  _LazyStockListViewState createState() => _LazyStockListViewState();
}

class _LazyStockListViewState extends State<LazyStockListView>
    with AutomaticKeepAliveClientMixin<LazyStockListView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final _prov = context.read(stockDataProvider);

    return FutureBuilder(
      future: _prov.loadInitData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            color: Constants.lightBackground,
            child: Consumer(
              builder: (context, watch, child) {
                watch(stockDataProvider);

                return LazyLoadScrollView(
                  onEndOfPage: () => _prov.fetchData(),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: _prov.stockList.length,
                    itemBuilder: (context, index) {
                      return MenuTileCard(
                        stock: _prov.stockList[index],
                      );
                    },
                  ),
                );
              },
            ),
          );
        }
        return Container(
          child: Center(
            child: Text('Error while fetching data. Tap to try again!'),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
