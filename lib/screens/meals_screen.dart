import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  static const String id = 'meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryName = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Yummy!'),
      ),
    );
  }
}
