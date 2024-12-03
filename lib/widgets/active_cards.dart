import 'package:flutter/material.dart';

// Define the reusable ActivityCard widget
class ActivityCard extends StatelessWidget {
  final Map<String, dynamic> activity;

  const ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 16, top: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Slightly increased the radius for smoother edges
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Light shadow color
              blurRadius: 10, // Increased blur radius for a softer shadow
              offset: Offset(0, 5), // Position shadow below the card
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time and Duration
            Text(
              "${activity['time']} (${activity['duration']})",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            // Row for Activity Name and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  activity['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  activity['price'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Location
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  activity['location'],
                  style: TextStyle(
                    fontSize: 12,
                    height: 14.32 / 12,
                    color: Color(0xFFADB5BD),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Row for Tags and Join Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Spots Left and Tags
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            activity['spotsLeft'],
                            style: TextStyle(
                              fontSize: 12,
                              height: 14.32 / 12,
                              color: Color(0xFFADB5BD),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (activity['tag'] != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          activity['tag'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFADB5BD),
                          ),
                        ),
                      ),
                    if (activity['childcare'] != null && activity['childcare'])
                      const SizedBox(width: 8),
                    if (activity['childcare'] != null && activity['childcare'])
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'child',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                  ],
                ),
                // Join Button
                ElevatedButton(
                  onPressed: activity['soldOut'] ? null : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    activity['soldOut'] ? Colors.grey.shade400 : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    activity['buttonText'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
