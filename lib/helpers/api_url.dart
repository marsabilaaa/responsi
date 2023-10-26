 class ApiUrl {
 static const String baseUrl = 'https://responsi1b.dalhaqq.xyz/api';

 static const String registrasi = baseUrl + '/registrasi';
 static const String login = baseUrl + '/login';
 static const String listAssignments = baseUrl + '/assignments';
 static const String createAssignments = baseUrl + '/assignments';

 static String updateAssignments(int id) {
 return baseUrl + '/assignments/' + id.toString() + '/update';
 }

 static String showAssignments(int id) {
 return baseUrl + '/assignments/' + id.toString();
 }

 static String deleteAssignments(int id) {
 return baseUrl + '/assignments/' + id.toString();
 }
 }
