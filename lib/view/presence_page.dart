import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/presence_model.dart';
import 'package:rest_api_flutter/services/presence_services.dart';

class PresencePage extends StatefulWidget {
  const PresencePage({Key? key}) : super(key: key);

  @override
  _PresencePageState createState() => _PresencePageState();
}

class _PresencePageState extends State<PresencePage> {
  List<Presence> listAbsen = [];
  PresenceService presenceService = PresenceService();

  getData() async {
    listAbsen = await presenceService.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  // final List<Map<String, String>> listOfColumns = [
  //   {"Name": "AA", "Number": "1", "State": "Yes", "status": "Yes"},
  //   {"Name": "AA", "Number": "2", "State": "no", "status": "Yes"},
  //   {"Name": "AA", "Number": "3", "State": "Yes", "status": "Yes"}
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text('Riwayat Kehadiran'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          DataTable(
            columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
            // dataRowHeight: 80,
            columns: const [
              DataColumn(
                label: Text(
                  'Tgl',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Datang',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Pulang',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  '#',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows:
                listAbsen // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width / 10) *
                                          2,
                                  child: Text(element.date.toString()),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width / 10) *
                                          2,
                                  child: Text(element.timeIn.toString()),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width / 10) *
                                          2,
                                  child: Text(element.timeOut.toString()),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width / 10) *
                                          2,
                                  child: Text(element.note.toString()),
                                ),
                              ),
                            ],
                          )),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
