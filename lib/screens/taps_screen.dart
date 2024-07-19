import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/widgets/app_drawer.dart';

import 'favorite_screen.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key});
  static const String screenRoute = '/taps-screen';
  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  
  void selectedScreen(int index) {
    setState(() {
      selectedOne = index;
    });
  }

  int selectedOne = 0;
  final List<Map<String, Object>> screens = [
    {'Screen': CategoryScreen(), 'Title': 'تصنيفات الرحلات'},
    {'Screen': FavoriteScreen(), 'Title': 'الرحلات المفضلة'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          screens[selectedOne]['Title'] as String,
          style: TextStyle(
              fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: screens[selectedOne]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedScreen,
        currentIndex: selectedOne,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'التفضيلات',
          )
        ],
      ),
    );
  }
}
