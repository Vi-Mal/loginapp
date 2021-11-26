import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const CustomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xff0ED2F7),
                        ),
                        onPressed:(){
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      const Expanded(
                        child:Text(
                          'FuturaInsTech',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Color(0xff0ED2F7),
                        ),
                        onPressed: () {
                          print("your menu action here");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

