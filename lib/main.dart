import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/category_trip_screen.dart';
import 'package:travel_app/screens/filtered_screen.dart';
import 'package:travel_app/screens/taps_screen.dart';
import 'package:travel_app/screens/trip_detailed_screen.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: CategoryScreen(),
      routes: {
        '/' : (context) => TapsScreen(),
        CategoryTripScreen.screenRoute : (ctx) => CategoryTripScreen(),
        TripDetailedScreen.screenRoute : (ctx) => TripDetailedScreen(),
        TapsScreen.screenRoute : (ctx) =>  TapsScreen(),
        FilteredScreen.screenRoute : (ctx) => FilteredScreen(),
      },
    );
  }
}
