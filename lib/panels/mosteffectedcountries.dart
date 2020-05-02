import 'package:cornavirustracker/pages/mosteffectedCountriesPage.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  String title;

  MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  fit: BoxFit.cover,
                ),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),
                ),
                Text(
                  'Deaths: ' + countryData[index]['deaths'].toString(),
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 17),
                ),
                RaisedButton(
                  splashColor:Colors.yellow,
                  onPressed: (){
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
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 48.0,right: 48.0),
                    child: Text("Get More Details", style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
