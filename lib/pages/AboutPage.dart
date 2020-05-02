import 'package:cornavirustracker/Animation/FadeAnimation.dart';
import 'package:cornavirustracker/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MainAboutPage extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: FadeAnimation(1.2, Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "About Us",
                                  style: GoogleFonts.specialElite(
                                      textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          )
                      ),
                      ),),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2.0,
                ),
                Text("COVID-19",
                  style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("The 2019–20 coronavirus pandemic is an ongoing pandemic of coronavirus disease 2019 \n(COVID‑19) caused by severe acute respiratory syndrome coronavirus 2 (SARS‑CoV‑2). \nThe outbreak was identified in Wuhan, China, in December 2019. \nThe World Health Organization declared the outbreak a Public Health Emergency of International Concern on 30 January, and a pandemic on 11 March. \nAs of 30 April 2020, more than 3.2 million cases of COVID-19 have been reported in 186 countries and territories,\nresulting in more than 228,000 deaths. More than 985,000 people have recovered.",
                  style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Tools to build this App",
                  style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.grey[50],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Platform\n",
                                style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: "Need App Development Platform like Android Studio,Visual Studio,\nI used Andrid Studio."
                                    "Through REST API, I developed it. REST API details are given below",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kTextLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              child: Card(
                                color: Colors.grey[50],
                                child: ListTile(
                                  title: Text('COVID-19 API'),
                                  subtitle: Text('REST API'),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    _launchURL('https://documenter.getpostman.com/view/8854915/SzS7R74n?version=latest');
                                  },
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                    child: Text(
                      'developed by Ratna Priya',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14,color: Colors.grey[700]),
                    )),
                SizedBox(height: 10,),
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
        ],),
    );
  }
}