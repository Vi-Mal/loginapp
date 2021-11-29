import 'package:flutter/material.dart';
import 'customcardlist.dart';

class AddToList extends StatefulWidget {
  const AddToList({Key? key}) : super(key: key);

  @override
  State<AddToList> createState() => _AddToListState();
}

class Data{
  static final List<Widget> list = [];
}

class _AddToListState extends State<AddToList> {
  var namectr = TextEditingController();
  var idctr = TextEditingController();

  void  addemp(name, id) {
    setState(() {
      Data.list.add(CustomCard(name: name,realname: id,listlen: Data.list.length,));
    });
  }

  Future<void> _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter detials'),
          content: Column(
            children: [
              TextField(controller: namectr,
                decoration: InputDecoration(hintText: "name"),),
              TextField(controller: idctr,
                decoration: InputDecoration(hintText: "id"),),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('AddtoList'),
              onPressed: () {
                addemp(namectr.text, idctr.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('employees'),
        centerTitle: true,
        backgroundColor: const Color(0xff0ED2F7),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: Data.list,
          ),
        ),
      ),
      floatingActionButton: Align(
          child: FloatingActionButton(
            backgroundColor: const Color(0xff403B4A),
            child: const Icon(
              Icons.add,
            ),
            elevation: 10,
            onPressed: _showMyDialog,
          ),
          alignment: const Alignment(1, 1)),
    );
  }
}

