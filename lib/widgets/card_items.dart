import 'package:barbora_app/app_router.dart';
import 'package:barbora_app/models/stock.dart';
import 'package:flutter/material.dart';

class MenuTileCard extends StatelessWidget {
  final Stock stock;

  const MenuTileCard({
    Key? key,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.stockDetail, arguments: stock),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              child: Image.network(
                stock.imageUrl,
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.bottomCenter,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Text('😢'),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    stock.name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    stock.price,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
