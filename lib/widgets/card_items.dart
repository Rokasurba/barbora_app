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
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        elevation: 10.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.network(
                stock.imageUrl,
                height: 170,
                width: 200,
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.bottomCenter,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Text('😢'),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 170),
                child: Center(
                  child: Text(
                    stock.price,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
