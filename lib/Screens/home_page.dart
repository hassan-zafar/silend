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
              icon: _markerIcon
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
              Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  // color: Colors.grey
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
                child: Padding(
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
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
