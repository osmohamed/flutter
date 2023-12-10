import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'image/image (2).png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // Content
          Container(
            color: Colors.black.withOpacity(0.5), // Add overlay for better visibility of text
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Header
                      SizedBox(height: 20),
                      // Empty space or any other content you want to add
                    ],
                  ),
                ),
                // Buttons

                // Additional Buttons Column
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Button 1'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Button 2'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Button 3'),
                      ),
                      ElevatedButton(

                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Button 4'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
