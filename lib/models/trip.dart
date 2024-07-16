enum Season { Winter, Summer, Spring, Autumn }

enum TripType { Exploration, Recovery, Activities, Therapy }

class Trip {
  final String id;
  final String title;
  final TripType tripType;
  final String imageUrl;
  final Season season;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final List<String> categories;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip(
      {required this.id,
      required this.title,
      required this.tripType,
      required this.imageUrl,
      required this.season,
      required this.activities,
      required this.program,
      required this.duration,
      required this.categories,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
