import 'package:flutter/material.dart';
import 'package:travel_app/aboutScreen.dart';
import 'package:travel_app/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.rule_rounded),
                SizedBox(width: 10),
                Text('Options'),
              ],
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 10),
                Text('About'),
              ],
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.exit_to_app_rounded),
                SizedBox(width: 10),
                Text('Log Out'),
              ],
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
        ],
      ),
    );
  }
}
