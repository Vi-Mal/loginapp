import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmpInfo extends StatelessWidget {
  static const routeName = '/empinfo';

  @override
  Widget build(BuildContext context) {
    final Map heroinfo = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff0ED2F7),
        title:  Text(heroinfo['name']),
      ),
      body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color(0xff0ED2F7),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(backgroundImage: NetworkImage(heroinfo['imageurl']),radius: 60,),
                          Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    heroinfo['realname'],
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                  Text("Since: "+heroinfo['firstappearance']),
                            ],
                              ),
                          ),
                        ],
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Team: "+heroinfo['team'],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text("Creator: "+heroinfo['createdby'],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),                Padding(
                  padding: EdgeInsets.fromLTRB(10,0,10,10),
                  child: Container(
                    height: 100,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Publisher: "+heroinfo['publisher'],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        "Bio:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(heroinfo['bio'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black45,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.justify,

                      ),
                    ],
                  ),
                ),
            ],
            ),
      ),
    );
  }
}
