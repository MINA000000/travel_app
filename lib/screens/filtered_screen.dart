import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FilteredScreen extends StatefulWidget {
  const FilteredScreen({super.key});
  static const String screenRoute = '/filtered-screen';

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
  bool isSummer = false;

  bool isWinter = false;

  bool isForFamily = false;

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
              'الرحلات الصيفية فقط', 'اظهار الرحلات فى فصل الصيف فقط',isSummer, (newValue) {
            setState(() {
              isSummer = newValue;
            });
          }),
          buildSwitchListTile(
              'الرحلات الشتائية فقط', 'اظهار الرحلات فى فصل الشتاء فقط',isWinter, (newValue) {
            setState(() {
              isWinter = newValue;
            });
          }),
          buildSwitchListTile(
              'الرحلات العائلية', 'اظهار الرحلات العائلية فقط',isForFamily, (newValue) {
            setState(() {
              isForFamily = newValue;
            });
          }),
        ],
      ),
      
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subTitle,bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged:(value) => updateValue(value),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
