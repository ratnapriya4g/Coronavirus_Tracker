import 'package:cornavirustracker/datasorce.dart';
import 'package:cornavirustracker/pages/mosteffectedCountriesPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Search extends SearchDelegate {

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = '';
        Navigator.pop(context);
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList
    =
    query.isEmpty ?
    countryList :
    countryList.where((element) =>
        element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        suggestionList[index]['countryInfo']['flag'],
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      suggestionList[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Column(
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
                             + suggestionList[index]['cases'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: (){
                      suggestionList == null
                          ? Container()
                          :
                      print(index);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  MostEffectedCountriesPage(
                            countryData: suggestionList,
                            title:  suggestionList[index]['country'],
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
                                suggestionList[index]['cases'].toString(),
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
                              "" + suggestionList[index]['active'].toString(),
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
                              "" +
                                  suggestionList[index]['recovered'].toString(),
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
                                  suggestionList[index]['deaths'].toString(),
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
                              "" + suggestionList[index]['todayCases'].toString(),
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
                              "" + suggestionList[index]['todayDeaths'].toString(),
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
        });
  }

}