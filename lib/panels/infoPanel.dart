import 'package:cornavirustracker/datasorce.dart';
import 'package:cornavirustracker/pages/faqs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:150,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FAQPage()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Icon(
                      Icons.help_outline,
                      color: Colors.black,
                      size: 45,
                    ),
                    Text(
                      'FAQS',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://covid19responsefund.org/');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.donate,
                      color: Colors.black,
                      size: 45,
                    ),
                    Text(
                      'DONATE',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch(
                    'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/who_logo.png",
                    ),
                    Text(
                      'WHO',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
