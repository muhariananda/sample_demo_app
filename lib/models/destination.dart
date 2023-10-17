import 'package:hive/hive.dart';

part 'destination.g.dart';

@HiveType(typeId: 0)
class Destination {
  Destination({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final int price;

  @HiveField(3)
  final double rating;

  @HiveField(4)
  final String imagePath;
}
