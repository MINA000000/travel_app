import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_detailed_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
  });
  String get SeasonText {
    if (season == Season.Winter) return 'شتاء';
    if (season == Season.Summer) return 'صيف';
    if (season == Season.Spring) return 'ربيع';
    if (season == Season.Autumn) return 'خريف';
    return "";
  }

  String get TripTypeText {
    if (tripType == TripType.Activities) return 'انشطة';
    if (tripType == TripType.Exploration) return 'استكشاف';
    if (tripType == TripType.Recovery) return 'علاج';
    if (tripType == TripType.Therapy) return 'تأمل';
    return "";
  }

  void selectedItem(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripDetailedScreen.screenRoute, arguments: id)
        .then((value) {
      if (value != null) {
        // removeItem(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedItem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(.8)
                      ],
                      stops: [
                        .6,
                        1
                      ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$duration ايام'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(SeasonText),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.family_restroom,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(TripTypeText),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
