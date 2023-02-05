import 'package:flutter/material.dart';
import 'package:geo_tracker/screens/home/screen/cubit/home_cubit.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geo_tracker/screens/home/screen/widgets/burger_menu.dart';

// ---Text---
const String _title = 'geo tracker';
const String _errorDeterminePosition = 'Location services are disabled.';
const String _errorCheckPermission =
    'Location permissions are permanently denied, we cannot request permissions.';
const String _errorCheckDenied = 'Location permissions are denied';
const String _markerId = 'marker1';

// ---Parameters---
const double _latitude = 47.8228900;
const double _longitude = 35.1903100;
const double _zoom = 15.0;
const double _radius = 30.0;
const double _padding = 8.0;
const double _indent = 8.0;
const double _zoom10 = 10.0;
const double _height75 = 75.0;
const double _width150 = 150.0;
const double _offset = 50.0;
const double _bottom = 100.0;
const double _right = 10.0;

class HomeScreen extends StatefulWidget {
  static const _routeName = '/home-screen';

  static PageRoute<HomeScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeScreen(),
        );
      },
    );
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  GoogleMapController? _controller;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Position? _position;
  static const LatLng _center = LatLng(_latitude, _longitude);
  LatLng _myLocation = const LatLng(0, 0);
  final Set<Marker> _markers = {};
  HomeCubit get homeCubit => BlocProvider.of<HomeCubit>(context);

  @override
  void initState() {
    homeCubit.getUserInfo();
    updateMarker();
    super.initState();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(_errorDeterminePosition);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(_errorCheckPermission);
      }

      if (permission == LocationPermission.denied) {
        return Future.error(_errorCheckDenied);
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getCurrentLocation() async {
    _position = await _determinePosition();
    if (_position != null) {
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_position!.latitude, _position!.longitude),
            zoom: _zoom,
          ),
        ),
      );
      setState(() {
        _myLocation = LatLng(_position!.latitude, _position!.longitude);
        updateMarker();
      });
    } else {}
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void updateMarker() {
    _markers.add(
      Marker(
          markerId: const MarkerId(_markerId),
          position: _myLocation,
          draggable: true,
          icon: markerIcon,
          onTap: () {
            setState(() {
              _customInfoWindowController.addInfoWindow!(
                InfoCart(homeCubit: homeCubit),
                _myLocation,
              );
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title.toUpperCase()),
        centerTitle: true,
      ),
      drawer: BurgerMenu(),
      body: Stack(
        children: [
          GoogleMap(
            compassEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: _zoom10,
            ),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _controller = controller;
              _customInfoWindowController.googleMapController = controller;
            },
            markers: _markers,
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: _height75,
            width: _width150,
            offset: _offset,
          ),
          Positioned(
            bottom: _bottom,
            right: _right,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              child: const Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCart extends StatelessWidget {
  const InfoCart({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                homeCubit.state.photo,
              ),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: _indent),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    homeCubit.state.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    homeCubit.state.email,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
