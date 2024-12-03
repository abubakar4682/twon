import 'package:flutter/material.dart';
import 'package:twn_sqr/screen/combine_screen.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  final Function(int) onItemSelected; // Callback when a navigation item is selected

  const BottomNavigationBarCustom({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white, // Background color
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8), // Add some vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Equal spacing
          children: [
            IconButton(
              icon: SizedBox(
                width: 32,
                height: 32,
                child: Image.asset('assets/images/calendar (1).png'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderDevelopmentScreen(title: "Calendar"),
                  ),
                ); // Navigate to Calendar underdevelopment page
              },
            ),
            IconButton(
              icon: SizedBox(
                width: 32,
                height: 32,
                child: Image.asset('assets/images/map.png'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderDevelopmentScreen(title: "Map"),
                  ),
                ); // Navigate to Map underdevelopment page
              },
            ),
            IconButton(
              icon: SizedBox(
                width: 40,
                height: 42,
                child: Image.asset('assets/images/plus.png'), // Plus icon from assets
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MobileView()),
                ); // Navigate to CombinedScreen
              },
            ),
            IconButton(
              icon: SizedBox(
                width: 32,
                height: 32,
                child: Image.asset('assets/images/users.png'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderDevelopmentScreen(title: "Users"),
                  ),
                ); // Navigate to Users underdevelopment page
              },
            ),
            IconButton(
              icon: SizedBox(
                width: 32,
                height: 32,
                child: Image.asset('assets/images/star.png'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderDevelopmentScreen(title: "Favorites"),
                  ),
                ); // Navigate to Favorites underdevelopment page
              },
            ),
          ],
        ),
      ),
    );
  }
}



// Under Development Screen Widget
class UnderDevelopmentScreen extends StatelessWidget {
  final String title;

  const UnderDevelopmentScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title - Under Development"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "$title Page is Under Development",
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}





