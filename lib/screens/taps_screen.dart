import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';

import 'favorite_screen.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key});

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  void selectedScreen(int index) {
    setState(() {
      selectedOne =index;
    });
  }

  int selectedOne = 0;
  final List<Widget> screens = [
    CategoryScreen(),
    FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الرحلات',style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: screens[selectedOne],
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
