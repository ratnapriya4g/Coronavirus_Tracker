import 'package:cornavirustracker/Animation/FadeAnimation.dart';
import 'package:cornavirustracker/PreventionScreen/MainPreventionPage.dart';
import 'package:cornavirustracker/constant.dart';
import 'package:cornavirustracker/datasorce.dart';
import 'package:cornavirustracker/pages/AboutPage.dart';
import 'package:cornavirustracker/pages/countyPage.dart';
import 'package:cornavirustracker/panels/mosteffectedcountries.dart';
import 'package:cornavirustracker/panels/worldwidepanel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(home: MainHomePage(),));

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

GlobalKey _bottomNavigationKey = GlobalKey();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  Future fetchData() async{
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }


  int _page = 0;

  Widget BottomHomeWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 14.0, right: 10.0, top: 18.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0)
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: FadeAnimation(1.2, Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Welcome To\nCOVID-19\nTracker',
                            style: GoogleFonts.specialElite(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(1, 1, 1, 1)
                                )),
                          )
                      ),
                      ),),
                    Expanded(
                        flex: 3,
                        child: FadeAnimation(1.3, Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/corna.png'),
                        ))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Worldwide Case Update\n",
                              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                            ),
                            TextSpan(
                              text: "Newest update April 30th 2020",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // code to pass to country details page

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CountryPage()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Regional',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),

                // code for world record details

                worldData == null
                    ? CircularProgressIndicator()
                    : WorldwidePanel(
                  worldData: worldData,
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child:RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Most affected Countries\n",
                          style:  TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        TextSpan(
                          text: "Top 10 Countries in the WorldWide",
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),

                //code for top 10 countries records

                countryData == null
                    ? Container()
                    : MostAffectedPanel(
                  countryData: countryData,
                ),
                SizedBox(height: 20),
                Text(
                  "Spread of Virus",
                  style: kTitleTextstyle,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                      child: Text(
                        'developed by Ratna Priya',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14,color:Colors.grey[700]),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL('https://github.com/ratnapriya4g');
                  },
                  child: Center(
                    child: Text(
                      'github link',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tab = <Widget>[
      BottomHomeWidget(),
      PreventionPage(),
      MainAboutPage(),
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          shape: BoxShape.rectangle,
        ),
        child: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.black,),
            Icon(Icons.security, size: 30, color: Colors.black,),
            Icon(Icons.category, size: 30, color: Colors.black,),
          ],
          backgroundColor: Colors.lightBlueAccent,
          color: Colors.white,
          animationCurve: Curves.easeInOutCubic,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 28),
            child: Column(
              children: <Widget>[
                tab[_page],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

