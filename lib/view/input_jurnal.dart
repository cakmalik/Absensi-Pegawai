import 'package:flutter/material.dart';
import 'package:rest_api_flutter/services/presence_services.dart';

class Jurnal extends StatefulWidget {
  const Jurnal({Key? key}) : super(key: key);

  @override
  _JurnalState createState() => _JurnalState();
}

class _JurnalState extends State<Jurnal> {
  PresenceService presenceService = PresenceService();
  final _teacherIdController = TextEditingController();
  final _timeInController = TextEditingController();
  final _timeOutController = TextEditingController();
  final _dateController = TextEditingController();
  final _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.teal[300],
          title: const Text('Home'),
        ),
        backgroundColor: Colors.teal,
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _teacherIdController,
                  decoration: const InputDecoration(hintText: 'id'),
                ),
                TextField(
                  controller: _timeInController,
                  decoration: const InputDecoration(hintText: 'time in'),
                ),
                TextField(
                  controller: _timeOutController,
                  decoration: const InputDecoration(hintText: 'time out'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(hintText: 'date'),
                ),
                TextField(
                  controller: _noteController,
                  decoration: const InputDecoration(hintText: 'note'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    bool response = await presenceService.postData(
                      _teacherIdController.text,
                      _timeInController.text,
                      _timeOutController.text,
                      _dateController.text,
                      _noteController.text,
                    );
                    if (response) {
                      Navigator.popAndPushNamed(context, '/riwayat');
                    } else {
                      print('gagal');
                    }
                  },
                  child: Text('Kirim'),
                )
              ],
            ),
          ),
        ));
  }
}
