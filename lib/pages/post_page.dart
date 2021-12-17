import 'package:demo_api/controllers/person_controller.dart';
import 'package:demo_api/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _personController = Get.put(PersonController());
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'Input first name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'Input last name',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                hintText: 'Input age',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _personController.postPerson(
                  _firstNameController.text,
                  _lastNameController.text,
                  _ageController.text,
                );
                Get.back();
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
