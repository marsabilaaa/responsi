class Assignments {
  int? id;
  String? kodeAssignments;
  String? namaAssignments;
  int? hargaAssignments;

  Assignments({this.id, this.kodeAssignments, this.namaAssignments, this.hargaAssignments});

  factory Assignments.fromJson(Map<String, dynamic> obj) {
    return Assignments(
        id: obj['id'],
        kodeAssignments: obj['title'],
        namaAssignments: obj['description'],
        hargaAssignments: obj['deadline']);
  }
}
