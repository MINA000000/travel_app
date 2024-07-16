import 'package:flutter/material.dart';
import 'package:travel_app/widgets/trip_item.dart';

import '../app_data.dart';

class CategoryTripScreen extends StatelessWidget {
  static const screenRoute = 'category-trip-screen';
  @override
  Widget build(BuildContext context) {
    final rr =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String? categoryTitle = rr['title'];
    String? categoryId = rr['id'];
    final filteredData =
        Trips_data.where((element) => element.categories.contains(categoryId))
            .toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
              id: filteredData[index].id,
              title: filteredData[index].title,
              imageUrl: filteredData[index].imageUrl,
              duration: filteredData[index].duration,
              season: filteredData[index].season,
              tripType: filteredData[index].tripType);
        },
        itemCount: filteredData.length,
      ),
    );
  }
}
