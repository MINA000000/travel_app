import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

import '../app_data.dart';

class CategoryTripScreen extends StatefulWidget {
  static const screenRoute = 'category-trip-screen';

  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Trip> filteredData = [];
  String? categoryTitle = "";
  String? categoryId = "";
  @override
  void didChangeDependencies() {
    final rr =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = rr['title'];
    categoryId = rr['id'];
    filteredData =
        Trips_data.where((element) => element.categories.contains(categoryId))
            .toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void removeItem(String tripId) {
    setState(() {
      
    filteredData.removeWhere((element) => element.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
              removeItem: removeItem,
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
