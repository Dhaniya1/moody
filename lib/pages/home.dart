import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/db/db_model.dart';
import 'package:moodtracker/main.dart';
import 'package:moodtracker/pages/calender.dart';
import 'package:moodtracker/pages/moodselect.dart';
import 'package:moodtracker/util/navbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalenderMood()));
                  },
                  icon: Icon(
                    Icons.calendar_month_rounded,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            )
          ]),
      body: Column(children: [
        Container(
          color: Colors.red,
          padding: EdgeInsets.all(10),
          child: StreamBuilder<List<Mood>>(
              stream: objectbox.getNotes(),
              builder: (context, snapshot) => ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                  itemBuilder: _itemBuilder(snapshot.data ?? []))),
        ),
        const MoodSelectCard(),
      ]),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.history,
            color: Colors.white,
            size: 30,
          )
        ],
        backgroundColor: Theme.of(context).canvasColor,
        color: Theme.of(context).colorScheme.secondary,
        animationDuration: Duration(milliseconds: 400),
        height: 70,
      ),
    );
  }
}

GestureDetector Function(BuildContext, int) _itemBuilder(List<Mood> notes) =>
    (BuildContext context, int index) {
      print(notes[index].comment);
      return GestureDetector(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        notes[index].moodTitle,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                        // Provide a Key for the integration test
                        key: Key('list_item_$index'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Added on ${notes[index].dateFormat}',
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    };
