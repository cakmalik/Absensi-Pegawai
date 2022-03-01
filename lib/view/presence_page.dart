import 'package:flutter/material.dart';

class PresencePage extends StatefulWidget {
  const PresencePage({Key? key}) : super(key: key);

  @override
  _PresencePageState createState() => _PresencePageState();
}

class _PresencePageState extends State<PresencePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text('Petani'),
      ),
    );
  }
}
