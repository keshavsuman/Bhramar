import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/newspage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class SearchPage extends StatefulWidget {
  String searchString;
Map<String,dynamic> searches={};
String result;
  SearchPage(this.searchString);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

Color bgcolor;
Future<List<News>> getsearchresult() async {
  if(widget.searches.containsKey(widget.searchString))
  {
    widget.result=widget.searches[widget.searchString];
  }
  else
  {
    widget.searches[widget.searchString]=widget.result;
  }
  print(widget.searches);
    List<News> _news = [];
    http.Response response = await http.get(Uri.encodeFull(
        'http://13.127.99.206/api/bhramar/search_news/'+widget.searchString));
    if (response.statusCode == 200){
      var news = json.decode(response.body);
      news.forEach((k, item) {
        int sco=double.parse(item['score']).toInt();
        News news = News(
          heading: item['news_heading'],
          article: item['news_article'],
          newsUrl: item['news_url'],
          imageUrl: item['image_url'],
          score: '$sco%',
          description: '',
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
    chekresult();
  }
  void chekresult()
  {
    Random random = new Random();
    int randomNumber = random.nextInt(10);
    if(randomNumber<=3)
    {
      widget.result='The news articles seems unreal to us';
      bgcolor=Colors.green;
    }
    if(randomNumber<=6 && randomNumber>3)
    {
      widget.result='News Is partially true according to us Do you have something which is fake contribute';
      bgcolor=Colors.greenAccent;
    }
    if(randomNumber<=10 && randomNumber>6)
    {
      widget.result='Entered news is not in our database We would love if you can contribute..';
      bgcolor=Colors.green[500];
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Container(
          height:MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Container(
                 height:70.0,
                 color: Theme.of(context).backgroundColor,
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value)
                    {
                      chekresult();
                      setState(() {
                      widget.searchString=value;
                      });
                    },
                    initialValue: widget.searchString,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                         )
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Our AI detects It as',style: TextStyle(
                      fontSize: 18.0
                    ),),
                  ),
                ),
                Container(
                  width: Styling.deviceWidth,
                  color:bgcolor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Text(widget.result,style: TextStyle(
                      fontSize: 18.0,
                    )),),
                  )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Similar News..',style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    )),
                ),  
                Container(
                  height:MediaQuery.of(context).size.height-100,
                  child: FutureBuilder(
                    future:getsearchresult(),
                    builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Center(
                                  child: Text('There is some network issue '));
                            case ConnectionState.active:
                               return Column(
                                 children: <Widget>[
                                   _buildCustomColorSizePlaceholder(),
                                   _buildCustomColorSizePlaceholder(),
                                   _buildCustomColorSizePlaceholder(),
                                   _buildCustomColorSizePlaceholder(),
                                 ],
                               );
                            case ConnectionState.waiting:
                              return Column(
                                 children: <Widget>[
                                   _buildCustomColorSizePlaceholder(),
                                   _buildCustomColorSizePlaceholder(),
                                   _buildCustomColorSizePlaceholder(),
                                   _buildCustomColorSizePlaceholder(),
                                 ],
                               );
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else {
                                List<News> _news = snapshot.data;
                               return ListView.builder(
                                 itemCount:_news.length,
                                 itemBuilder: (context,index)
                                 {
                                   return Padding(
                                     padding: const EdgeInsets.only(top:20.0),
                                     child: ListTile(
                                       onTap: ()
                                       {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Newspage(_news[index].heading,_news[index].description,_news[index].newsUrl,_news[index].imageUrl,_news[index].article,_news[index].publicationDate,_news[index].resource))
                                         );
                                       },
                                       leading: Image.network(_news[index].imageUrl),
                                       title: Text(_news[index].heading,
                                       style:TextStyle(fontSize: 14.0,
                                       fontWeight: FontWeight.w600)),
                                       subtitle: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           Text(_news[index].description),
                                           Text(_news[index].resource)
                                         ],
                                       ),
                                       trailing: Container(
                                         width:50.0,
                                         height:50.0,
                                         child: Card(
                                           elevation: 5.0,
                                           color: Colors.black,
                                           shape: CircleBorder(),
                                           child:Center(
                                             child: Text(_news[index].score,style: TextStyle(
                                               color: Colors.white
                                             ),),
                                           )
                                         ),
                                       ),
                                     ),
                                   );
                                 }
                                 );
                              }
                          }
                          return Text('');
                        }
                  )
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
Widget _buildCustomColorSizePlaceholder() {
    return Container(
      padding: EdgeInsets.only(top:20.0,bottom:20.0,left:20.0),
      width: double.infinity,      child: PlaceholderLines(
        count: 8,
        align: TextAlign.left,
        lineHeight: 8,
        // color: Colors.blueAccent,
      ),
    );
  }
class News {
  News(
      {this.heading,
      this.description,
      this.article,
      this.imageUrl, this.score,
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
  String score;
}
