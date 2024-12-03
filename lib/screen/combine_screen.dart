import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import 'package:twn_sqr/controllers/active_controller.dart';
import 'package:twn_sqr/widgets/serach_field.dart';
import 'package:twn_sqr/widgets/goal_card.dart';
import 'package:twn_sqr/widgets/filter_bar.dart';
import 'package:twn_sqr/widgets/active_cards.dart';
import 'package:twn_sqr/widgets/bottom_navigation.dart';
import 'package:twn_sqr/widgets/dotted_line_with_circle.dart';
import 'package:get/get.dart'; // Import GetX for state management
// Import the ActivityController

class MobileView extends StatelessWidget {
  final ActivityController activityController = Get.put(ActivityController());  // GetX controller for managing activities

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tues, Nov 12", // Date text
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF9B9B9B),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "This week in Estepona", // Header text
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            GoalCard(),
            const SizedBox(height: 16),
            CustomSearchField(), // Search field widget
            const SizedBox(height: 16),
            FilterBar(
              filters: ["All", "Sports", "Food", "Kids", "Creative"], // Filters for categories
              onSelected: (filter) {
                activityController.filterActivities(filter); // Trigger filtering
              },
            ),
            const SizedBox(height: 16),
            // Dotted line and "Today / Tuesday" text always visible
            DottedLineWithCircle(
              activities: activityController.allActivities,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Today", // Static "Today" text
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: " / ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Tuesday", // Static "Tuesday" text
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFADB5BD),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // If loading, show shimmer, otherwise display filtered activities
                  Obx(() {
                    if (activityController.isLoading.value) {
                      return _buildShimmerLoading(); // Show shimmer effect while loading
                    } else if (activityController.hasError.value) {
                      return Center(child: Text("Something went wrong. Please try again."));
                    } else if (activityController.filteredActivities.isEmpty) {
                      return Center(child: Text("No activities found"));
                    } else {
                      return Column(
                        children: activityController.filteredActivities.map((activity) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6, top: 10),
                            child: ActivityCard(activity: activity),
                          );
                        }).toList(),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        onItemSelected: (index) {
          print("Selected Index: $index");
        },
      ),
    );
  }

  // Method to show shimmer effect for loading state (only for cards, not the entire layout)
  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3, // Simulate 3 loading activity cards
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 50, right: 16, bottom: 10), // Add padding to left and right
            child: Container(
              width: double.infinity,
              height: 100, // Simulated height for loading activity cards
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
