class Presence {
  final int? id;
  final int? teacherId;
  final String? timeIn;
  final String? timeOut;
  final String? late;
  final String? overtime;
  final String? note;
  final String? date;

  const Presence({
    required this.id,
    required this.teacherId,
    required this.timeIn,
    required this.timeOut,
    required this.late,
    required this.overtime,
    required this.note,
    required this.date,
  });

  factory Presence.fromJson(Map<String, dynamic> json) {
    return Presence(
        id: json['id'],
        teacherId: json['teacher_id'],
        timeIn: json['time_in'],
        timeOut: json['time_out'],
        late: json['late'],
        overtime: json['overtime'],
        note: json['note'],
        date: json['date']);
  }
}
