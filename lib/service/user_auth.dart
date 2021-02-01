import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> citizenlogin(String email, String password) {
  return http.post(
    'https://crime-registration-system.herokuapp.com/auth/citizen/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
}

Future<http.Response> registercomplaint(
  String dateTime,
  String title,
  String type,
  String token,
  String location,
  String description,
  String pincode,
  String state,
  String district,
  String division,
  String policestation,
) {
  // print(p)
  return http.post(
    'https://crime-registration-system.herokuapp.com/citizen/complaint',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + token,
    },
    body: jsonEncode(<String, String>{
      'timeOfCrime': dateTime,
      'title': title,
      'type': type,
      'location': location,
      'description': description,
      'pincode': pincode,
      'state': state,
      'district': district,
      'division': division,
      'policeStation': policestation,
    }),
  );
}

Future<http.Response> citizenforgotpassword(String email) {
  return http.post(
    'https://crime-registration-system.herokuapp.com/auth/reset-password',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
    }),
  );
}

// Future<http.Response> complaints(String title) {
//   return http.post(
//     'https://jsonplaceholder.typicode.com/albums',
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );
// }
Future<http.Response> complaints(String token) {
  return http.get(
    'https://crime-registration-system.herokuapp.com/citizen/complaints',
    // Send authorization headers to the backend.
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );
}

void deletecomplaint(String id, String token) async {
  await http.delete(
    'https://crime-registration-system.herokuapp.com/citizen/complaint/$id',
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );
}

Future<http.Response> citizenregistration(
  String name,
  String email,
  String mobileno,
  String password,
  String address,
  String pincode,
  String state,
  String district,
  String division,
  String policestation,
) {
  // print(p)
  return http.post(
    'https://crime-registration-system.herokuapp.com/auth/citizen/register',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer ' + token,
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'phone': mobileno,
      'password': password,
      'address': address,
      'pincode': pincode,
      'state': state,
      'district': district,
      'division': division,
      'policeStation': policestation,
    }),
  );
}

Future<http.Response> registerotpverify(String code, String id) {
  return http.post(
    'https://crime-registration-system.herokuapp.com/auth/citizen/verify',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'code': code,
      'id': id,
    }),
  );
}

Future<http.Response> getprofileinfo(String token, String id) {
  print(id);
  return http.get(
    'https://crime-registration-system.herokuapp.com/citizen/profile/$id',
    // Send authorization headers to the backend.
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );
}

Future<http.Response> getcomplaintstatus(String token, String id) {
  print(id);
  return http.get(
    'https://crime-registration-system.herokuapp.com/citizen/complaint/$id/status',
    // Send authorization headers to the backend.
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );
}
