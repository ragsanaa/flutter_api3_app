import 'package:flutter/material.dart';
import 'package:flutter_api3/models/users.dart';
import 'package:flutter_api3/services/get_users_services.dart';

class UserScreen extends StatelessWidget {
  final int id;
  const UserScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: UserService().getUserById(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('We have an error!'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            User user = snapshot.data!;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(user.image!),
                  ),
                ),
                const Text(
                  'Personal Info',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Age:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(user.age.toString(),
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Full Name:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Expanded(
                      child: Text('${user.firstName!} ${user.lastName!}',
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Email:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Expanded(
                      child: Text(user.email!,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text(
                          'Male',
                          style: TextStyle(fontSize: 24),
                        ),
                        value: 'male',
                        groupValue: user.gender!,
                        onChanged: (value) {},
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text(
                          'Female',
                          style: TextStyle(fontSize: 24),
                        ),
                        value: 'female',
                        groupValue: user.gender!,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Address Info',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Address:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Expanded(
                      child: Text(
                        user.address!.address!,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'City:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(user.address!.city!,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'State:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(user.address!.state!,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Postal Code:  ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(user.address!.postalCode!,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
