import 'package:barbora_app/models/stock.dart';
import 'package:flutter/material.dart';

class StockDetailView extends StatelessWidget {
  final Stock stock;

  const StockDetailView({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Please buy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  stock.name,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Card(
                        elevation: 40,
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            stock.imageUrl,
                            width: 200,
                            height: 200,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Text('😢');
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              stock.price,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              '10.10 \$/L',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '10.10 \$/L',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedIconButton(
                      icon: Icons.remove,
                      iconSize: 30,
                      onPress: () {},
                    ),
                    Container(
                      width: 30,
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    RoundedIconButton(
                      icon: Icons.add,
                      iconSize: 30,
                      onPress: () {},
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text('Į krepšelį'),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'KARTU NEREKOMENDUOJAME',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text('NEVER'),
            SizedBox(
              height: 50,
            ),
            Text('GONNA'),
            SizedBox(
              height: 50,
            ),
            Text('GIVE'),
            SizedBox(
              height: 50,
            ),
            Text('YOU'),
            SizedBox(
              height: 50,
            ),
            Text('UP'),
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {required this.icon, required this.onPress, required this.iconSize});

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: () {
        print('yes');
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(iconSize * 0.2),
      ),
      fillColor: Colors.grey,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
