import 'package:barbora_app/models/stock.dart';
import 'package:flutter/material.dart';

class StockDetailView extends StatelessWidget {
  final Stock stock;

  const StockDetailView({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          size: 50,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_basket,
                          size: 30,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, 'not_existant'),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Hero(
                      tag: stock.id,
                      child: Image.network(
                        stock.imageUrl,
                        width: MediaQuery.of(context).size.width * .7,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Text('😢');
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        stock.name,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    "PLACEHOLDER",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        stock.price,
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: Text(
                        "Add To Cart",
                        style: Theme.of(context).textTheme.button!.apply(
                              color: Colors.white,
                            ),
                      ),
                      onPressed: () {},
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
