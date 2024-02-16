import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:moodtracker/pages/feelingreason.dart';
import 'package:moodtracker/util/cardimages.dart';
import 'package:moodtracker/util/navbar.dart';

class MoodSelectCard extends StatefulWidget {
  const MoodSelectCard({Key? key}) : super(key: key);

  @override
  State<MoodSelectCard> createState() => _MoodSelectCardState();
}

int moodValue = 3;

class _MoodSelectCardState extends State<MoodSelectCard> {
  ImageData imgd = ImageData();

  final List<String> moodName = [
    "Terrible",
    "Bad",
    "Neutral",
    "Good",
    "Excellent"
  ];

  @override
  Widget build(BuildContext context) {
    const height = 60.0;

    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 45),
              width: 350,
              height: 400,
              child: Card(
                elevation: 12,
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 0),
                          width: 225,
                          height: 225,
                          child: SvgPicture.asset(imgd.cardImages[moodValue]),
                        ),
                      ),
                      //SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          moodName[moodValue - 1],
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 4,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(94, 0, 0, 30)),
                Text(
                  "bad",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 175,
                  height: 2,
                ),
                Text("Good", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(60), // Set the border radius
            child: Container(
              padding: const EdgeInsets.all(7),
              color: Theme.of(context).cardColor,
              child: AnimatedToggleSwitch<int>.rolling(
                iconBuilder: (value, foreground) => Icon(
                  Icons.circle_rounded,
                  color: Colors.white,
                  size: 8,
                ),
                height: height,
                style: ToggleStyle(
                  backgroundColor: Theme.of(context).cardColor,
                  borderColor: Colors.black,
                ),
                borderWidth: 0,
                indicatorSize: const Size.square(height),
                current: moodValue,
                values: const [
                  1,
                  2,
                  3,
                  4,
                  5,
                ],
                onChanged: (i) {
                  setState(() => moodValue = i);
                },
                animationDuration: const Duration(milliseconds: 400),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 32),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeelingReason(
                      moodName: moodName[moodValue - 1],
                      cardImage: imgd.cardImages[moodValue],
                    ),
                  ),
                );
              },
              padding: EdgeInsets.zero, // Remove padding to avoid extra spacing
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Color.fromARGB(255, 162, 0, 211)
                    ], // Define your gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
