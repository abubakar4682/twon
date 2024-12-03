import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
          textAlignVertical: TextAlignVertical.center,
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
            suffixIcon: Icon(Icons.search, color: Color(0xFFADB5BD)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
