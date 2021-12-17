import 'package:demo_api/models/person_model.dart';
import 'package:flutter/material.dart';

class PersonShower extends StatelessWidget {
  Data? data;
  PersonShower({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text('${data!.id}'),
              Image.asset(
                'images/pepe.jpg',
                width: 60,
                height: 60,
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First name: ${data!.firstName}'),
              Text('Last name: ${data!.lastName}'),
              Text('Created at: ${data!.createdAt}'),
              Text('Updated at: ${data!.updatedAt}'),
            ],
          )
        ],
      ),
    );
  }
}
