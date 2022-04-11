import "package:flutter/material.dart";

import "../main.dart";

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super (key: key);

  @override
  _ForumState createState() => _ForumState();
}


class _ForumState extends State<Forum> {

  static const List<Map<String, String>> forumQuestionList = [
    {"name": "Ira Gilligan", "questionTitle": "How to juggle 5 courses in a semester?", "questionText": "I'm planning for the next sem, just wondering"},
    {"name": "George Oscar", "questionTitle": "How do you guys find internships?", "questionText": "I plan to start getting experience this summer."},
    {"name": "Lindsay Bluth", "questionTitle": "What courses are best to take this coming Fall?", "questionText": "Looking for some fun and educational electives"},
    {"name": "Siobhan Roy", "questionTitle": "Is capstone super demanding?", "questionText": "Ngl I'm kinda stressed about it."},
    {"name": "Roman Roy", "questionTitle": "How to go about forming teams for capstone?", "questionText": "And do we have to start early?"},
    {"name": "Jonathan Cross", "questionTitle": "I failed a course. What next?", "questionText": "Is it the end of the road?"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forum", style: TextStyle(fontSize: 30, color: Colors.white)), backgroundColor: ALMOST_BLACK),
    );
  }

}

