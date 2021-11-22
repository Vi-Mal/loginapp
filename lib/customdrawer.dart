import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class CustomDrawer extends StatelessWidget {
  final name = "username";
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const CustomDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.lightBlueAccent,
        child: ListView(
          children: <Widget>[
            buildHeader(
              image: Image.asset('Assets/img.jpg'),
              name: name,
              onClicked: (){},
            ),
            Container(
              padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'People',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Favourites',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 420, 0, 0),
                    child: Column(
                      children: [
                        Divider(color: Colors.white),
                        buildMenuItem(
                          text: 'Logout',
                          icon: Icons.logout,
                          onClicked: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => LoginScreen()));
                          },
                        ),
                      ],
                    )
                  ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required Image image,
    required String name,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          color: Colors.lightBlue,
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: AssetImage('Assets/img.png')),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
  }
}