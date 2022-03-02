import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/models/presence_model.dart';

import '../main.dart';

class PresenceService {
  Uri url = Uri.parse('http://sister.sditharum.id:2700/api/presences');

  Future getData() async {
    HttpOverrides.global = MyHttpOverrides();
    try {
      final respon = await http.get(url);
      if (respon.statusCode == 200) {
        Iterable it = jsonDecode(respon.body);
        List<Presence> presence = it.map((e) => Presence.fromJson(e)).toList();
        return presence;
      } else {
        throw Exception('Failed to load presence');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String teacherId, String timeIn, String timeOut, String date,
      String note) async {
    HttpOverrides.global = MyHttpOverrides();
    try {
      final body = <String, String>{
        "teacher_id": teacherId,
        "time_in": timeIn,
        "time_out": timeOut,
        "date": date,
        "note": note,
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
