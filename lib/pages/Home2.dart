import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/contribute.dart';
import 'package:gui/pages/loginpage.dart';
import 'package:gui/pages/mydrawer.dart';
import 'package:gui/pages/search.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

import 'newspage.dart';
class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<Widget> bodyPages = [
    NewsSection(),
    Search(),
    Contribution(),
  ];
  int bodyindex = 0;
 Future<Null> checklogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    if (prefs.containsKey('username')) {
      bodyindex=2;
    }
    else
    {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginSignupChoice()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:LayoutBuilder(
            builder:(context,constraints){
              Styling.init(constraints, MediaQuery.of(context).orientation);
              return Scaffold(
                drawer: Mydrawer(),
                body: bodyPages[bodyindex],
                bottomNavigationBar: CurvedNavigationBar(
                  items: <Widget>[
                    Icon(Icons.home, color: Colors.white),
                    Icon(Icons.search, color: Colors.white),
                    Icon(Icons.assignment, color: Colors.white)
                  ],
                  color: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Theme
                      .of(context)
                      .backgroundColor,
                  onTap: (value) {
                    setState((){
                      if(value==2)
                      {
                       checklogin();
                      }
                      else{
                      this.bodyindex = value;
                      }

                    });
                  },
                ),
              );
            } ),
        );
  }
}

class NewsSection extends StatefulWidget {
  int startindex = 0;
  int endindex = 5;
  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Widget> cards = [];
  String newsUrl;
  String baseUrl = 'http://13.127.99.206/api/bhramar/getnews/';
  int _activeindex=0;

  Future<Map<String,String>> getcategories() async {

    String categoryUrl = 'http://13.127.99.206/api/bhramar/getallcategories/';
    
    Map<String,String> categorydata={};
    http.Response response = await http.get(Uri.encodeFull(categoryUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      data.forEach((k, item) {
        categorydata.putIfAbsent(item['category_name'], () => item['category_id']);
      });
    } else {
      //
    }
   
    return categorydata;
  }
  Future<List<News>> getnews() async {
    List<News> _news = [];
    if(this.newsUrl==null)
      {
        this.newsUrl=this.baseUrl+'2';
      }
    http.Response response = await http.get(Uri.encodeFull(this.newsUrl));
    if (response.statusCode == 200) {
      var news = json.decode(response.body);
      _news.clear();
      news.forEach((k, item) {
        News news = News(
          heading: item['news_heading'],
          article: item['news_article'],
          newsUrl: item['news_url'],
          imageUrl: item['image_url'],
          // description: item['bag_of_words'],
          description: 'sfhsryt',
          publicationDate: item['published_date'],
          resource: 'Hindustan times',
        );
        _news.add(news);
      });
    }
    return _news;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width:Styling.deviceWidth,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.menu,color: Colors.black), onPressed: ()
                  {
                    Scaffold.of(context).openDrawer();
                  }),
                  Container(
                      width: 9*Styling.blockSizevertical,
                      child: Image.asset(Styling.logo)),
                  Icon(Icons.ac_unit, color: Colors.white,)
                ],
              ),
            ),
            Center(
              child: Container(
                height:7*Styling.blockSizevertical,
                child:FutureBuilder(
                    future: getcategories(),
                    builder: (context , snapshot){
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                              child: Text('There is some network issue...'));
                        case ConnectionState.active:
                          return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
                              ));
                        case ConnectionState.waiting:
                          return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
                              ));
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            Map<String,String> data=snapshot.data;
                            List<String> categoryname=[];
                            data.forEach((key, value) {
                              categoryname.add(key);
                            });
                            return  Container(
                                height: 8*Styling.heightSizeMultiplier,
                                child:ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            String categoryid =data[categoryname[index]];
                                            this.newsUrl =
                                                this.baseUrl + '/$categoryid';
                                            _activeindex = index;
                                          });
                                        },
                                        child: index == _activeindex
                                            ? Stack(
                                          alignment: Alignment.topCenter,
                                          children: <Widget>[
                                            Text(categoryname[index],
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 8*Styling.fontSizeMultiplier)),
                                            Positioned(
                                              top: 10.0,
                                              child: Text('.',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 9*Styling.fontSizeMultiplier,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            )
                                          ],
                                        )
                                            : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            categoryname[index],
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      );
                                    }));
                            // return null;
                          }}
                      return null;
                    })
              ),
            ),
            Expanded(
                   flex:8,
                  child: Container(
                    child: FutureBuilder(
                        future: getnews(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Center(
                                  child: Text('There is some network issue '));
                            case ConnectionState.active:
                              return Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
                              ));
                            case ConnectionState.waiting:
                              return Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
                              ));
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else {
                              //   void addcard()
                              // {

                              // }
                                List<News> _news = snapshot.data;
                                cards.clear();
                                double j = 5;
                                double w =Styling.deviceWidth-8*Styling.heightSizeMultiplier;
                                if (_news.isEmpty) {
                                  print('no news');
                                } else
                                  for (int i = widget.startindex;
                                      i < widget.endindex;
                                      i++) {
                                    w = w + 10;
                                    j = j - 5;
                                    cards.add(_card(w, -j, _news[i], context));
                                  }
                                return Stack(
                                  overflow: Overflow.visible,
                                    alignment: Alignment.topCenter,
                                    children: cards);
                              }
                          }
                          return null;
                        }),
                  ),
                ),
          ],
        )
    );
  }

  Widget _card(double width, double top, News news, BuildContext context) {
    return Positioned(
      top: top,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Newspage(
                      news.heading,
                      news.description,
                      news.newsUrl,
                      news.imageUrl,
                      news.article,
                      news.publicationDate,
                      news.resource)));
        },
        child: Dismissible(
          onDismissed: (DismissDirection d)
          {
            if(cards.length<5)
            {
              // addcard();
            }
          },
          key:Key(news.heading),
          child: Card(
             color: Colors.grey[100],
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                width: width,
                height: 66*Styling.heightSizeMultiplier,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10.0)),
                        child: Image.network(news.imageUrl, fit: BoxFit.cover)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.heading,
                        style: TextStyle(fontSize: 5*Styling.fontSizeMultiplier),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            news.publicationDate,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(news.resource,
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: news.article.length > 250
                            ? Text(news.article)
                            : Text('Article in too big'))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class News {
  News(
      {this.heading,
      this.description,
      this.article,
      this.imageUrl,
      this.newsUrl,
      this.publicationDate,
      this.resource});
  String heading;
  String description;
  String article;
  String imageUrl;
  String newsUrl;
  String publicationDate;
  String resource;
}
