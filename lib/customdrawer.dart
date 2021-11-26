import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/namelist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'empapidata.dart';
import 'loginscreen.dart';

class CustomDrawer extends StatelessWidget {
  final name = "username";
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  const CustomDrawer( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xff0ED2F7),
        child: ListView(
          children: <Widget>[
            buildHeader(
              image: Image.asset('Assets/img.jpg'),
              name: name,
              onClicked: (){},
            ),
            Container(
              padding: padding.add(const EdgeInsets.symmetric(vertical: 20)),
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'employees',
                    icon: Icons.people,
                    onClicked: () {
                        selectedItem(context, 0);
                          Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>  empApiData(),
                          ),
                        );
                    },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Favourites',
                    icon: Icons.favorite_border,
                    onClicked: () {
                      selectedItem(context, 1);
                      Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  AddToList(),
                      ),
                      );
                    }
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 420, 0, 0),
                    child: Column(
                      children: [
                        const Divider(color: Colors.white),
                        buildMenuItem(
                          text: 'Logout',
                          icon: Icons.logout,
                          onClicked: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.clear();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => const LoginPage()));
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
          color: const Color(0xffB2FEFA),
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              const CircleAvatar(radius: 30, backgroundImage: AssetImage('Assets/img.png')),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
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
    const color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
  }
}