import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/myappbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String email;
  String password;
  int loggingstate = 0;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> loginKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      http.Response response = await http.post(
          'http://13.127.99.206/api/bhramar/login/',
          body: {'email_id': email, 'password': password});
        print(response.body);
      if (response.statusCode == 200 && response.body!='0') {
        var userdata=json.decode(response.body);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('user_id', userdata[0]['user_id']);
        prefs.setString('username',userdata[0]['firstname']);
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        loginKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Wrong Credentials'),
            duration: Duration(seconds: 4),
          ));
          setState(() {
          loggingstate=0;
            
          });
      }
    }

    return Scaffold(
      appBar: myAppBar(context),
      key: loginKey,
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 6*Styling.heightSizeMultiplier),
                Center(
                  child: Container(
                    width: 60*Styling.imageSizeMultiplier,
                    child: Image.asset(Styling.logo),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text('Login.', style: TextStyle(fontSize: 14*Styling.fontSizeMultiplier))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text('Login to your account to help society'),
                ),
                SizedBox(height: 12*Styling.heightSizeMultiplier),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      this.email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email can't be null";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      this.password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password can't be null";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                SizedBox(height: 6*Styling.heightSizeMultiplier),
                Center(
                  child: Container(
                    width:  24*Styling.heightSizeMultiplier,
                    height: 8*Styling.heightSizeMultiplier,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              login();
                              loggingstate = 1;
                            });
                          }
                        },
                        child: loggingstate != 1
                            ? Text('Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 5*Styling.fontSizeMultiplier))
                            : CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Forget password'),
                      Text('News user Sign up')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String firstName;
  String lastName;
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> signupKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Future<void> signup() async {
      http.Response response =
          await http.post('http://13.127.99.206/api/bhramar/signup/', body: {
        'firstname': firstName,
        'lastname': lastName,
        'email_id': email,
        'password': password
      });
      if (response.statusCode == 200) {
        var userdata=json.decode(response.body);
        print(response.body);
        if(response.body=='\"User Already Exists\"')
        {
          signupKey.currentState.showSnackBar(
          SnackBar(
            content: Text('User Already Exists'),
            duration: Duration(seconds: 4),
          ));
        }
        else{
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('user_id',userdata[0]['user_id']);
          prefs.setString('username',userdata[0]['firstname']);
          Navigator.pop(context);
        }
      }
    }

    return Scaffold(
      key: signupKey,
      appBar: myAppBar(context),
      body: Container(
        width: Styling.deviceWidth,
        height: Styling.deviceHeight,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 6*Styling.heightSizeMultiplier),
                Center(
                  child: Container(
                    width: 30*Styling.heightSizeMultiplier,
                    child: Image.asset(Styling.logo),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Text('Signup.', style: TextStyle(fontSize: 16*Styling.fontSizeMultiplier)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text(
                    'Create a account to contribute to society',
                    style: TextStyle(fontSize: 5*Styling.fontSizeMultiplier),
                  ),
                ),
                SizedBox(height: 6*Styling.heightSizeMultiplier),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      this.firstName = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "First name can't be null";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: 'First name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      this.lastName = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Second name can't be null";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: 'last name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      this.email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email can't be null";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: 'email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      this.password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password can't be null";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: 'password'),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const  EdgeInsets.only(top:20.0),
                    child: Container(
                    width:24*Styling.heightSizeMultiplier,
                    height:8*Styling.heightSizeMultiplier,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            signup();
                          }
                        },
                        child: Text('Sign up',
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 5*Styling.fontSizeMultiplier
                        )),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginSignupChoice extends StatefulWidget {
  @override
  _LoginSignupChoiceState createState() => _LoginSignupChoiceState();
}

class _LoginSignupChoiceState extends State<LoginSignupChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Container(
        width: Styling.deviceWidth,
        height: Styling.deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 24*Styling.heightSizeMultiplier),
            Container(
              width: Styling.deviceWidth/1.5,
              child: Image.asset(Styling.logo),
            ),
            SizedBox(height: 6*Styling.heightSizeMultiplier),
            Text(
              'You are not logged in',
              style: TextStyle(fontSize: 5*Styling.fontSizeMultiplier),
            ),
            SizedBox(height: 15*Styling.heightSizeMultiplier),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyLogin()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                width: Styling.deviceWidth,
                height: 8*Styling.heightSizeMultiplier,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                      child: Text('Login',
                          style:
                              TextStyle(fontSize: 5*Styling.fontSizeMultiplier, color: Colors.white))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'or',
                style: TextStyle(fontSize: 5*Styling.fontSizeMultiplier),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signup()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                width: Styling.deviceWidth,
                height: 8*Styling.heightSizeMultiplier,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                      child: Text('Sign up',
                          style:
                              TextStyle(color: Colors.white, fontSize: 5*Styling.fontSizeMultiplier))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
