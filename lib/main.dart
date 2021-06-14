import 'package:flutter/material.dart';
import 'package:flutter_bottomsheet/bottom_sheet.dart';
import 'package:flutter_bottomsheet/model/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Contact APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> _contacts = [
    Contact(name: "John Doe", phoneNo: 123456789, group: ContactGroup.FAMILY),
    Contact(name: "Jane Doe", phoneNo: 234567891, group: ContactGroup.FAMILY),
    Contact(name: "Dave Smith", phoneNo: 345678912, group: ContactGroup.FRIEND),
    Contact(
        name: "Richard Roe", phoneNo: 456789123, group: ContactGroup.OTHERS),
  ];

  void _contactAdded(Contact contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (_, index) => SingleContact(contact: _contacts[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return BottomSheetScreen(onContactAdd: _contactAdded);
              });
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SingleContact extends StatelessWidget {
  final Contact contact;

  const SingleContact({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          contact.name.substring(0, 1).toUpperCase(),
        ),
      ),
      title: Row(
        children: [
          Text(
            contact.name,
          ),
          SizedBox(width: 10.0),
          Chip(
            padding: EdgeInsets.zero,
            label: Text(
              contact.group.name,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(
        "${contact.phoneNo}",
      ),
    );
  }
}
