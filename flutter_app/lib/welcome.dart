import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
void main() => runApp(MaterialApp(
  home: WelcomePage(),
));

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff2B475E),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'image/scholar.png',
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'GET',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 45,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the "Welcome" button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Test()),
                          );

                          // print('Welcome Button Pressed');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            'Welcome',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
