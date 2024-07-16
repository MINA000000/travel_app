import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_trip_screen.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;
  const CategoryItem(this.id,this.imageUrl, this.title);
  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryTripScreen.screenRoute,
      arguments: {
        'id' : id,
        'title' : title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 300.0,
              width: 300.0,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
