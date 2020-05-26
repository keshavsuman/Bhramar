import 'package:flutter/material.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/contribute.dart';
import 'package:gui/pages/loginpage.dart';
import 'package:gui/pages/myappbar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'mydrawer.dart';
import 'newspage.dart';
import 'search.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  int startindex = 0;
  int endindex = 5;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> cards = [];
  String newsUrl;
  String baseUrl = 'http://13.127.99.206/api/bhramar/getnews/';
  String categoryUrl = 'http://13.127.99.206/api/bhramar/getallcategories/';
  int _activeindex = 0;
  int loggedin=0;
  int initialbuild=0;

  Future<Map<String,String>> getcategories() async {
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
  void initState() {
    super.initState();
    isloggedin();
  }
 void isloggedin() async
    {
      final prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey('user_id'))
      {
        setState(() {
      loggedin=1;
        });
      }
      else
      {
        setState(() {
      loggedin=0;
        });
      }
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex:1,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 20.0, left: 20.0),
                      child:FutureBuilder(
                            future: getcategories(),
                            builder: (context , snapshot){
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
                Expanded(
                  flex:1,
                  child: Container(
                    color:Colors.black,
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                size: 10*Styling.imageSizeMultiplier,
                              ),
                              Positioned(
                                top: 16.0,
                                child: Text('.',
                                    style: TextStyle(
                                        fontSize: 6*Styling.imageSizeMultiplier,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          Container(
                            width: 8*Styling.heightSizeMultiplier,
                            height: 8*Styling.heightSizeMultiplier,
                          ),
                          GestureDetector(
                            onTap: () {
                              if(loggedin==1){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>Contribution()));
                              }
                              else
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginSignupChoice()));
                              }
                            },
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  size: 10*Styling.imageSizeMultiplier,
                                ),

                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            )),
        drawer: Mydrawer(),
        appBar: myAppBar(context),
        floatingActionButton: Container(
          width: 8*Styling.heightSizeMultiplier,
          height: 8*Styling.heightSizeMultiplier,
          child: FloatingActionButton(
            elevation: 10.0,
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: Icon(Icons.search, color: Colors.black),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
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
