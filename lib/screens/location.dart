import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController _mapController;
  final Location _location = Location();
  final LatLng _center = const LatLng(37.7381573, 29.1039378);
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: const BottomNavBar(currentIndex: 4),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  markers: markers,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(target: _center),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _location.onLocationChanged.listen((target) {
                    _mapController.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(target.latitude!, target.longitude!),
                          zoom: 15),
                    ));
                    debugPrint('${target.latitude} ${target.longitude}');
                  });
                });
              },
              iconColor: Constants.appThemeColor,
              leading: const Icon(Icons.my_location, size: 40),
              title: const Text('Mevcut Konumu Kullan'),
            ),
            const Divider(thickness: 1),
            ListTile(
              onTap: () {},
              iconColor: Constants.appThemeColor,
              leading: const Icon(Icons.directions_rounded, size: 40),
              title: const Text('Yol Tarifi Al'),
            ),
            const Divider(thickness: 1),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/shopping-list');
              },
              iconColor: Constants.appThemeColor,
              leading: const Icon(Icons.add_shopping_cart, size: 40),
              title: const Text('Markete Gir'),
            ),
            const Divider(thickness: 1),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/home-page');
              },
              iconColor: Constants.appThemeColor,
              leading: const Icon(Icons.check_circle, size: 40),
              title: const Text('Alışverişi Tamamla'),
            ),
            const Divider(thickness: 1, color: Colors.black),
          ],
        ));
  }
}
