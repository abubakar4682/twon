import 'package:flutter/material.dart';
import 'package:twn_sqr/screen/combine_screen.dart';
import 'package:twn_sqr/webview/webview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check screen width
        if (constraints.maxWidth < 800) {
          // Render mobile view if the screen width is less than 800px
          return MobileView();
        } else {
          // Render web view for larger screens
          return WebView();
        }
      },
    );
  }
}
