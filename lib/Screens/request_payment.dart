import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:silend/Constants/constants.dart';
import 'package:silend/Theme/constants.dart';

class RequestPaymentPage extends StatefulWidget {
  const RequestPaymentPage({Key? key}) : super(key: key);

  @override
  State<RequestPaymentPage> createState() => _RequestPaymentPageState();
}

class _RequestPaymentPageState extends State<RequestPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Image.asset('assets/images/Ellipse1.png'),
              left: -50,
              top: -100,
            ),
            Positioned(
              child: Image.asset('assets/images/Ellipse1.png'),
              right: -50,
              top: -200,
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage: CachedNetworkImageProvider(
                              'https://engineering.unl.edu/images/staff/Kayla-Person.jpg'),
                        ),
                        Text(
                          'MRS. Ellie Johnson',
                          style: titleTextStyle(context: context),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        const Text(
                          'Fund Request',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
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
                              const Expanded(
                                  child: Text('Request Amount',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.black))),
                              Expanded(
                                child: Neumorphic(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  style: neumorphicStyle,
                                  child: const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16.0))),
                                          hintText: '\$50',
                                          hintStyle:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
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
                              const Expanded(
                                  child: Text('Request Category',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.black))),
                              Expanded(
                                child: Neumorphic(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  style: neumorphicStyle,
                                  child: const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16.0))),
                                          hintText: '\$50',
                                          hintStyle:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Neumorphic(
                          style: neumorphicStyle,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Colors.blue,
                                  ),
                                  Expanded(
                                      child: Text('Thank You Note',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black))),
                                ],
                              ),
                              const SizedBox(
                                height: 100,
                                width: 180,
                                child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      fillColor: Colors.black26,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16.0))),
                                      hintText:
                                          'Thank you so much for helping me wit my unexpected expense',
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Submit'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
