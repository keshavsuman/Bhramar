import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ResponsiveSize.dart';
import 'myfeedback.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  String username;
  Future<void> getusername() async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('username'))
      setState(() {
        username=prefs.getString('username');
      });
    else
      setState(() {
        username='demouser';
      });
  }
  @override
  void initState() {
    super.initState();
    getusername();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 30*Styling.heightSizeMultiplier,
              child: DrawerHeader(
                  child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 8*Styling.heightSizeMultiplier,
                    backgroundImage: NetworkImage(
                        'http://35.154.92.159/api/assets/user-demo.png'),
                  ),
                  Text(
                    username,
                    style: TextStyle(fontSize: 7*Styling.fontSizeMultiplier),
                  ),
                  Text(
                    'Contributor',
                    style: TextStyle(fontSize: 4*Styling.fontSizeMultiplier),
                  )
                ],
              )),
            ),
            Container(
              height: Styling.deviceHeight-300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
//                      GestureDetector(
//                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Profile()));
//                          },
//                          child: ListTile(leading: Text('Profile'))),
                      GestureDetector(
                          onTap: () {
//                            Navigator.popAndPushNamed(context, Myfeedback());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Myfeedback()));
                          },
                          child: ListTile(leading: Text('Feedback'))),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Aboutus()));
                          },
                          child: ListTile(leading: Text('About us'))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Designed and Developed With Love\n by Bhramar'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
