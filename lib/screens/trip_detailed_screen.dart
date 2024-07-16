import 'package:flutter/material.dart';

import '../app_data.dart';

class TripDetailedScreen extends StatelessWidget {
  static const String screenRoute = '/trip-detailed';
  const TripDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final tripDetailed =
        Trips_data.firstWhere((element) => element.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text(tripId),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              tripDetailed.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            alignment: Alignment.topRight,
            child: Text(
              'الانشطة',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 280,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: tripDetailed.activities.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  child: Text(tripDetailed.activities[index]),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.topRight,
            child: Text(
              'البرنامج اليومي',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 280,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: tripDetailed.program.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('اليوم${index + 1}'),
                    ),
                    title: Text(tripDetailed.program[index]),
                  ),
                  Divider()
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}