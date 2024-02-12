
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter/core/model/user_model.dart';

class UserViewModel extends GetxController{

  final List<User> _persons = [];

  List<User> get persons => _persons;

  void addPerson(User person) {
    _persons.add(person);
    update();
  }

  void removePerson(User person) {
    _persons.remove(person);
    update();
  }

  void updatePerson(User oldPerson, User newPerson) {
    final index = _persons.indexOf(oldPerson);
    _persons[index] = newPerson;
    update();
  }



  void showAddDialog(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              final name = nameController.text;
              final age = int.parse(ageController.text);
              final person = User(name: name, age: age);
              addPerson(person);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void showEditDialog(BuildContext context, User person) {
    final nameController = TextEditingController(text: person.name);
    final ageController = TextEditingController(text: person.age.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              final name = nameController.text;
              final age = int.parse(ageController.text);
              final oldPerson = person;
              final newPerson = User(name: name, age: age);
              updatePerson(oldPerson, newPerson);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}