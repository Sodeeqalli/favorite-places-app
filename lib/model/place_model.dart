import 'dart:io';

class Place {
  String id;
  String name;
  final File image;
  Place({
    required this.id,
    required this.name,
    required this.image
  });
}
