import 'package:flutter/material.dart';
import 'package:responsi/model/assignments.dart';
import 'package:responsi/ui/assignments_form.dart';

class AssignmentsDetail extends StatefulWidget {
  final Assignments? assignments;

  AssignmentsDetail({Key? key, this.assignments}) : super(key: key);

  @override
  _AssignmentsDetailState createState() => _AssignmentsDetailState();
}

class _AssignmentsDetailState extends State<AssignmentsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Assignments Marsa'), // Hapus const pada Text
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.assignments!.kodeAssignments}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.assignments!.namaAssignments}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.assignments!.hargaAssignments.toString()}",
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AssignmentsForm(assignments: widget.assignments!),
              ),
            );
          },
        ),
        OutlinedButton(
          child: Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

 void confirmHapus() {
  AlertDialog alertDialog = AlertDialog(
 content: const Text("Yakin ingin menghapus data ini?"),
 actions: [
 //tombol hapus
 OutlinedButton(
 child: const Text("Ya"),
 onPressed: () {
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => AssignmentsForm(
 assignments: widget.assignments!,
 )));
 },
 ),
 //tombol batal
 OutlinedButton(
 child: const Text("Batal"),
 onPressed: () => Navigator.pop(context),
 )
 ],
 );

 showDialog(builder: (context) => alertDialog, context: context);
 }
}
