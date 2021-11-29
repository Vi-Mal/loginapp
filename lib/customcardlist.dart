import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.name, required this.realname, required this.listlen}) : super(key: key);
  final String name;
  final String realname;
  final int listlen;

  Color alternateColor(){
    if(listlen==0){
      return Colors.red;
    }
    if(listlen%2 ==0 ){
      return Colors.red;
    }else{
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
  return InkWell(
    onTap: (){
      Fluttertoast.showToast(
        msg: "selected",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    },
    child: Container(
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
        ),
  );
  }
}
