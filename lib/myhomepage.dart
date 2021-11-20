import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        title: const Text("FuturaInsTech"),
        actions: const [
          // round icon
          // delete
        ],
        backgroundColor: Color(0xff403B4A),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xff403B4A),
                    backgroundImage: ImageProvider(),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(11, 33, 33, 22),
              ),
            ),
            const ListTile(
              title: Text('Naruto'),
              onTap: null,
            ),
            const ListTile(
              title: Text('Minato'),
              onTap: null,
            ),
            const ListTile(
              title: Text('Kushina'),
              onTap: null,
            ),
            const ListTile(
              title: Text('Jira'),
              onTap: null,
            ),
          ],
        ),
      ),
      body: FooterView(
        children: const [],
        footer: Footer(
          backgroundColor: const Color(0xff607d8bbe),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Column(
                children: const [
                  Text("© Sujarajan Consultancy Private Limited "),
                  Text("CIN-U72900TN2019PTC130512"),
                ],
              ),
            ),
          ),
        ),
        flex: 1,
      ),
      floatingActionButton: const Align(
          child: FloatingActionButton(
            backgroundColor: Color(0xff403B4A),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            elevation: 10,
            onPressed: null,
          ),
          alignment: Alignment(1, .9)),
    );
  }
}
