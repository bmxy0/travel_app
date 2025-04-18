import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/exploreScreen.dart';
import 'package:travel_app/homeScreen.dart';
import 'package:travel_app/newPostScreen.dart';
import 'package:travel_app/profileScreen.dart';
import 'package:travel_app/settingsScreen.dart';

class NavigationScreen extends StatefulWidget {
  final String? userName;
  const NavigationScreen({super.key, this.userName});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          currentPageIndex == 0 ||
                  currentPageIndex == 1 ||
                  currentPageIndex == 2 ||
                  currentPageIndex == 4
              ? AppBar(
                backgroundColor: Colors.grey[100],

                title: Text(
                  currentPageIndex == 0
                      ? 'TravelGo!'
                      : currentPageIndex == 1
                      ? 'Explore'
                      : currentPageIndex == 2
                      ? 'Create New Post'
                      : currentPageIndex == 4
                      ? 'Settings'
                      : '',
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              )
              : null,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue[200],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore),
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle),
            label: 'New Post',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body:
          <Widget>[
            HomeScreen(),
            ExploreScreen(),
            NewPostScreen(userName: widget.userName),
            ProfileScreen(
              userName: widget.userName,
              pfp: "assets/pfp0.jpeg",
              followerCount: 130,
              followingCount: 10,
              bio:
                  'Welcome to my profile \n im 24 \n traveled to 6 countries 🇪🇸 🇺🇸 🇬🇧 🇯🇵 🇫🇷 🇮🇶 \n I share my travel stories with you all',
            ),
            SettingsScreen(),
          ][currentPageIndex],
    );
  }
}
