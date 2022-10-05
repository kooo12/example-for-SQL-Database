import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/database_helper.dart';
import '../model/student.dart';

class EditScreen extends StatefulWidget {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;

  const EditScreen({required this.id, required this.name, required this.address, required this.phone, required this.email});


  @override
  State<EditScreen> createState() => _EditScreenState();
}
class _EditScreenState extends State<EditScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    name = widget.name;
    address = widget.address;
    phone = widget.phone;
    email = widget.email;
  }
  late String? name,address,phone,email;
  late int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Student')),
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
                initialValue: name,
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
                initialValue: address,
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
                initialValue: phone,
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
                initialValue: email,
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
                      int result = await DatabaseHelper().updateStudent(Student()
                          .insertStudent(
                              name: name ?? '',
                              address: address ?? '',
                              phone: phone ?? '',
                              email: email ?? ''),
                              id);
                              print(result);
                              Navigator.pop(context,'success');
                    }
                  },
                  child: const Text('Done'))
            ],
          )),
    );
  }
}