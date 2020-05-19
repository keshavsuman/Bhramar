import 'package:flutter/material.dart';
import 'package:gui/pages/myappbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'mydrawer.dart';
import 'newspage.dart';
import 'searchresult.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> list = ['All', 'Trends', 'Most Viewed', 'Recommended'];
  int active = 0;
  Future<List<News>> getnews() async {
    List<News> _news = [];
    http.Response response = await http.get(Uri.encodeFull(
        'http://35.154.92.159/api/bhramar/getnews/4'));
    if (response.statusCode == 200) {
      var news = json.decode(response.body);
      news.forEach((k, item) {
        News news = News(
            heading: item['news_heading'],
            article: item['news_article'],
            newsUrl: item['news_url'],
            imageUrl: item['image_url'],
            // description: item['bag_of_words'],
            description: '',
            publicationDate: item['published_date'],
            resource: 'Hindustan times');
        _news.add(news);
      });
    }
    return _news;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
                  child: Container(
                      child: Text('Let\'s Search \nThe Truth !',
                          style: TextStyle(
                            fontSize: 35,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage(value)));
                      },
                      decoration: InputDecoration(
                          hintText: 'Search your news here',
                          hintStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).accentColor,
                          )),
                    ),
                  ),
                ),
                Container(
                    height: 120.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        Container(
                          width: 50,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        Container(
                          width: 50,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        Container(
                          width: 50,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10.0)),
                        )
                      ],
                    )),
                Container(
                    height: 50.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                active = index;
                              });
                            },
                            child: index != active
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Text(list[index]),
                                  )
                                : Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10.0),
                                          child: Text(list[index]),
                                        ),
                                        Positioned(
                                            top: 5,
                                            child: Text('.',
                                                style:
                                                    TextStyle(fontSize: 35.0)))
                                      ]),
                          );
                        })),
                Container(
                    height: MediaQuery.of(context).size.height / 2.45,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
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
                                List<News> _news = snapshot.data;
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _news.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 5.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Newspage(
                                                            _news[index]
                                                                .heading,
                                                            _news[index]
                                                                .description,
                                                            _news[index]
                                                                .newsUrl,
                                                            _news[index]
                                                                .imageUrl,
                                                            _news[index]
                                                                .article,
                                                            _news[index]
                                                                .publicationDate,
                                                            _news[index]
                                                                .resource)));
                                          },
                                          child: Container(
                                            width: 300.0,
                                            child: Column(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top:
                                                              Radius.circular(
                                                                  20.0)),
                                                  child: Image.network(
                                                      _news[index].imageUrl),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                  child: Text(
                                                      _news[index].heading),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(_news[index]
                                                          .publicationDate),
                                                      Text(_news[index]
                                                          .resource),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }
                          }
                          return Text('');
                        })),
              ],
            ),
          ),
        ),
        appBar:myAppBar(context),
        drawer: Mydrawer(),
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
