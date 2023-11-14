import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nov6/user_model.dart';

registerUser({required String name, required String email}) async {
  String api = "https://mhuzaifakhan.pythonanywhere.com/register";
  var url = Uri.parse(api);
  final response = await http.post(url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode({"name": name, "email": email}));
  print(response.body);
}

Future<List<UserModel>> getUsers() async {
  String api = "https://mhuzaifakhan.pythonanywhere.com/users";
  var url = Uri.parse(api);
  final response = await http.get(url);
  var body = jsonDecode(response.body);
  List<UserModel> users = [];
  for (var json in body["data"]) {
    users.add(UserModel.fromJson(json));
  }
  return users;
}

deleteUser({required String id}) async {
  String api = "https://mhuzaifakhan.pythonanywhere.com/delete-user/$id";
  var url = Uri.parse(api);
  final response = await http.delete(url);
  print(response.body);
}

Future<UserModel> getSingleUser({required String userId}) async {
  String api = "https://mhuzaifakhan.pythonanywhere.com/users/$userId";
  var url = Uri.parse(api);
  final response = await http.get(url);
  final body = jsonDecode(response.body);
  return UserModel.fromJson(body["data"]);
}

updateUser({
  required String id,
  required String name,
  required String email,
}) async {
   String api = "https://mhuzaifakhan.pythonanywhere.com/update-user/$id";
  var url = Uri.parse(api);
  final response = await http.put(url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode({"name": name, "email": email}));
  print(response.body);
}
