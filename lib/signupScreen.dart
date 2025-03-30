import 'package:flutter/material.dart';
import 'package:travel_app/navigationScreen.dart';
import 'package:travel_app/main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isHidden = true;
  String userName = 'Mohammed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 50, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign up to TravelGo',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                onChanged: (value) {
                  userName = value;
                },
                decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                onChanged: (value) {},
                obscureText: isHidden,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });

                          print('switch');
                        },
                        child: isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NavigationScreen(userName: userName)),
                  );
                },
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
