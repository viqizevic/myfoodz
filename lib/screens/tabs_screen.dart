import 'package:flutter/material.dart';
import 'package:myfoodz/models/category.dart';
import 'package:myfoodz/models/meal.dart';
import 'package:myfoodz/screens/categories_screen.dart';
import 'package:myfoodz/screens/favorites_screen.dart';
import 'package:myfoodz/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'main_tabs';

  final List<Category> availableCategories;
  final List<Meal> favoriteMeals;

  TabsScreen(this.availableCategories, this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages;

  @override
  initState() {
    _pages = [
      {
        'page': CategoriesScreen(widget.availableCategories),
        'title': 'All Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
