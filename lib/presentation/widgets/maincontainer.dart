import 'package:flutter/material.dart';

class maincontainer extends StatefulWidget {
  const maincontainer({super.key});

  @override
  State<maincontainer> createState() => _maincontainerState();
}

class _maincontainerState extends State<maincontainer> {
  String email = "";
  String password = "";

  bool buttoncolor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Log in to Facebook",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'FontMain'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: TextFormField(
              onChanged: (value) {
                email = value;

                if (email.isNotEmpty) {
                  if (password.isNotEmpty) {
                    setState(() {
                      buttoncolor = true;
                    });
                  }
                } else {
                  setState(() {
                    buttoncolor = false;
                  });
                }
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      Divider.createBorderSide(context, color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: Divider.createBorderSide(context,
                      color: Color.fromRGBO(221, 223, 226, 1)),
                  borderRadius: BorderRadius.circular(7),
                ),
                hintText: "Email address or phone number",
                hintStyle: TextStyle(color: Color.fromRGBO(144, 148, 156, 1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
            child: TextFormField(
              onChanged: (value) {
                password = value;

                if (password.isNotEmpty) {
                  if (email.isNotEmpty) {
                    setState(() {
                      buttoncolor = true;
                    });
                  }
                } else {
                  setState(() {
                    buttoncolor = false;
                  });
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      Divider.createBorderSide(context, color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: Divider.createBorderSide(context,
                      color: Color.fromRGBO(221, 223, 226, 1)),
                  borderRadius: BorderRadius.circular(7),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Color.fromRGBO(144, 148, 156, 1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: buttoncolor
                      ? MaterialStateProperty.all(
                          Color.fromRGBO(8, 102, 255, 300))
                      : MaterialStateProperty.all(
                          Color.fromRGBO(8, 102, 255, 0.3)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text("Log in",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'FontMain')),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  child: Text("Forgot account?",
                      style: TextStyle(color: Color.fromRGBO(8, 102, 255, 1)))),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {},
                  child: Text("Sign up for Facebook",
                      style: TextStyle(color: Color.fromRGBO(8, 102, 255, 1)))),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      margin: EdgeInsets.all(5.0),
      height: 400,
      width: 500,
    );
  }
}
