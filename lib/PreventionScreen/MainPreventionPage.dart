import 'package:cornavirustracker/Animation/FadeAnimation.dart';
import 'package:cornavirustracker/constant.dart';
import 'package:cornavirustracker/panels/infoPanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PreventionPage extends StatefulWidget {

  @override
  _PreventionPageState createState() => _PreventionPageState();
}

class _PreventionPageState extends State<PreventionPage> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: FadeAnimation(1.2, Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Get To Know\nAbout COVID-19",
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
                          child: Image.asset('assets/images/doctor.png',
                            fit: BoxFit.cover,
                          ),
                        ))),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Symptoms",
                    style:
                         TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(1, 1, 1, 1)
                        ),
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SymptomCard(
                          image: "assets/images/symptoms/headache.png",
                          title: "Headache",
                          isActive: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SymptomCard(
                          image: "assets/images/symptoms/cold.png",
                          title: "Caugh",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SymptomCard(
                          image: "assets/images/symptoms/caugh.png",
                          title: "Caugh",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SymptomCard(
                          image: "assets/images/symptoms/fever.png",
                          title: "Fever",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Prevention", style:
                      TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(1, 1, 1, 1)
                  ),
                  ),
                ),
                SizedBox(height: 10),
                PreventCard(
                  text:
                  "Since the start of the coronavirus \noutbreak some places have fully \nembraced wearing facemasks",
                  image: "assets/images/symptoms/wear_mask.png",
                  title: "Wear face mask",
                ),
                PreventCard(
                  text:
                  "Since the start of the coronavirus \noutbreak some places have fully \nembraced wearing facemasks",
                  image: "assets/images/symptoms/wash_hands.png",
                  title: "Wash your hands",
                ),
                PreventCard(
                  text:
                  "Social distancing puts space between people.\nWhen people who are \ninfected with the virus stay away from others,\nthey can't pass it to anyone else.",
                  image: "assets/images/symptoms/socialDistancing.png",
                  title: "Social Distancing",
                ),
                PreventCard(
                  text:
                  "Being at home, in such uncertain times, we are trying \ntheir best to control \nthe spread of coronavirus.",
                  image: "assets/images/symptoms/stay-at-home.png",
                  title: "Stay At Home",
                ),
                Center(
                    child: Text(
                      'WE ARE TOGETHER IN THE FIGHT',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                SizedBox(height: 30),
                InfoPanel(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                        'developed by Ratna Priya',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14,color: Colors.grey[700]),
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
      ),);
  }
}
class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 169,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 169,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/icons/forward.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}