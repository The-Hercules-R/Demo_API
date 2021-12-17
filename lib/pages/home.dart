import 'package:demo_api/controllers/person_controller.dart';
import 'package:demo_api/pages/post_page.dart';
import 'package:demo_api/widgets/person_shower.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final personController = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    personController.getPerson();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => const PostPage());
            },
          ),
          title: const Text(
            'Demo API',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.minimize),
              onPressed: () {
                personController.deletePerson(personController.id.value);
              },
            ),
          ],
        ),
        body: personController.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: ListView.builder(
                  itemCount: personController.personModel.value.data!.length,
                  itemBuilder: (BuildContext context, int i) => GestureDetector(
                    onTap: () {
                      personController.id.value =
                          personController.personModel.value.data![i].id!;
                    },
                    child: PersonShower(
                      data: personController.personModel.value.data![i],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
