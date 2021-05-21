import 'package:location_tracker/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _mapController;
  // Marker _origin;
  // Marker _destination;
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: false,
      body: (locationProvider.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red[200]),
              ),
            )
          : Stack(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20)),
              GoogleMap(
                padding: const EdgeInsets.symmetric(vertical: 290),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                // markers: {
                //   if (_origin != null) _origin,
                //   if (_destination != null) _destination
                // },
                //onLongPress: _addMarker,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    locationProvider.currentLocation.latitude,
                    locationProvider.currentLocation.longitude,
                  ),
                  zoom: 15,
                ),
                onMapCreated: (controller) {
                  controller.setMapStyle(Utils.mapStyle);
                  setState(() {
                    _mapController = controller;
                  });
                },
              ),
              // Positioned(
              //   left: 15,
              //   top: 45,
              //   right: 15,
              //   child: Card(
              //     shadowColor: Colors.grey[300],
              //     elevation: 06,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5)),
              //     child: TextField(
              //       cursorColor: Colors.pink[200],
              //       decoration: InputDecoration(
              //           contentPadding:
              //               const EdgeInsets.only(left: 15, top: 15),
              //           filled: true,
              //           fillColor: Colors.white,
              //           hintText: 'Search Here',
              //           hintStyle: TextStyle(color: Colors.red[100]),
              //           suffixIcon: IconButton(
              //             onPressed: () {},
              //             icon: Icon(
              //               Icons.search_rounded,
              //               color: Colors.red[200],
              //             ),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //               borderSide: BorderSide(color: Colors.white),
              //               borderRadius: BorderRadius.circular(5)),
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5),
              //             borderSide: BorderSide(color: Colors.white),
              //           )),
              //     ),
              //   ),
              // ),
            ]),
      floatingActionButton: FloatingActionButton(
        elevation: 05,
        child: Icon(Icons.location_pin),
        backgroundColor: Colors.red[600],
        onPressed: () => _mapController
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            locationProvider.currentLocation.latitude,
            locationProvider.currentLocation.longitude,
          ),
          zoom: 16,
        ))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  // void _addMarker(LatLng pos) {
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Current Position'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(
  //             BitmapDescriptor.hueMagenta),
  //         position: pos,
  //       );
  //       _destination = null;
  //     });
  //   } else {
  //     setState(() {
  //       _destination = Marker(
  //         markerId: MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Your Destination'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
  //         position: pos,
  //       );
  //     });
  //   }
  // }
}

class Utils {
  static String mapStyle = '''
[
  {
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.attraction",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels.icon",
    "stylers": [
      {
        "color": "#f0938e"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f0938e"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "stylers": [
      {
        "color": "#bbecbb"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "simplified"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#899089"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#fafafa"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "simplified"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "simplified"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "labels.icon",
    "stylers": [
      {
        "color": "#57abf4"
      },
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#57abf4"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "stylers": [
      {
        "color": "#f5c7c7"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "labels.icon",
    "stylers": [
      {
        "color": "#3b4444"
      },
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757a7a"
      },
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "water",
    "stylers": [
      {
        "color": "#adb8f0"
      },
      {
        "visibility": "on"
      }
    ]
  }
]
 ''';
}
