import 'package:flutter/material.dart';
import 'package:flutter_api3/models/users.dart';
import 'package:flutter_api3/screens/user.dart';
import 'package:flutter_api3/services/get_users_services.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService().getAllData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        Users data = snapshot.data;
        return ListView.builder(
          itemCount: data.total,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserScreen(id: data.users![index].id!)));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data.users![index].image!),
                ),
                title: Text(
                    '${data.users![index].firstName} ${data.users![index].lastName}'),
                subtitle: Text(data.users![index].age.toString()),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            );
          },
        );
      },
    );
  }
}
