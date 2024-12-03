import 'package:get/get.dart';

class ActivityController extends GetxController {
  // Reactive variables for state management
  var selectedFilter = 'All'.obs;  // Default filter
  var activities = <Map<String, dynamic>>[].obs;
  var filteredActivities = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  // Sample list of activities (replace with actual data or API call)
  List<Map<String, dynamic>> allActivities = [
    {
      "time": "08:00",
      "duration": "60 min",
      "name": "Beach Yoga",
      "location": "La Playa de la Rada",
      "price": "9€",
      "spotsLeft": "8 spots left",
      "tag": "Sports",  // Category: Sports
      "buttonText": "Join",
      "soldOut": false,
    },
    {
      "time": "09:00",
      "duration": "60 min",
      "name": "Reformer Pilates",
      "location": "Wellness Studio",
      "price": "15€",
      "spotsLeft": "5 spots left",
      "tag": "Sports", // Category: Sports
      "childcare": true,
      "buttonText": "Join",
      "soldOut": false,
    },
    {
      "time": "12:30",
      "duration": "45 min",
      "name": "5-a-side Football",
      "location": "Municipal Sports Center",
      "price": "19€",
      "spotsLeft": "0 spots left",
      "tag": "Sports", // Category: Sports
      "buttonText": "Sold Out",
      "soldOut": true,
    },
    {
      "time": "14:00",
      "duration": "90 min",
      "name": "Cooking Class",
      "location": "Food Studio",
      "price": "20€",
      "spotsLeft": "10 spots left",
      "tag": "Food", // Category: Food
      "buttonText": "Join",
      "soldOut": false,
    },
    {
      "time": "16:00",
      "duration": "60 min",
      "name": "Kids Dance Class",
      "location": "Community Hall",
      "price": "10€",
      "spotsLeft": "8 spots left",
      "tag": "Kids", // Category: Kids
      "buttonText": "Join",
      "soldOut": false,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    filteredActivities.value = allActivities; // Initialize with all activities
    activities.value = allActivities;
  }

  // Method to filter activities based on category
  void filterActivities(String category) {
    isLoading.value = true;
    hasError.value = false;

    // Simulate a delay (e.g., fetching data from an API)
    Future.delayed(Duration(seconds: 2), () {
      try {
        selectedFilter.value = category;
        filteredActivities.value = category == 'All'
            ? activities
            : activities.where((activity) => activity['tag'] == category).toList();
        isLoading.value = false;
      } catch (e) {
        hasError.value = true;
        isLoading.value = false;
      }
    });
  }
}
