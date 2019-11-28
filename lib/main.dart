import 'package:flutter/material.dart';
import 'package:myfoodz/models/category.dart';
import 'package:myfoodz/models/meal.dart';
import 'package:myfoodz/models/dummy_data.dart';
import 'package:myfoodz/screens/filters_screen.dart';
import 'package:myfoodz/screens/meal_detail_screen.dart';
import 'package:myfoodz/screens/meals_screen.dart';
import 'package:myfoodz/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Category> _availableCategories = DUMMY_CATEGORIES;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      home: TabsScreen(_availableCategories),
      routes: {
        TabsScreen.id: (ctx) => TabsScreen(_availableCategories),
        MealsScreen.id: (ctx) => MealsScreen(_availableMeals),
        MealDetailScreen.id: (ctx) => MealDetailScreen(),
        FiltersScreen.id: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
