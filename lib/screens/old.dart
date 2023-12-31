import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_weather/models/StorageItem.dart';
import 'package:weather_weather/screens/login_screen.dart';
import 'package:weather_weather/screens/dashboard_screen.dart';
import 'package:weather_weather/screens/forecast_screen.dart';
import 'package:weather_weather/services/StorageServices.dart';
import 'package:weather_weather/widgets/InfoField.dart';
import 'package:weather_weather/widgets/BottomNavbar.dart'; // Import the BottomNavbar widget

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageService storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.grey, // Set the shadow color
                      offset: Offset(2.0, 2.0), // Set the shadow offset
                      blurRadius: 4.0, // Set the blur radius
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.0),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to your profile screen!',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: getUserDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      User? user = snapshot.data as User?;
                      if (user == null) {
                        return Text('No user logged in.');
                      } else {
                        String displayName =
                            user.displayName ?? user.email!.split('@')[0];
                        String email = user.email ?? "";

                        return Column(
                          children: [
                            // Circular icon (using Photo URL or default person icon)
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: user.photoURL != null
                                  ? NetworkImage(user.photoURL!)
                                  : AssetImage('assets/default_pfp.jpg')
                                      as ImageProvider<Object>?,
                            ),
                            // Display Name
                            InfoField(
                                labelText: 'Full Name', content: displayName),
                            // Email Address
                            InfoField(
                                labelText: 'Email Address', content: email),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle logout button press
                                logoutUser(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Set the border radius
                                ),
                                minimumSize: Size(150.0, 40),
                              ),
                              child: Text('Log Out'),
                            ),
                          ],
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 2, // Set the appropriate index for the Profile screen
        onTap: (index) {
          // Handle navigation or any other logic based on the selected index
          // You can add more cases for other screen navigation if needed
          if (index == 0) {
            Navigator.pushNamed(context, DashboardScreen.routeName);
          } else if (index == 1) {
            Navigator.pushNamed(context, ForecastScreen.routeName);
          }
        },
      ),
    );
  }

  Future<User?> getUserDetails() async {
    User? user = _auth.currentUser;
    return user;
  }

  void logoutUser(BuildContext context) async {
    try {
      await _auth.signOut();
      await storageService.saveData(StorageItem("uid", null));
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      print("Error logging out: $e");
    }
  }
}
