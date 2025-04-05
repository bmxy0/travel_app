import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/homeScreen.dart';

class ProfileScreen extends StatefulWidget {
  final int? postsCount;
  final String? userName;
  final String? pfp;
  final int? followerCount;
  final int? followingCount;
  final String? bio;
  const ProfileScreen({
    super.key,
    this.userName,
    this.pfp,
    this.followerCount,
    this.followingCount,
    this.bio,
    this.postsCount,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    int? postsCount = 1;
    if (widget.postsCount != null) {
      postsCount = widget.postsCount;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),

      body: Container(
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
                      image: AssetImage('${widget.pfp}'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      '${widget.userName}',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Followers \n ${widget.followerCount}',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Following \n ${widget.followingCount}',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Posts \n $postsCount',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('${widget.bio}'),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 10),
            Expanded(child: HomeScreen(searchQuery: widget.userName)),
          ],
        ),
      ),
    );
  }
}
