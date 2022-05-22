import 'package:crud_sqflite/contact.dart';
import 'package:crud_sqflite/d_b_helper.dart';
import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key, this.contact}) : super(key: key);
  final Contact? contact;

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  final _nameEC = TextEditingController();
  final _contactEC = TextEditingController();
  @override
  void initState() {
    if (widget.contact != null) {
      _nameEC.text = widget.contact!.name;
      _contactEC.text = widget.contact!.contact;
    }
    super.initState();
  }

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
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(false),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildTextField(_nameEC, 'name'),
            const SizedBox(height: 20),
            _buildTextField(_contactEC, 'contact'),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  if (widget.contact != null) {
                    await DBHelper.updateContacts(Contact(
                        id: widget.contact!.id,
                        name: _nameEC.text,
                        contact: _contactEC.text));
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop(true);
                  } else {
                    await DBHelper.createContacts(
                      Contact(name: _nameEC.text, contact: _contactEC.text),
                    );
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop(true);
                  }

                },
                child: const Text('Add Contact List'))
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
