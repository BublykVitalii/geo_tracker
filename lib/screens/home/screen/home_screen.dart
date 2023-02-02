import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geo_tracker/screens/home/screen/widgets/burger_menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ---Text---
const String _title = 'geo tracker';

class HomeScreen extends StatefulWidget {
  static const _routeName = '/home-screen';

  static PageRoute<HomeScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const HomeScreen();
      },
    );
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _controller;
  static const LatLng _center = LatLng(47.8228900, 35.1903100);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title.toUpperCase()),
        centerTitle: true,
      ),
      drawer: BurgerMenu(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 10,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
