import 'package:flutter/material.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/myappbar.dart';
class ContactUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: myAppBar(context),
        body: Container(
          width:Styling.deviceWidth,
          height:Styling.deviceHeight,
          child: Column(
            children: [
              Text('Contact Us',style: TextStyle(
                fontSize: 40.0
              ),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.mail),
                  ),
                  Text('bhramarsearchingfortruth@gmail.com',style: TextStyle(
                    fontSize: 16.0
                  ),)
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width:30.0,
                      height:30.0,
                      child:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ2am3j3POSNE5p4no2JLgAZ6LbXThN7zVnMa6_h9DQt-kclxu5&usqp=CAU')
                    )
                  ),
                  Text('https://www.instagram.com/bhraamar/',style: TextStyle(
                    fontSize: 16.0
                  ),)
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width:30.0,
                      height:30.0,
                      child:Image.network('https://w7.pngwing.com/pngs/110/230/png-transparent-whatsapp-application-software-message-icon-whatsapp-logo-whats-app-logo-logo-grass-mobile-phones.png')
                    )
                  ),
                  Text('Whatsapp no: 9691565883',style: TextStyle(
                    fontSize: 20.0
                  ),)
                ]),
              ),
            ],
          ),
        ),
      ) 
    );
  }
}