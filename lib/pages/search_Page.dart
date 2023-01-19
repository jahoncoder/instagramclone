import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_Page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List listUsers = ["asad_coder", "x_s_f_02"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Search",
          style: TextStyle(fontSize: 40, fontFamily: "FontsFree"),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange, Colors.red],
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(color: Colors.grey.shade300),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listUsers.length,
                    itemBuilder: ((context, index) {
                      return itemOfUser(listUsers[index]);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemOfUser(String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Color.fromARGB(255, 199, 13, 106),
          child: CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/insta.png"),
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            "admin@gmail.com",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
      InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(20),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              "follow",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    ],
  );
}
