import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/filtered_screen.dart';
import 'package:travel_app/screens/taps_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 110,
            child: Text(
              'دليلك السياحي',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
               Navigator.of(context).pushReplacementNamed(
                TapsScreen.screenRoute,
               );
            },
            leading: Icon(
              Icons.card_travel,
              color: Colors.blue,
            ),
            title: Text('الرحلات'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                FilteredScreen.screenRoute,
               );
            },
            leading: Icon(
              Icons.filter_list,
              color: Colors.blue,
            ),
            title: Text('الفلترة'),
          )
        ],
      ),
    );
  }
}
