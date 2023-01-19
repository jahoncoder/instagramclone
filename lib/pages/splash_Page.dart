import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/home_Page.dart';
import 'package:flutter_application_1/pages/sign_in_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => SignIn()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Column(
            children: [
              Spacer(),
              Center(
                child: Text(
                  "Instagram",
                  style: TextStyle(
                      fontFamily: "FontsFree",
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
              Spacer(),
              Text(
                "All rights reserved",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
