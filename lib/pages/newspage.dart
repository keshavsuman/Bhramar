import 'package:flutter/material.dart';
import 'search.dart';

class Newspage extends StatefulWidget {
  String heading;
  String description;
  String newsUrl;
  String imageUrl;
  String article;
  String publicationDate;
  String resource;
  Newspage(this.heading,this.description,this.newsUrl,this.imageUrl,this.article,this.publicationDate,this.resource);
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
 
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 15.0, right: 20.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                   Container(
                     width:60.0,
                     child: Image.asset('images/Bhramarlogo3.png'),
                   ),
                   Container(
                     width:30,
                   )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  ClipRRect(
                            borderRadius: BorderRadius.vertical(top:Radius.circular(40.0)),
                            child:
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 87,
                    // height:double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.0)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Image.network(widget.imageUrl),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.heading,
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w600
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(widget.publicationDate,
                                style:TextStyle(
                                  color:Colors.grey
                                )),
                                Text(widget.resource,
                                style:TextStyle(
                                  color:Colors.grey
                                )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.article),
                          )
                        ],
                      ),
                    ),
                  ),),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()));
          },
        child:Icon(Icons.search)),
      ),
    );
  }
}

// class News {
//   News(
//       {this.heading,
//       this.description,
//       this.article,
//       this.imageUrl,
//       this.newsUrl,
//       this.publicationDate,
//       this.resource});
//   String heading;
//   String description;
//   String article;
//   String imageUrl;
//   String newsUrl;
//   String publicationDate;
//   String resource;
// }
