import 'package:flutter/material.dart';

import 'namelist.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.name, required this.realname}) : super(key: key);
  final String name;
  final String realname;

  Color alternateColor(){
    if(Data.list.length==0){
      return Colors.green;
    }
    if(Data.list.length%2 ==0 ){
      return Colors.red;
    }else{
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
  return Container(
      color: alternateColor(),
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Text("heroname: " + name),
                subtitle: Row(
                  children: [
                    Text("realname: " + realname),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
