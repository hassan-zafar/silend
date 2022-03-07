import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:silend/Constants/constants.dart';
import 'package:silend/Theme/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
              (Neumorphic(
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
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'UserName',
                            style: titleTextStyle(context: context),
                          ),
                          Row(
                            children: const [
                              Text('Amount Requested:'),
                              Text('\$65')
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/info_screen.jpeg',
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
                            'Needy',
                            style: titleTextStyle(context: context),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
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
