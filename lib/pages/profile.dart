import 'package:flutter/material.dart';
import 'package:gui/pages/myappbar.dart';

import '../ResponsiveSize.dart';
import 'mydrawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: myAppBar(context),
        drawer: Mydrawer(),
        body:Column(
          children:<Widget>[
          Expanded(
            flex:3,
            child:Container(
              width:Styling.deviceWidth/2,
              decoration: BoxDecoration(
                color: Colors.black,
                shape:BoxShape.circle
              )
            )
          ),
          Expanded(
              flex:7,
              child:Container(
                width:Styling.deviceWidth,
                color: Colors.amber,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Text('Hi,',
                          style: TextStyle(
                            fontSize: Styling.fontSizeMultiplier*8,
                          ),),
                          Text('Keshav suman',style: TextStyle(
                            fontSize: Styling.fontSizeMultiplier*8,
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Keshavsuman96@gmail.com'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('News you have Contributed:'),
                    )
//                    Container(
//                      height
//                    )
                  ],
                )
              )
              )
    ]
        )
      )
    );
  }
}