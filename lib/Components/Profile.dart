import 'package:concordia_oracle/Providers/Authentication/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  static const List<String> questionList = [
    'What are the best study techniques in software engineering?',
    'What are the best electives in computer science?',
    'Unfair grading in one of my assignments. How should I resolved this with my professor?',
    'How do I stay motivated for team projects?',
    'Where do I find peer-reviewed scholarly articles?',
    'Where to make friends for new students?'
    'What are the best clubs at Concordia?'
  ];

  @override
  Widget build(BuildContext context) {

    var currentUser = Provider.of<AuthenticationProvider>(context, listen: false);
    String? photoUrl = currentUser.currentUser?.photoURL;
    double containerHeight = MediaQuery.of(context).size.height * 0.65;

    return Scaffold(
      body: Container(
        color: LIGHT_BLUE,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profile", style: TextStyle(fontSize: 30)),
                              Text("${currentUser.currentUser?.displayName}", style: TextStyle(fontSize: 18))
                            ]
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(image: NetworkImage(
                              photoUrl != null ? photoUrl : "https://www.pinclipart.com/picdir/middle/148-1486972_mystery-man-avatar-circle-clipart.png",
                              scale: 1.0
                          ))
                        )
                      ]
                    ),
                  )
              ),
            ),

            Container(
                decoration: BoxDecoration(
                    color: ALMOST_BLACK,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                ),
                height: containerHeight,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {}, child: Text("My questions", style: TextStyle(color: Colors.white, fontSize: 18))),
                        TextButton(onPressed: () {}, child: Text("My answers", style: TextStyle(color: Colors.white, fontSize: 18)))
                      ]
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      ),
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
                                child: ListTile(
                                    leading: Icon(Icons.question_answer),
                                    title: Text(questionList[index], style: TextStyle(color: Colors.white))
                                )
                            ),
                          );
                        }
                      ),
                    )
                  ]
                )
            )

          ]
        )
      ),
    );
  }
}

