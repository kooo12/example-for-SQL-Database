import 'package:example/data/database_helper.dart';
import 'package:example/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  late String? name, address, phone, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Form(
          key: _key,
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const Text(
                'Name :',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (str) {
                  if (str == null || str.isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                },
                onSaved: (str) {
                  name = str;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const Text(
                'Address :',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (str) {
                  if (str == null || str.isEmpty) {
                    return 'Please Enter Address';
                  }
                  return null;
                },
                onSaved: (str) {
                  address = str;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Address',
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                ),
              ),
              const Text(
                'Phone :',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (str) {
                  if (str == null || str.isEmpty) {
                    return 'Please Enter Phone';
                  }
                  return null;
                },
                onSaved: (str) {
                  phone = str;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Phone',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const Text(
                'Email :',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (str) {
                  if (str == null || str.isEmpty) {
                    return 'Please Enter Email';
                  }
                  return null;
                },
                onSaved: (str) {
                  email = str;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      int id = await DatabaseHelper().insertStudent(Student()
                          .insertStudent(
                              name: name ?? '',
                              address: address ?? '',
                              phone: phone ?? '',
                              email: email ?? ''));
                              print(id);
                              Navigator.pop(context,'success');
                    }
                  },
                  child: const Text('Save'))
            ],
          )),
    );
  }
}
