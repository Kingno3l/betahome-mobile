import 'package:flutter/material.dart';

class explore extends StatelessWidget {
  const explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    padding: const EdgeInsets.all(10.00),
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          Image.network(
                            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/amazon-rivet-furniture-1533048038.jpg",
                            fit: BoxFit.cover,
                          ),
                          const ListTile(
                            title: Text("Furniture"),
                            subtitle: Text("data"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160.0,
                    padding: const EdgeInsets.all(10.00),
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          Image.network(
                            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/amazon-rivet-furniture-1533048038.jpg",
                            fit: BoxFit.cover,
                          ),
                          const ListTile(
                            title: Text("Furniture"),
                            subtitle: Text("data"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.network(
                  "https://www.kindpng.com/picc/m/393-3933271_advertising-logo-png-transparent-png.png"),
            ),
          ],
        ),
      ),
    );
  }
}
