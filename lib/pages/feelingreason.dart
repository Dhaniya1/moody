import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodtracker/pages/moodselect.dart';
import 'package:moodtracker/util/cardimages.dart';
import 'package:chip_list/chip_list.dart';

class FeelingReason extends StatefulWidget {
  final String moodName;
  final String cardImage;

  const FeelingReason({
    Key? key,
    required this.moodName,
    required this.cardImage,
  }) : super(key: key);

  @override
  State<FeelingReason> createState() => _FeelingReasonState();
}

final _textController = TextEditingController();

class _FeelingReasonState extends State<FeelingReason> {
  ImageData imgd = ImageData();
  final List<String> bad = [
    'Angry',
    'Anxious',
    'Scared',
    'Overwhelmed',
    'Ashamed',
    'Disgusted',
    'Embarrassed',
    'Frustrated',
    'Annoyed',
    'Jealous',
    'Stressed',
    'Worried',
    'Guilty',
    'Surprised',
    'Hopeless',
    'Irritated',
    'Lonely',
    'Discouraged',
    'Disappointed',
    'Drained',
    'Sad',
  ];
  final List<String> okay = [
    'Content',
    'Calm',
    'Peaceful',
    'Indefferent',
    'Drained',
  ];
  final List<String> good = [
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
  ];

  List<String> chipCategory = [];

  @override
  void initState() {
    chipCategory = good;

    if (widget.moodName == "Terrible" || widget.moodName == "Bad") {
      chipCategory = bad;
    } else if (widget.moodName == "Neutral") {
      chipCategory = okay;
    } else {
      chipCategory = good;
    }
    print(chipCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(chipCategory);

    List<int> selectedItem = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text("MOODY",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(34, 35, 37, 1.0))),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 350,
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  elevation: 6, // Add elevation for a shadow effect
                  margin: const EdgeInsets.all(16), // Add margin for spacing
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          widget.cardImage,
                          height: 225,
                        ), // Displaying the image
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            'Selected Mood: ${widget.moodName}',
                            style: const TextStyle(
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
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 25),
              child: Text(
                "What best describes this feeling?",
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: MediaQuery.sizeOf(context).height - 680,
              child: Card(
                color: Theme.of(context).canvasColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Border radius
                  side: BorderSide(
                    color: Color.fromARGB(255, 223, 190, 163), // Border color
                    width: 3, // Border width
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: ChipList(
                      checkmarkColor: Colors.white,
                      wrapAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      showCheckmark: false,
                      listOfChipNames: chipCategory,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 1),
                      activeBgColorList: [Theme.of(context).cardColor],
                      supportsMultiSelect: true,
                      inactiveBgColorList: const [Color(0xFFC39352)],
                      inactiveTextColorList: const [
                        Color.fromARGB(255, 0, 0, 0)
                      ],
                      activeBorderColorList: const [
                        Color.fromARGB(255, 0, 0, 0)
                      ],
                      inactiveBorderColorList: const [Color(0xFFC39352)],
                      listOfChipIndicesCurrentlySeclected: selectedItem,
                      shouldWrap: true,
                      runSpacing: 0,
                      spacing: 8,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "What's on your mind?",
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {
                            _textController.clear();
                          },
                          icon: Icon(Icons.clear))),
                )),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: MaterialButton(
                onPressed: () {
                  // Handle button press
                },
                padding:
                    EdgeInsets.zero, // Remove padding to avoid extra spacing
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Color.fromARGB(255, 180, 0, 235)
                      ], // Define your gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    child: Text(
                      'DONE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
