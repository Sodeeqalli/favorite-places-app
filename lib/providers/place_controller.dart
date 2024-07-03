import 'package:favourite_places/model/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placesProvider =
    StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  return PlacesNotifier([]);
});

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier(List<Place> places) : super(places);

  void addPlace(Place place) {
    state = [place, ...state];
  }
}
