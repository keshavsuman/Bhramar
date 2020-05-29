import 'package:flutter/material.dart';
import 'package:gui/pages/home2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ResponsiveSize.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    showIntro();
  }
  Future<Null> showIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('loggintime')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home2()));
    }
    else
    {
      prefs.setString('loggintime', '1');
    }
  }
  int currentIndex = 0;
  void next() {
    setState(() {
      currentIndex = ++currentIndex;
    });
  }

  void prev() {
    setState(() {
      currentIndex = --currentIndex;
    });
  }

  Widget firstPage(BuildContext context)
  {
    return Container(
      height: Styling.deviceHeight,
      width: Styling.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 3*Styling.heightSizeMultiplier),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Reveal',
                style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier),
              ),
              Text(
                'the Truth!',
                style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier),
              ),
              // Text('Securedslgdrtjui gifjgdtio hj orgs joit hj posryt;l jk'),
            ],
          ),
          Container(
            height:100*Styling.imageSizeMultiplier,
            child: Image.asset(Styling.firstPageImage),
          ),
          SizedBox(height: 9*Styling.heightSizeMultiplier),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder()
                      ),
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    next();
                  },
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: <Widget>[
                        Text('Next  ',
                          style: TextStyle(
                              color: Colors.white
                          ),),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget secondPage(BuildContext context)
  {
    return Container(
      height: Styling.deviceHeight,
      width: Styling.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 3*Styling.heightSizeMultiplier),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Explore',
                style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier),
              ),
              Text(
                'the Facts !',
                style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier),
              ),
              // Text('Securedslgdrtjui gifjgdtio hj orgs joit hj posryt;l jk'),
            ],
          ),
          Container(
            height:100*Styling.imageSizeMultiplier,
            child: Image.asset(Styling.secondPageImage),
          ),
          SizedBox(height: 9*Styling.heightSizeMultiplier),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                      ),
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    next();
                  },
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: <Widget>[
                        Text('Next  ',
                          style: TextStyle(
                              color: Colors.white
                          ),),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget thirdPage(BuildContext context)
  {
    return Container(
      height: Styling.deviceHeight,
      width: Styling.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 3*Styling.heightSizeMultiplier),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Contribute',
                style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier),
              ),
              Text(
                'For Betterment',
                style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier),
              ),
              // Text('Securedslgdrtjui gifjgdtio hj orgs joit hj posryt;l jk'),
            ],
          ),

          Container(
            height:100*Styling.imageSizeMultiplier,
            child: Image.asset(Styling.thirdPageImage),
          ),
          SizedBox(height: 9*Styling.heightSizeMultiplier),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      child: Card(
                        shape:CircleBorder(),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Home2()));
                  },
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: <Widget>[
                        Text('Next  ',
                          style: TextStyle(
                              color: Colors.white
                          ),),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Container> pages = [];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context,constraints)
    {
      Styling.init(constraints,MediaQuery.of(context).orientation);
      pages.add(firstPage(context));
      pages.add(secondPage(context));
      pages.add(thirdPage(context));
      return Scaffold(
        body: pages[currentIndex],
      );
    }
    );
  }
}
