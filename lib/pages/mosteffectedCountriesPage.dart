import 'package:cornavirustracker/panels/mosteffectedcountries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MostEffectedCountriesPage extends StatelessWidget {
  final List countryData;
  final String title;
  final int indexDetails;
  const MostEffectedCountriesPage({Key key, this.countryData, this.title,  this.indexDetails}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text(""+title.toString(),
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              index=indexDetails;
              print(indexDetails);
              print(index);
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            countryData[index]['countryInfo']['flag'],
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Total Cases",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),
                            ),
                            Text(""+
                              countryData[index]['cases'].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                      Card(
                        color: Colors.blue[100],
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                color: Colors.blue[800],),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Active Cases',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "" + countryData[index]['active'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                      Card(
                        color: Colors.green[100],
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                color: Colors.green,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Recovered Cases:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "" + countryData[index]['recovered'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Card(
                        color: Colors.red[100],
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                  color: Colors.red),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'New Cases:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text("" +
                              countryData[index]['cases'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                      Card(
                        color: Colors.grey[300],
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                  color: Colors.grey[900]),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Death Cases:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[900]),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "" +
                                countryData[index]['deaths'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .brightness == Brightness.dark ? Colors
                                    .grey[100] : Colors.grey[900]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Card(
                        color: Colors.red[100],
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                  color: Colors.red),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Serious Critical Cases',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text("" +
                              countryData[index]['critical'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                      Card(
                        color: Colors.orange[100],
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                color: Colors.orange[800],),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Today Cases:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange[800],),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "" + countryData[index]['todayCases'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[800],),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                      Card(
                        color: Colors.deepOrange[100],
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.dotCircle,
                                color: Colors.redAccent[400],),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Today Deaths:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent[400],),
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "" + countryData[index]['todayDeaths'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent[400],),),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              );
            },
            itemCount: 1,
          ),
        ),
      ),
    );
  }
}

