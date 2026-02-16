import 'dart:async';
import 'dart:developer';

import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinLocationView extends StatefulWidget {
  const PinLocationView({super.key});

  @override
  State<PinLocationView> createState() => _PinLocationViewState();
}

class _PinLocationViewState extends State<PinLocationView> {
  final LatLng position = const LatLng(31.0409, 31.3785);
  final Set<Marker> markers = {};
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();

    // علشان نتأكد إن الـ Scaffold اتبني قبل ما نظهر SnackBar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _determinePosition();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    log("abdo serviceEnabled $serviceEnabled ");

    if (!serviceEnabled) {
   
      showCustomSnackBar(
        context: context,
        message: 'برجاء تفعيل خدمة الموقع ',
        backgroundColor: Colors.red,
      );
    }

    permission = await Geolocator.checkPermission();
    log("abdo permission $permission ");

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final pos = await Geolocator.getCurrentPosition();
    currentLocation = LatLng(pos.latitude, pos.longitude);
    log("abdo currentLocation $currentLocation ");
     markers.add(
      Marker(
        markerId: const MarkerId("currentLocation"),
        position: currentLocation!,
      ),
    );
    setState(() {});
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 20),
      ),
    );
    return pos;
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pin Location"),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: true, // for + - by default it is true
        initialCameraPosition: CameraPosition(
          target: currentLocation ?? position,
          zoom: currentLocation == null ? 13 : 20,
        ),
        markers: markers,
        onTap: (argument) {
          // ${argument.latitude} ==> علشان كل ما اضغط علي الخريطة يضيف علامة جديدة في المكان اللي ضغطت عليه
          markers.add(
            Marker(markerId: MarkerId("my marker"), position: argument),
          );
          setState(() {});
        },
      ),
    );
  }
}
