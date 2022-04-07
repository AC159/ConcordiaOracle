import 'package:flutter/material.dart';

import '../main.dart';

class Ratings extends StatefulWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  _RatingsState createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {

  static const List<Map<String, String>> questionList = [
    {"title": "Val Noc", "department": "Software Engineering", "rating": "5/5"},
    {"title": "John Doe", "department": "Electrical Engineering", "rating": "4.5/5"},
    {"title": "Jane Doe", "department": "Journalism", "rating": "2.5/5"},
    {"title": "Adam Peterson", "department": "Computer Engineering", "rating": "4.8/5"},
    {"title": "Jason Stuart", "department": "Computer Science", "rating": "5/5"},
    {"title": "Joseph Mercier", "department": "Software Engineering", "rating": "5/5"},
    {"title": "Alexander Peters", "department": "Software Engineering", "rating": "2/5"},
    {"title": "Alexandra Paquet", "department": "Software Engineering", "rating": "1/5"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ratings", style: TextStyle(fontSize: 30, color: Colors.white)), backgroundColor: ALMOST_BLACK),
      body: Container(
        color: ALMOST_BLACK,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: Text("My questions", style: TextStyle(color: Colors.white, fontSize: 18))),
                  TextButton(onPressed: () {}, child: Text("My answers", style: TextStyle(color: Colors.white, fontSize: 18)))
                ]
            ),

           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: TextField(
                     style: TextStyle(color: Colors.white),
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                         filled: true,
                         fillColor: LIGHT_GREY,
                         hintText: "search...",
                         hintStyle: TextStyle(color: Colors.white),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)
                         )
                     )
                 )
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     TextButton(
                       child: Text("Filter", style: TextStyle(color: Colors.white, fontSize: 16)),
                       onPressed: () {}
                     ),
                     TextButton(
                        child: Text("See all", style: TextStyle(color: Colors.white, fontSize: 16)),
                        onPressed: () {}
                     )
                   ],
                 ),
               )

             ]
           ),

            Expanded(
              child: ListView.builder(
                  itemCount: questionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                          elevation: 5,
                          color: LIGHT_GREY,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${questionList[index]['title']}", style: TextStyle(color: Colors.white, fontSize: 20)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${questionList[index]['department']}", style: TextStyle(color: Colors.white, fontSize: 18)),
                                      Text("${questionList[index]['rating']}", style: TextStyle(color: Colors.white, fontSize: 18)),
                                    ]
                                  ),
                                ),
                                Row(
                                  children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                     child: Icon(Icons.thumb_up, color: Theme.of(context).primaryColor)
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                     child: Icon(Icons.thumb_down, color: Theme.of(context).primaryColor)
                                   )
                                  ]
                                )
                              ]
                            )
                          )
                      ),
                    );
                  }
              ),
            )

          ]
        )
      )
    );
  }
}

