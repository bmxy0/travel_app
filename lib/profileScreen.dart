import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/homeScreen.dart';

class ProfileScreen extends StatefulWidget {
  final String? userName;
  const ProfileScreen({super.key, this.userName});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pfp1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text('${widget.userName}',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Followers \n 200',
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Following \n 500',
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Posts \n 10',
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Welcome to my profile \n im 24 \n traveled to 6 countries 🇪🇸 🇺🇸 🇬🇧 🇯🇵 🇫🇷 🇮🇶 \n I share my travel stories with you all',
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Edit Profile',
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.grey[100],
              foregroundColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: HomeScreen())
        ],
      ),
    );
  }
}
