import 'package:flutter/material.dart';

class CalenderMood extends StatefulWidget {
  const CalenderMood({Key? key}) : super(key: key);

  @override
  State<CalenderMood> createState() => _CalenderMoodState();
}

class _CalenderMoodState extends State<CalenderMood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text(
            "MOODY",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(34, 35, 37, 1.0),
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Card(
          elevation: 4, // Add elevation for shadow
          margin: const EdgeInsets.all(20), // Add margin for spacing
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Add border radius
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your Card Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your Card Content',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
