import 'package:flutter/material.dart';
import 'package:gui/pages/myappbar.dart';
import 'package:gui/pages/mydrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ResponsiveSize.dart';
import 'package:http/http.dart' as http;

import 'home.dart';


class Myfeedback extends StatefulWidget {
  @override
  _MyfeedbackState createState() => _MyfeedbackState();
}

class _MyfeedbackState extends State<Myfeedback> {

  String feedback;
  void sendFeedback() async
  {
    final prefs = await SharedPreferences.getInstance();
    int id=prefs.getInt('user_id');
    http.Response response= await http.post('http://35.154.92.159/api/bhramar/feedback/',
    body: {
        'feedback':feedback,
        'user_id':'$id',
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Styling.deviceWidth,
        height: Styling.deviceHeight,
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('Feedback',style:TextStyle(
                      fontSize: 10*Styling.fontSizeMultiplier
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width:7*Styling.heightSizeMultiplier,
                          child: Center(child: Text('To:',
                          style: TextStyle(
                            fontSize: 6*Styling.fontSizeMultiplier,
                            fontWeight: FontWeight.bold
                          ),))),
                        Container(
                          width:Styling.deviceWidth-8*Styling.heightSizeMultiplier,
                          child: TextFormField(
                            readOnly: true,
                            initialValue: 'Bhramarsearchfortruth.com',
                            decoration: InputDecoration(
                              border: OutlineInputBorder()
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    autofocus: true,
                    maxLines: 25,
                    onChanged: (value)
                    {
                      feedback=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Type your Feedback here...',
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                      onPressed: (){

                      },
                      child: GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>Home()));
                        },
                        child: Text('send',style: TextStyle(
                          color:Colors.white
                        ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
        ),
      appBar: myAppBar(context),
      drawer: Mydrawer(),
    );
  }
}
class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Container(
          width:Styling.deviceWidth,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:10*Styling.heightSizeMultiplier),
              Container(
                width:Styling.deviceWidth/3,
                child: Image.asset(Styling.logo),
              ),
              SizedBox(height:10*Styling.heightSizeMultiplier),
              Text('We provide information about Fake news'),
            ],
          )
        ),
      ) 
    );
  }
}