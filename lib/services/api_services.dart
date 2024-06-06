import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class ApiServices {
  static Future<List<PostModel>> getApi() async {
    List<PostModel> data = [];

    // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var url = Uri.parse(
        'https://crudcrud.com/api/bf8517a86c22423f95e82ccbba4be93a/tasks');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    // print(responseBody);
    for (var eachMap in responseBody) {
      data.add(PostModel.fromJson(eachMap));
    }
    return data;
  }

  static Future postApi() async {
    var url = Uri.parse(
        'https://crudcrud.com/api/bf8517a86c22423f95e82ccbba4be93a/tasks');

    await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'name': 'Ebad', 'age': '21'}));
  }

  static Future updateApi(String id) async {
    var url = Uri.parse(
        'https://crudcrud.com/api/bf8517a86c22423f95e82ccbba4be93a/tasks/$id');

    await http.put(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'name': 'updated Hashir', 'age': '11'}));
  }

  static Future deleteApi(String id) async {
    var url = Uri.parse(
        'https://crudcrud.com/api/bf8517a86c22423f95e82ccbba4be93a/tasks/$id');

    await http.delete(
      url,
    );
  }
}
