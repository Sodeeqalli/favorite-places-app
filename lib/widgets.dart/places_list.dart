import 'package:favourite_places/model/place_model.dart';
import 'package:favourite_places/screen/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;
  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: FileImage(places[index].image),
              ),
              title: Text(
                places[index].name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlaceDetailScreen(
                      place: places[index],
                    ),
                  ),
                );
              },
            ));
  }
}
