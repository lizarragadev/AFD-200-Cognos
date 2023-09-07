import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  LatLng latLng = const LatLng(-16.500900, -68.133341); 
  final CameraPosition initialPosition = const CameraPosition(
      target: LatLng(-16.500900, -68.133341), zoom: 15.0);
  final Completer<GoogleMapController> controller = Completer();
  MapType mapType = MapType.normal;
  final Set<Marker> _markers = {};

  Position? currentPosition;
  String currentAddress = '';

  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: const MarkerId('id-1'),
        position: latLng,
        infoWindow: const InfoWindow(
          title: 'El Prado',
          snippet: 'Av. 16 de Julio',
        ),
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: initialPosition,
            mapType: mapType,
            markers: _markers,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomControlsEnabled: false,
          ),
          
          Container(
            margin: const EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(children: [
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    cambiarTipoMapa();
                  },
                  child: const Icon(Icons.layers)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    irACochabamba();
                  },
                  child: const Icon(Icons.arrow_forward)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    irALaPaz();
                  },
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    obtenerLocalizacion();
                  },
                  child: const Icon(Icons.gps_fixed)),
            ]),
          ),
        ],
      ),
      persistentFooterButtons: [
        Center(
          child: Column(
            children: [
              Text("${currentPosition?.latitude}, ${currentPosition?.longitude}"),
              Text(currentAddress)
            ],
          ),
        )
      ],
    );

  }

  void onMapCreated(GoogleMapController cont) {
      controller.complete(cont);
  }

  void cambiarTipoMapa() {
    setState(() {
      mapType = mapType == MapType.normal ? MapType.terrain : MapType.normal;
    });
  }
 
  Future<void> irACochabamba() async {
    LatLng latLng = const LatLng(-17.393538, -66.156861);
    GoogleMapController gmController = await controller.future;
    gmController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('id-3'),
          position: latLng,
          infoWindow: const InfoWindow(
            title: 'Cochabamba',
            snippet: 'Plaza Principal',
          ),
        )
      );
    });
  }

  Future<void> irALaPaz() async {
    LatLng latLng = const LatLng(-16.495631, -68.133294);
    GoogleMapController gmController = await controller.future;
    gmController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('id-3'),
          position: latLng,
          infoWindow: const InfoWindow(
            title: 'La Paz',
            snippet: 'Plaza Murillo',
          ),
        )
      );
    });
  }

  Future<void> obtenerLocalizacion() async {
    currentPosition = await determinarPosicion();
    LatLng latLng = LatLng(currentPosition!.latitude, currentPosition!.longitude);
    GoogleMapController gmController = await controller.future;
    gmController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 18.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('m1'),
          position: latLng,
          infoWindow: InfoWindow(
            title: "Mi ubicación",
            snippet: "Latitud: ${latLng.latitude}, Longitud: ${latLng.longitude}"
          )
        )
      );
    });
    getAddressFromLatLng();
  }

  Future<Position> determinarPosicion() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return Future.error("Servicios de localización deshabilitados.");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Los permisos de localización fueros denegados.");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Los permisos de localización fueros denegados permanentemente.");
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        currentAddress = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}";
      });
    } catch(e) {
      print(e);
    }
  }

}
