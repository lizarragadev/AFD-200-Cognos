import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/paisaje.jpeg"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              left: 15,
              right: 15,
              bottom: 25,
              child: Card(
                elevation: 10,
                color: Colors.white.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Bolivia",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
