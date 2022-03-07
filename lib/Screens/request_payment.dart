import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: CachedNetworkImageProvider(
                          'https://engineering.unl.edu/images/staff/Kayla-Person.jpg'),
                    ),
                    Text('MRS. Ellie Johnson')
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.all(16),
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
                    Row(
                      children: const [
                        Expanded(
                            child: Text('Request Amount',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black))),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                hintText: '\$50',
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('Thank You Note',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black))),
                        Expanded(
                          child: TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                fillColor: Colors.black26,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                hintText:
                                    'Thank you so much for helping me wit my unexpected expense',
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Submit'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
