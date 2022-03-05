import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
        body: ListView(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                      children: const [Text('Amount Requested:'), Text('\$65')],
                    ),
                  ],
                ),
                CachedNetworkImage(
                  imageUrl: currentUser!.imageUrl!,
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
        )
      ],
    ));
  }
}
