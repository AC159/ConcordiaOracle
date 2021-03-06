import "package:flutter/material.dart";
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:after_layout/after_layout.dart';
import "../main.dart";

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super (key: key);

  @override
  _ForumState createState() => _ForumState();
}


class _ForumState extends State<Forum> with AfterLayoutMixin<Forum> {
  List<Map<String, String>> forumQuestionList = [
    {"name": "Ira Gilligan", "questionTitle": "How to juggle 5 courses in a semester?", "questionText": "I'm planning for the next sem, just wondering"},
    {"name": "George Oscar", "questionTitle": "How do you guys find internships?", "questionText": "I plan to start getting experience this summer."},
    {"name": "Lindsay Bluth", "questionTitle": "What courses are best to take this coming Fall?", "questionText": "Looking for some fun and educational electives"},
    {"name": "Siobhan Roy", "questionTitle": "Is capstone super demanding?", "questionText": "Ngl I'm kinda stressed about it."},
    {"name": "Roman Roy", "questionTitle": "How to go about forming teams for capstone?", "questionText": "And do we have to start early?"},
    {"name": "Jonathan Cross", "questionTitle": "I failed a course. What next?", "questionText": "Is it the end of the road?"},
  ];

  static const Image add_plus = Image(image: AssetImage("assets/images/plus.png"));

  PanelController _pc = new PanelController();

  @override
  void afterFirstLayout(BuildContext context) {
    //_pc.hide();
  }

  void closePanel() {
    FocusManager.instance.primaryFocus?.unfocus();
    _pc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forum", style: TextStyle(fontSize: 30, color: Colors.white),),
          backgroundColor: ALMOST_BLACK,
          elevation: 0,
          actions: <Widget>[IconButton(onPressed: () => {_pc.open()}, icon: add_plus, iconSize: 80)],
        ),
        body: SlidingUpPanel(
          controller: _pc,
          panel: Center(
              child: _form(context)
          ),
          body: forumContainer(),
          minHeight: 0, // should be behind the bottom navbar
          isDraggable: false,
          backdropOpacity: 1, // does not work
          backdropTapClosesPanel: true, // also does not work
          color: ALMOST_BLACK,
        )
    );
  }

  Widget forumContainer()
  {
    return Container(
        color: ALMOST_BLACK,
        child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: forumQuestionList.length,
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
                                          child: Column(
                                              children: [
                                                Text("${forumQuestionList[index]['name']}", style: TextStyle(color: Colors.white, fontSize: 20)),
                                              ]
                                          )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${forumQuestionList[index]['questionTitle']}", style: TextStyle(color: Colors.white, fontSize: 20)),
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
              ),
            ]
        )
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var questionCategories = <String>["General", "Internships", "Courses", "Teachers", "Social"].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(value: value, child: Text(value));
  }).toList();

  String dropdownValue = "General";

  Widget _form(BuildContext context) {
    const double offset = 20;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ALMOST_BLACK,
            elevation: 0,
            leading: IconButton(
              onPressed: () => this.closePanel(),
              icon: Icon(Icons.cancel_outlined),
              color: Color.fromRGBO(66, 192, 251, 1),
              iconSize: 50,
              padding: EdgeInsets.only(left: 10),
            ),
            actions: [IconButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  // We do nothing :)
                }
              },
              icon: add_plus,
              iconSize: 80,
            )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: offset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text("Categories:", style: TextStyle(fontSize: 24, color: Colors.white),)),
                  Container(
                    width: MediaQuery.of(context).size.width - (offset*2), // there is probably a cleaner way, but I don't know what it is and can't think of it rn.
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: LIGHT_GREY
                    ),
                    child: DropdownButtonFormField<String>(
                      //isExpanded: true,
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: LIGHT_GREY,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            fillColor: LIGHT_GREY
                        ),
                        value: dropdownValue,
                        items: questionCategories,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }
                    ),),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text("Question:", style: TextStyle(fontSize: 24, color: Colors.white,),)),
                  TextFormField(
                    maxLines: null,
                    minLines: 8,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: LIGHT_GREY,
                        hintText: "Write Question...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  )
                ],
              )
          ),
        ],
      ),
    );
  }


}

