import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding around the card
      padding: const EdgeInsets.all(16), // Padding inside the card
      decoration: BoxDecoration(
        color: Color(0xFFE0F7FA), // Light blue background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Light shadow
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          // Text Section
          Expanded(
            flex: 3, // Occupies 3/4 of the space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're close to your goal!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,

                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Join more sport activities to collect more points",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                // Buttons Row
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle Join Now button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Black button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Join now",
                        style: TextStyle(color: Colors.white,
                        fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Handle My Points button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Black button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "My points",
                        style: TextStyle(color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Circular Progress Indicator
          Expanded(
            flex: 1, // Occupies 1/4 of the space
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    child: CircularProgressIndicator(
                      value: 0.67, // Progress percentage
                      strokeWidth: 4,
                      color: Colors.blue, // Blue progress color
                      backgroundColor: Colors.white, // Background circle color
                    ),
                  ),
                  Text(
                    "27",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
