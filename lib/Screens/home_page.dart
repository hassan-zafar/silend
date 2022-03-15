import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:silend/Constants/constants.dart';
import 'package:silend/Theme/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<Marker> _markers = HashSet<Marker>();
  late BitmapDescriptor _markerIcon;
  // void _setMarkerIcon() async {
  //   _markerIcon = await BitmapDescriptor.fromAssetImage(
  //        ImageConfiguration(), customFoodMarkerIcon);
  // }
  late GoogleMapController mapController;
  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId("0"),
            position: const LatLng(51.517450, -0.226575),
            // icon: _markerIcon
            // infoWindow: InfoWindow(
            //   title: widget.restaurantDetails.restaurantName,
            //   snippet: widget.restaurantDetails.restaurantAddress,
            // ),
          ),
        );
      });
    });
  }

  void initState() {
    super.initState();
    // _setMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hi, Hassan',
                  style: titleTextStyle(context: context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  child: GoogleMap(
                    onMapCreated: onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(51.517450, -0.226575),
                      zoom: 15,
                    ),
                    buildingsEnabled: false,
                    mapToolbarEnabled: false,
                    markers: _markers,
                  ),
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(8), padding: EdgeInsets.all(16),
                style: const NeumorphicStyle(
                    color: Colors.white,
                    shape: NeumorphicShape.convex,
                    surfaceIntensity: 12,
                    lightSource: LightSource.top,
                    intensity: 12,
                    depth: -112),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Julie',
                          style: titleTextStyle(context: context),
                        ),
                      ],
                    ),
                    Neumorphic(
                      margin: const EdgeInsets.all(8),
                      style: neumorphicStyle,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.wb_sunny_outlined,
                            color: Colors.blue,
                          ),
                          const Text('Request Amount',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                          Neumorphic(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              style: neumorphicStyle,
                              child: Text(
                                '\$60',
                                style: normalTextStyle,
                              ))
                        ],
                      ),
                    ),
                    Neumorphic(
                      margin: const EdgeInsets.all(8),
                      style: neumorphicStyle,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.wb_sunny_outlined,
                            color: Colors.blue,
                          ),
                          const Text('Request Category',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                          Neumorphic(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            style: neumorphicStyle,
                            child: Text(
                              '\$50',
                              style: normalTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(8),
                style: const NeumorphicStyle(
                    color: Colors.white, shape: NeumorphicShape.concave),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Julie',
                            style: titleTextStyle(context: context),
                          ),
                          Row(
                            children: const [
                              Text('Amount Requested:'),
                              Text('\$95')
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/Layer 2.1.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 180,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: titleTextStyle(context: context),
                          ),
                          Text(
                            'Food',
                            style: titleTextStyle(context: context),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
