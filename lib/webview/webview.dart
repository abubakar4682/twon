import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twn_sqr/controllers/active_controller.dart';
import 'package:twn_sqr/webview/side_nav.dart';
import 'package:twn_sqr/widgets/goal_card.dart';
import 'package:twn_sqr/widgets/filter_bar.dart';
import 'package:twn_sqr/widgets/active_cards.dart';
import 'package:twn_sqr/widgets/dotted_line_with_circle.dart';
import 'package:get/get.dart';
 // Import the ActivityController

class WebView extends StatelessWidget {
  final ActivityController activityController = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Sidebar
          SideNavBar(),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Section
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              Text(
                                "This week in Estepona",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Search Bar
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 8,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    color: Color(0xFFADB5BD),
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "What do you feel like doing?",
                                    hintStyle: TextStyle(
                                      color: Color(0xFFADB5BD),
                                      fontSize: 14,
                                    ),
                                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Filter Bar
                              FilterBar(
                                filters: ["All", "Sports", "Food", "Kids", "Creative"],
                                onSelected: (filter) {
                                  activityController.filterActivities(filter);
                                },
                              ),
                              const SizedBox(height: 16),
                              // Activities Section
                              Obx(() {
                                if (activityController.isLoading.value) {
                                  return _buildShimmerLoading(); // Show shimmer effect when loading
                                } else if (activityController.hasError.value) {
                                  return Center(child: Text("Something went wrong. Please try again."));
                                } else if (activityController.filteredActivities.isEmpty) {
                                  return Center(child: Text("No activities found"));
                                } else {
                                  return DottedLineWithCircle(
                                    activities: activityController.filteredActivities,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            "Today / Tuesday",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        ...activityController.filteredActivities.map((activity) {
                                          return Padding(
                                            padding: const EdgeInsets.only(right: 6, top: 10),
                                            child: ActivityCard(activity: activity),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Right Sidebar
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GoalCard(),
                              const SizedBox(height: 16),
                              // Weekly Workshops Section
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Weekly workshops for kids",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Explore exciting weekly activities and workshops for kids near you.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Text("Learn more"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to show Shimmer effect for loading state
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
              height: 100,
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
