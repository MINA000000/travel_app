import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  static List<Trip> favoriteTrips = [];
  @override
  Widget build(BuildContext context) {
    // for (int i = 0; i < favoriteList.length; i++) print(favoriteList[i]);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
              id: favoriteTrips[index].id,
              title: favoriteTrips[index].title,
              imageUrl: favoriteTrips[index].imageUrl,
              duration: favoriteTrips[index].duration,
              season: favoriteTrips[index].season,
              tripType: favoriteTrips[index].tripType);
        },
        itemCount: favoriteTrips.length,
      ),
    );
  }
}
