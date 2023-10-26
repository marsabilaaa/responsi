import 'dart:convert';

 import 'package:responsi/helpers/api.dart';
 import 'package:responsi/helpers/api_url.dart';
 import 'package:responsi/model/assignments.dart';

 class AssignmentsBloc {
 static Future<List<Assignments>> getAssignmentss() async {
 String apiUrl = ApiUrl.listAssignments;
 var response = await Api().get(apiUrl);
 var jsonObj = json.decode(response.body);
 List<dynamic> listAssignments = (jsonObj as Map<String, dynamic>)['data'];
 List<Assignments> assignmentss = [];
 for (int i = 0; i < listAssignments.length; i++) {
 assignmentss.add(Assignments.fromJson(listAssignments[i]));
 }
 return assignmentss;
 }

 static Future addAssignments({Assignments? assignments}) async {
 String apiUrl = ApiUrl.createAssignments;

 var body = {
 "title": assignments!.kodeAssignments,
 "description": assignments.namaAssignments,
 "deadline": assignments.hargaAssignments.toString()
 };

 var response = await Api().post(apiUrl, body);
 var jsonObj = json.decode(response.body);
 return jsonObj['status'];
 }

 static Future<bool> updateAssignments({required Assignments assignments}) async {
 String apiUrl = ApiUrl.updateAssignments(assignments.id!);

 var body = {
 "title": assignments.kodeAssignments,
 "description": assignments.namaAssignments,
 "deadline": assignments.hargaAssignments.toString()
 };
 print("Body : $body");
 var response = await Api().post(apiUrl, body);
 var jsonObj = json.decode(response.body);
 return jsonObj['data'];
 }

 static Future<bool> deleteAssignments({int? id}) async {
 String apiUrl = ApiUrl.deleteAssignments(id!);

 var response = await Api().delete(apiUrl);
 var jsonObj = json.decode(response.body);
 return (jsonObj as Map<String, dynamic>)['data'];
 }
 }