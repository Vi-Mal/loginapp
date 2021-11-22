import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const CustomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 160.0,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30  , 0, 0),
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
                          color: Color.fromRGBO(50, 75, 205, 1),
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
                          color: Color.fromRGBO(50, 75, 205, 1),
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
  Size get preferredSize => const Size.fromHeight(100);
}

