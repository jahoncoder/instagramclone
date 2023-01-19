import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  PageController? pageController;
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              children: [
                Text(
                  "jm_7x_",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.trending_up_sharp,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    width: 27,
                    height: 27,
                    image: AssetImage("assets/images/edit.png"),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left_sharp,
              size: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      Color.fromARGB(255, 199, 13, 106),
                                  child: CircleAvatar(
                                    radius: 37,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage:
                                          AssetImage("assets/images/insta.png"),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 60, left: 50),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        _showPic();
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "23K",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Posts",
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "34 B",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Followers",
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Following",
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TabBar(
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              icon: Icon(
                                Icons.table_rows_sharp,
                              ),
                            ),
                            Tab(
                              icon: Icon(Icons.apps_sharp),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 200,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/post1.jpg"),
                                  ),
                                ),
                                Text(
                                  "Ajoyib Quyosh botish9 surati",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 195,
                                  height: 200,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/post2.jpg"),
                                  ),
                                ),
                                Text(
                                  "Yer bilan bog'liq bo'lgan 3D surati",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 200,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/post3.jpg"),
                                  ),
                                ),
                                Text(
                                  "Qora tuynuk va yer",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 195,
                                  height: 200,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/post4.jpg"),
                                  ),
                                ),
                                Text(
                                  "Animation Surat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
