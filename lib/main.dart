import 'package:flutter/material.dart';
import 'package:travel_app/navigationScreen.dart';
import 'package:travel_app/signupScreen.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  String userName = 'Mohammed Albaqer';
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
                'Login to use the app',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.alternate_email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 50),
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
                    },
                    child:
                        isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => NavigationScreen(userName: userName),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(color: Colors.blueAccent),
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
