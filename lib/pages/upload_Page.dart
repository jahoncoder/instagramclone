import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/post_Page.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  PageController? pageController;

  UploadPage({this.pageController, super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  _showGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    setState(() {
      _image = File(file.path);
    });
    Navigator.pop(context);
  }

  _showCamera() async {
    try {
      final XFile? file =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = File(file!.path);
      });
    } catch (error) {
      print(error);
    }
    Navigator.of(context).pop();
  }

  _showPic() {
    showModalBottomSheet(
      context: context,
      builder: ((context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  _showGallery();
                },
                leading: Icon(Icons.photo_library),
                title: Text("Pick Photo"),
              ),
              ListTile(
                onTap: () {
                  _showCamera();
                },
                leading: Icon(Icons.camera_alt_outlined),
                title: Text("Take Photo"),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          "Instagram",
          style: TextStyle(fontFamily: "FontsFree", fontSize: 40),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                widget.pageController!.animateToPage(0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
              icon: Icon(Icons.add_chart),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange, Colors.red],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _showPic();
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.grey.shade400,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: _image == null
                          ? const Icon(
                              Icons.add_a_photo,
                              color: Color.fromARGB(255, 153, 153, 153),
                              size: 50,
                            )
                          : Image(
                              image: FileImage(_image!),
                              fit: BoxFit.cover,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Caption",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
                _image != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
