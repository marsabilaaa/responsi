import 'package:flutter/material.dart';
import 'package:responsi/bloc/assignments_bloc.dart';
import 'package:responsi/model/assignments.dart';
import 'package:responsi/ui/assignments_page.dart';
import 'package:responsi/widget/warning_dialog.dart';

class AssignmentsForm extends StatefulWidget {
  Assignments? assignments;

  AssignmentsForm({Key? key, this.assignments}) : super(key: key);
  @override
  _AssignmentsFormState createState() => _AssignmentsFormState();
}

class _AssignmentsFormState extends State<AssignmentsForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH Assignments";
  String tombolSubmit = "SIMPAN";

  final _kodeAssignmentsTextboxController = TextEditingController();
  final _namaAssignmentsTextboxController = TextEditingController();
  final _hargaAssignmentsTextboxController = TextEditingController();
  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.assignments != null) {
      setState(() {
        judul = "UBAH Assignments";
        tombolSubmit = "UBAH";
        _kodeAssignmentsTextboxController.text = widget.assignments!.kodeAssignments!;
        _namaAssignmentsTextboxController.text = widget.assignments!.namaAssignments!;
        _hargaAssignmentsTextboxController.text =
            widget.assignments!.hargaAssignments.toString();
      });
    } else {
      judul = "TAMBAH Assignments";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeAssignmentsTextField(),
                _namaAssignmentsTextField(),
                _hargaAssignmentsTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

//Membuat Textbox Kode Assignments
  Widget _kodeAssignmentsTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Assignments"),
      keyboardType: TextInputType.text,
      controller: _kodeAssignmentsTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Assignments harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Nama Assignments
  Widget _namaAssignmentsTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Assignments"),
      keyboardType: TextInputType.text,
      controller: _namaAssignmentsTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Assignments harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Harga Assignments
  Widget _hargaAssignmentsTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaAssignmentsTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Tombol Simpan/Ubah

 Widget _buttonSubmit() {
 return OutlinedButton(
 child: Text(tombolSubmit),
 onPressed: () {
 var validate = _formKey.currentState!.validate();
 if (validate) {
 if (!_isLoading) {
 if (widget.assignments != null) {
    //kondisi update assignments
    ubah();
    } else {
    //kondisi tambah assignments
    simpan();
        }
      }
    }
  });
 }

 simpan() {
 setState(() {
 _isLoading = true;
 });
 Assignments createAssignments = Assignments(id: null);
 createAssignments.kodeAssignments = _kodeAssignmentsTextboxController.text;
 createAssignments.namaAssignments = _namaAssignmentsTextboxController.text;
 createAssignments.hargaAssignments =
int.parse(_hargaAssignmentsTextboxController.text);
 AssignmentsBloc.addAssignments(assignments: createAssignments).then((value) {
 Navigator.of(context).push(MaterialPageRoute(
 builder: (BuildContext context) => const AssignmentsPage()));
 }, onError: (error) {
 showDialog(
 context: context,
 builder: (BuildContext context) => const WarningDialog(
 description: "Simpan gagal, silahkan coba lagi",
 ));
 });
 setState(() {
 _isLoading = false;
 });
 }
ubah() {
 setState(() {
 _isLoading = true;
 });
 Assignments updateAssignments = Assignments(id: null);
 updateAssignments.id = widget.assignments!.id;
 updateAssignments.kodeAssignments = _kodeAssignmentsTextboxController.text;
 updateAssignments.namaAssignments = _namaAssignmentsTextboxController.text;
 updateAssignments.hargaAssignments =
int.parse(_hargaAssignmentsTextboxController.text);
 AssignmentsBloc.updateAssignments(assignments: updateAssignments).then((value) {
 Navigator.of(context).push(MaterialPageRoute(
 builder: (BuildContext context) => const AssignmentsPage()));
 }, onError: (error) {
 showDialog(
 context: context,
 builder: (BuildContext context) => const WarningDialog(
 description: "Permintaan ubah data gagal, silahkan coba lagi",
 ));
 });
 setState(() {
 _isLoading = false;
 });
 }

}
