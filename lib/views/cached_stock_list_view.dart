import 'package:barbora_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../constants.dart';
import '../widgets/card_items.dart';

class CachedStockListView extends StatefulWidget {
  CachedStockListView({Key? key}) : super(key: key);

  @override
  _CachedStockListViewState createState() => _CachedStockListViewState();
}

class _CachedStockListViewState extends State<CachedStockListView>
    with AutomaticKeepAliveClientMixin<CachedStockListView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _prov = context.read(cachedStockDataProvider);
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
                watch(cachedStockDataProvider);

                return LazyLoadScrollView(
                  onEndOfPage: () => _prov.fetchData(),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: _prov.stockList.length,
                    itemBuilder: (context, index) {
                      return MenuTileCard(
                        stock: _prov.stockList[index],
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
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
