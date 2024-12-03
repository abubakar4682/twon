import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final List<String> filters; // List of filter names
  final Function(String) onSelected; // Callback for selected filter

  const FilterBar({required this.filters, required this.onSelected});

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String selectedFilter = "All"; // Default selected filter

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Horizontal scrolling
      child: Row(
        children: [
          // First Box with Filter Icon
          GestureDetector(
            onTap: () {
              widget.onSelected("Filter");
              setState(() {
                selectedFilter = "Filter";
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedFilter == "Filter" ? Color(0xFFBAA1CB) : Color(0xFFEEE1F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.filter_list, // Filter icon
                size: 20,
                color: selectedFilter == "Filter" ? Colors.black : Colors.grey.shade700,
              ),
            ),
          ),
          // Rest of the Filters
          ...widget.filters.map((filter) {
            final isSelected = selectedFilter == filter;

            return GestureDetector(
              onTap: () {
                widget.onSelected(filter);
                setState(() {
                  selectedFilter = filter;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFBAA1CB) : Color(0xFFEEE1F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 14,
                    height: 16.71 / 14, // Line height
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
