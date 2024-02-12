import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvvm_flutter/features/detail_user/controller/user_controller.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: Text('Person List')),
        body: ListView.builder(
          itemCount: controller.persons.length,
          itemBuilder: (context, index) {
            final person = controller.persons[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text('Age: ${person.age}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => controller.removePerson(person),
              ),
              onTap: () => controller.showEditDialog(context, person),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => controller.showAddDialog(context),
        ),
      ),
    );
  }

}
