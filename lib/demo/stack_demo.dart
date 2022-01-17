import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: 350,
        color: Colors.orange,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/logo@3x.png',
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text('谁是沙雕'),
                ))
          ],
        ),
      ),
    );
  }
}
