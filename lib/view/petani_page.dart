import 'package:flutter/material.dart';

class PetaniPage extends StatefulWidget {
  const PetaniPage({Key? key}) : super(key: key);

  @override
  _PetaniPageState createState() => _PetaniPageState();
}

class _PetaniPageState extends State<PetaniPage> {
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
