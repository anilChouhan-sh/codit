import 'package:flutter/material.dart';
import 'package:frontend/drawer.dart';
import 'package:frontend/productScreen.dart';

import 'model/product.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductScreen();
                  }));
                },
                child: Text("Products")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductScreen();
                  }));
                },
                child: Text("Category"))
          ],
        ),
      ),
    );
  }
}
