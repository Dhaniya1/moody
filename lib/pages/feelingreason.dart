import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodtracker/util/cardimages.dart';
import 'moodselect.dart';
import 'package:chip_list/chip_list.dart';

class FeelingReason extends StatefulWidget {
  final String moodName;
  final String cardImage;

  FeelingReason({
    Key? key,
    required this.moodName,
    required this.cardImage,
  }) : super(key: key);

  @override
  State<FeelingReason> createState() => _FeelingReasonState();
}

class _FeelingReasonState extends State<FeelingReason> {
  ImageData imgd = ImageData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(left: 0),
          child: Text("MOODY",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(34, 35, 37, 1.0))),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 375,
              width: 375,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 6, // Add elevation for a shadow effect
                margin: EdgeInsets.all(16), // Add margin for spacing
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        widget.cardImage,
                        height: 225,
                      ), // Displaying the image
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          'Selected Mood: ${widget.moodName}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    // Add other widgets for the reason input or any other content
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "What's causing this feeling?",
              style: TextStyle(
                  color: Theme.of(context).cardColor,
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ChipList(
            listOfChipNames: [
              "Amazed",
              'Excited',
              'Surprised',
              'Passionate',
              'Happy',
              'Joyful',
              'Brave',
              'Proud',
              'Confident',
              'Hopeful',
              'Amused',
              'Satisfied',
              'Relieved',
              'Grateful',
              'Content',
              'Calm',
              'Peaceful',
            ],
            activeBgColorList: [Theme.of(context).cardColor],
            supportsMultiSelect: true,
            inactiveBgColorList: [const Color(0xFFC39352)],
            inactiveTextColorList: [const Color.fromARGB(255, 0, 0, 0)],
            activeBorderColorList: [const Color.fromARGB(255, 0, 0, 0)],
            inactiveBorderColorList: [const Color(0xFFC39352)],
            listOfChipIndicesCurrentlySeclected: [0],
            shouldWrap: true,
            runSpacing: 8,
            spacing: 10,
          )
        ],
      ),
    );
  }
}