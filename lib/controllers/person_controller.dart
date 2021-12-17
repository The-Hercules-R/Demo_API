import 'dart:convert';

import 'package:demo_api/models/person_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/person_model.dart';

class PersonController extends GetxController {
  var personModel = PersonModel().obs;
  var id = 0.obs;
  var isLoading = false.obs;
  Future getPerson() async {
    isLoading.value = true;
    String url = "https://peopleinfoapi.herokuapp.com/api/person/";
    try {
      await http.get(Uri.parse(url)).then(
        (response) {
          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
            personModel.value = PersonModel.fromJson(data);
          }
        },
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future postPerson(String firstName, String lastName, String age) async {
    String url = "https://peopleinfoapi.herokuapp.com/api/person";
    await http.post(
      Uri.parse(url),
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'age': age,
        'active_date': DateTime.now().toString(),
      },
    ).then(
      (response) {
        print(response.statusCode);
        if (response.statusCode == 201) {
          print('The item was created');
        }
      },
    );
  }

  Future deletePerson(int id) async {
    String url = "https://peopleinfoapi.herokuapp.com/api/person/$id";
    await http.delete(Uri.parse(url)).then(
      (response) {
        if (response.statusCode == 200) {
          print('The item is deleted');
        }
      },
    );
  }
}
