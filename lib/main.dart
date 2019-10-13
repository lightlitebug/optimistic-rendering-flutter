import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optimistic Rendering Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _favorited = false;

  Future<bool> _toggleFavorite() async {
    this.setState(() => _favorited = !_favorited);

    final int genNum = Random().nextInt(100);
    await Future.delayed(Duration(seconds: 2));

    print('genrated random number ${genNum}');

    return genNum % 2 == 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Optimistic Rendering'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(
            _favorited ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () async {
            bool result = await _toggleFavorite();
            if (result == false) {
              this.setState(() => _favorited = !_favorited);
            }
          },
          iconSize: 120,
        ),
      ),
    );
  }
}
