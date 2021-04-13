import 'package:flutter/material.dart';
import 'quote_list.dart';

void main() => runApp(Quotes());

class Quotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
        centerTitle: true,
      ),
      body: QuotesList(),
    );
  }
}
