import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gui/pages/myappbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../ResponsiveSize.dart';

class Contribution extends StatefulWidget {
  @override
  _ContributionState createState() => _ContributionState();
}

class _ContributionState extends State<Contribution> {
  String newsHeading;
  String newsDescription;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> sendnews() async {
    final prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id');
    http.Response response = await http
        .post('http://35.154.92.159/api/bhramar/addcontributionnews/', body: {
      'news_heading': newsHeading,
      'news_description': newsDescription,
      'user_id': '$userId',
    });
    if (response.statusCode == 200) {
      scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Your news have been submitted'),
            duration: Duration(seconds: 3),
          ));
    } else {
      print(response.body);
      scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('There is a problem in news submission'),
            duration: Duration(seconds: 3),
          ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: myAppBar(context),
        body: Container(
            color: Theme.of(context).backgroundColor,
            height: Styling.deviceHeight,
            width: Styling.deviceWidth,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 6*Styling.heightSizeMultiplier),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Help Bhramar',
                        style: TextStyle(fontSize: 9*Styling.fontSizeMultiplier),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Help Society.',
                        style: TextStyle(fontSize: 9*Styling.fontSizeMultiplier),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                          'Help us grow more by adding \nfake news you know'),
                    ),
                    SizedBox(height: 3*Styling.heightSizeMultiplier),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "News heading can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              this.newsHeading = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'News Heading',
                              labelText: 'News Heading',
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: TextFormField(
                              maxLines: 15,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "News Description can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  this.newsDescription = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'News description',
                                  border: OutlineInputBorder()))),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          sendnews();

                      }},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            height: 80.0,
                            width: 250.0,
                            child: Card(
                              elevation: 7.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Center(child: Text('Contribute news',
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                              ))),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
