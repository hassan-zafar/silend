import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:silend/Components/custom_toast.dart';
import 'package:uuid/uuid.dart';

import '../Theme/constants.dart';

class UploadRequestScreen extends StatefulWidget {
  static const routeName = '/UploadProductForm';

  @override
  _UploadRequestScreenState createState() => _UploadRequestScreenState();
}

class _UploadRequestScreenState extends State<UploadRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  UploadTask? task;
  File? file;

  var _productTitle = '';
  String _productAudioUrl = '';
  var _productCategory = '';
  var _categoryDescription = '';
  var _productDescription = '';
  var _videoLength = '';
  String fullPath = '';
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _categoryDescriptionController =
      TextEditingController();
  String? _categoryValue;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File? _pickedImage;
  bool _isLoading = false;
  bool _isAudioSelected = false;

  late String url;
  var uuid = Uuid();
  showAlertDialog(BuildContext context, String title, String body) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _trySubmit() async {
    print("here");
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      print(_productTitle);
      print(_productCategory);
      print(_categoryDescription);
      print(_productDescription);
      print(_videoLength);
      // Use those values to send our request ...
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        if (_pickedImage == null) {
          CustomToast.errorToast(message: 'Please pick an image');
        } else if (_productAudioUrl == null) {
          CustomToast.errorToast(message: 'Please pick a video');
        } else {
          setState(() {
            _isLoading = true;
          });
          final ref = FirebaseStorage.instance
              .ref()
              .child('productsImages')
              .child(_productTitle + '.jpg');
          await ref.putFile(_pickedImage!);
          url = await ref.getDownloadURL();
          final User? user = _auth.currentUser;
          final _uid = user!.uid;
          final productId = uuid.v4();
          await FirebaseFirestore.instance
              .collection('products')
              .doc(productId)
              .set({
            'productId': productId,
            'productTitle': _productTitle,
            'videoUrl': _productAudioUrl,
            'productImage': url,
            'path': fullPath,
            'productCategory': _productCategory,
            'categoryDescription': _categoryDescription,
            'productDescription': _productDescription,
            'videoLength': _videoLength,
            'userId': _uid,
            'createdAt': Timestamp.now(),
          });
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        }
      } catch (error) {
        CustomToast.errorToast(message: error.toString());
        print('error occured ${error.toString()}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a Pledge')),
      bottomSheet: Container(
        height: kBottomNavigationBarHeight * 0.8,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Material(
          color: Theme.of(context).backgroundColor,
          child: InkWell(
            onTap: () => _trySubmit(),
            splashColor: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: _isLoading
                      ? Center(
                          child: Container(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator()))
                      : Text('Upload',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                ),
                GradientIcon(
                  Icons.upload,
                  20,
                  LinearGradient(
                    colors: <Color>[
                      Colors.green,
                      Colors.yellow,
                      Colors.deepOrange,
                      Colors.orange,
                      Colors.yellow.shade800
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: TextFormField(
                            key: ValueKey('Title'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Title';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Title',
                            ),
                            onSaved: (value) {
                              _productTitle = value!;
                            },
                          ),
                        ),

                        //    SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: Container(
                                  child: TextFormField(
                                    controller: _categoryController,

                                    key: ValueKey('Category'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a Category';
                                      }
                                      return null;
                                    },
                                    //keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Add a new Category',
                                    ),
                                    onSaved: (value) {
                                      _productCategory = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            DropdownButton<String>(
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text('Daily'),
                                  value: 'Daily',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Movement'),
                                  value: 'Movement',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Seated'),
                                  value: 'Seated',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Shoes'),
                                  value: 'Shoes',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Thinking'),
                                  value: 'Thinking',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Educational'),
                                  value: 'Educational',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Task'),
                                  value: 'Task',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Relaxation'),
                                  value: 'Relaxation',
                                ),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  _categoryValue = value!;
                                  _categoryController.text = value;
                                  //_controller.text= _productCategory;
                                  print(_productCategory);
                                });
                              },
                              hint: Text('Select a Category'),
                              value: _categoryValue,
                            ),
                          ],
                        ),

                        SizedBox(height: 15),
                        TextFormField(
                            key: ValueKey('Description'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'video description is required';
                              }
                              return null;
                            },
                            //controller: this._controller,
                            maxLines: 10,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              //  counterText: charLength.toString(),
                              labelText: 'Description',
                              hintText: 'Audio description',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              _productDescription = value!;
                            },
                            onChanged: (text) {
                              // setState(() => charLength -= text.length);
                            }),
                        //    SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     Expanded(
                        //       //flex: 2,
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(right: 9),
                        //         child: TextFormField(
                        //           keyboardType: TextInputType.number,
                        //           key: ValueKey('Quantity'),
                        //           validator: (value) {
                        //             if (value!.isEmpty) {
                        //               return 'Quantity is missed';
                        //             }
                        //             return null;
                        //           },
                        //           decoration: InputDecoration(
                        //             labelText: 'Quantity',
                        //           ),
                        //           onSaved: (value) {
                        //             _productQuantity = value!;
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
