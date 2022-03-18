import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'SlideItems.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {

  final List<SlideItem> imageList = SlideItem.getSlideItems();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                itemCount: imageList.length,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  height: MediaQuery.of(context).size.height * 0.7
                ),
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(imageList[itemIndex].url)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(imageList[itemIndex].title, style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
                          ),
                          Text(imageList[itemIndex].description)
                        ]
                      )
                  );
                },
            ),
            Text('Welcome to Concordia Oracle!', style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)
                    ),
                    child: Text('Sign up'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Have an account?',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                      TextButton(
                        child: Text('Login', style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        }
                      )
                    ]
                )
              ]
            )
          ]
        )
      )
    );
  }
}

