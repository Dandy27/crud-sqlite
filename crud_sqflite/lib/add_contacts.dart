import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  final _nameEC = TextEditingController();
  final _contactEC = TextEditingController();
  @override
  void dispose() {
    _nameEC.dispose();
    _contactEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contacts'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            _buildTextField(_nameEC, 'name'),
            const SizedBox(height: 20),
            _buildTextField(_contactEC, 'contact'),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text('Add Contact'))
          ]),
        ),
      ),
    );
  }
}

TextField _buildTextField(TextEditingController _controller, String hint) {
  return TextField(
    controller: _controller,
    decoration: InputDecoration(
        labelText: hint, hintText: hint, border: const OutlineInputBorder()),
  );
}
