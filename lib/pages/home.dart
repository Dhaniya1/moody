import 'package:flutter/material.dart';
import 'package:moodtracker/pages/moodselect.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text("MOODY",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(34, 35, 37, 1.0))),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  )),
            )
          ]),
      body: const MoodSelectCard(),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
