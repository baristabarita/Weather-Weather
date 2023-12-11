import 'package:flutter/material.dart';
import 'package:weather_weather/screens/logout_screen.dart'; // Add this import

class DashboardScreen extends StatefulWidget {
  static String routeName = "/dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamed(context, LogoutScreen.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'This is the Dashboard',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}