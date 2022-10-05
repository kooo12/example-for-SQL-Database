class Student {
  Map<String, dynamic> insertStudent(
      {required String name,
      required String address,
      required String phone,
      required String email}) {
    return {'name': name, 'address': address, 'phone': phone, 'email': email};
  }
}
