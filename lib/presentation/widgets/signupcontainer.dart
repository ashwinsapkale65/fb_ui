import 'package:fb_demo/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class signupcontainer extends StatefulWidget {
  const signupcontainer({super.key});

  @override
  State<signupcontainer> createState() => signupcontainerstate();
}

class signupcontainerstate extends State<signupcontainer> {
  final _formKey = GlobalKey<FormState>();
  bool buttoncolor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Signup in to Facebook",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FontMain'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
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
                  hintText: "Name",
                  hintStyle: TextStyle(color: Color.fromRGBO(144, 148, 156, 1)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
              child: TextFormField(
              validator: (value) {
  if (value!.isEmpty) {
    return 'Please enter your email';
  } else if (!value.contains('@') || !value.contains('.')) {
    return 'Please enter a valid email address';
  }
  return null;
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
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Color.fromRGBO(144, 148, 156, 1)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Please enter valid phone number';
                  }
                  return null;
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
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Color.fromRGBO(144, 148, 156, 1)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
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
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(8, 102, 255, 300)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SnackBar snackBar = SnackBar(
                        content: Text('Sucess'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text("Already Have An Account?",
                        style:
                            TextStyle(color: Color.fromRGBO(8, 102, 255, 1)))),
              ],
            ),
          ],
        ),
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
      height: 650,
      width: 500,
    );
  }
}
