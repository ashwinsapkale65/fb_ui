
import 'package:fb_demo/presentation/widgets/signupcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signup extends StatefulWidget {
  const signup({Key? key});

  @override
  State<signup> createState() => _HomeState();
}

class _HomeState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      body: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
                    signupcontainer(),
                  ],
                ),
              ),
            ),
          );
        
  }
}
