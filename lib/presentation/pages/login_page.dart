import 'package:fb_demo/presentation/widgets/maincontainer.dart';
import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key});

  @override
  State<login> createState() => _HomeState();
}

class _HomeState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
                    maincontainer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/fb.png',
                height: 250,
                width: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
