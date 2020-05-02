import 'package:cornavirustracker/pages/mosteffectedCountriesPage.dart';
import 'package:cornavirustracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  Future<void> fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: Search(countryData));
          },)
        ],
        title: Text('Country Status'),
      ),
      body: countryData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            //height: 90,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        countryData[index]['countryInfo']['flag'],
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      countryData[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing:
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 8.0,bottom: 8.0,right: 8.0),
                          child: Text(
                            'Total Cases:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Text(""
                            + countryData[index]['cases'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),

                    onTap: () {
                      countryData == null
                          ? Container()
                          :
                      print(index);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  MostEffectedCountriesPage(
                            countryData: countryData,
                            title:  countryData[index]['country'],
                            indexDetails:index,
                          )));
                      print("getdetails");
                      print(index);
                    },
                  ),
                  ExpansionTile(
                    title: Text(
                      "View more details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    children: <Widget>[
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
                                    'CONFIRMED:',
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
                                    'ACTIVE:',
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
                                    'RECOVERED:',
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
                                    'DEATHS:',
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
                  )
                ],
              ),
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}