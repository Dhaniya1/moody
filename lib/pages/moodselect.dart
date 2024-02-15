import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:moodtracker/pages/feelingreason.dart';
import 'package:moodtracker/util/cardimages.dart';

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
              margin: EdgeInsets.symmetric(vertical: 50),
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
                          margin: EdgeInsets.only(top: 0),
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
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 3,
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
          AnimatedToggleSwitch<int>.rolling(
            height: height,
            style: ToggleStyle(
                backgroundColor: Theme.of(context).cardColor,
                borderColor: Colors.black),
            borderWidth: 0,
            indicatorSize: Size.square(height),
            current: moodValue,
            values: [
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
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
              child: Text(
                'NEXT',
              ),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            ),
          ),
        ],
      ),
    );
  }
}
