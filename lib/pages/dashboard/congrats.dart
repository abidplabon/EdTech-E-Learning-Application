import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class CongratsPage extends StatefulWidget {
  @override
  _CongratsPageState createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: const Duration(seconds: 5),
      //numberOfParticles: 30,
    );
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congratulations!'),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _buildConfettiWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/congrats.png', // Replace with your image asset
                  //width: 100, // Adjust the width as needed
                  //height: 200, // Adjust the height as needed
                ),
                SizedBox(height: 10,),
                Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'You\'ve achieved something amazing!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );

                  },
                  child: Text('Claim Certificate',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfettiWidget() {
    return ConfettiWidget(
      confettiController: _controller,
      blastDirection: 0, // Random direction
      emissionFrequency: 0.1, // Lower emission frequency for more bursts
      gravity: 0.1, // Adjust gravity
      colors: const [
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.green,
        Colors.purple,
        Colors.teal,
        Colors.pink,
      ],
    );
  }
}
