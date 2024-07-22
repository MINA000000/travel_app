import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FilteredScreen extends StatefulWidget {
  const FilteredScreen({super.key});
  static const String screenRoute = '/filtered-screen';
  static bool isSummer = false;
  static bool isWinter = false;
  static bool isForFamily = false;

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'اعدادات الفلترة',
          style: TextStyle(
              fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildSwitchListTile(
            'الرحلات الصيفية فقط',
            'اظهار الرحلات فى فصل الصيف فقط',
            FilteredScreen.isSummer,
            (newValue) {
              setState(() {
                FilteredScreen.isSummer = newValue;
              });
            },
          ),
          buildSwitchListTile(
            'الرحلات الشتائية فقط',
            'اظهار الرحلات فى فصل الشتاء فقط',
            FilteredScreen.isWinter,
            (newValue) {
              setState(() {
                FilteredScreen.isWinter = newValue;
              });
            },
          ),
          buildSwitchListTile(
            'الرحلات العائلية',
            'اظهار الرحلات العائلية فقط',
            FilteredScreen.isForFamily,
            (newValue) {
              setState(() {
                FilteredScreen.isForFamily = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (value) => updateValue(value),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
