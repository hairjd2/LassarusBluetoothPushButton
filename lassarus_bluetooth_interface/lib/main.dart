import "dart:async";
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // sendData();
  // FirebaseDatabase database = FirebaseDatabase.instance;
  runApp(const MyApp());
}

// final firstName = SharedPreferences.getInstance();
// final lastName = SharedPreferences.getInstance();
String firstName = " ";
String lastName = " ";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Lassarus Bluetooth Interface';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lassarus Bluetooth Interface'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[index],
            child: Center(child: Text("Entry $entries[index]")),
          );
        });
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = <Widget>[
      TextFormField(
        controller: firstNameController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'First Name',
        ),
      ),
      TextFormField(
        controller: lastNameController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Last Name',
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          firstName = firstNameController.text;
          lastName = lastNameController.text;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(firstNameController.text),
                );
              });
        },
        child: const Text('Save'),
      )
    ];
    return Scaffold(
        body: Center(
      child: ListView.separated(
        padding: const EdgeInsets.all(25),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: widgets[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    ));
  }
}

Future<void> sendData() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("IncomingData");

  await ref.set({
    "data1": {
      "name": "John",
      "age": 18,
      // "address": {"line1": "100 Mountain View"}
    }
  });
}
