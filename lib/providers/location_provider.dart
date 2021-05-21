import 'package:location_tracker/modals/geolocator_model.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  final geoLocatorModel = GeolocatorModel();

  //variables
  Position currentLocation;
  LocationProvider() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorModel.getCurrentLocation();
    notifyListeners();
  }
}
