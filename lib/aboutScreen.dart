import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          "About",

          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          "TravelGo is an app for travelers to share their travel stories around the world. \n you can share your travel journey here without restrictions and you can see other poeple's true experiences without the false media influence. \n here you can see the world as its truly is. \n enjoy your time here and always be on the go :D ",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
