import 'package:crud_sqflite/add_contacts.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'd_b_helper.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: DBHelper.readContacts(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text('Loading'),
                ],
              ),
            );
          }
          return snapshot.data!.isEmpty
              ? const Center(
                  child: Text('No Contact in List yet'),
                )
              : ListView(
                  children: snapshot.data!.map((contacts) {
                  return Center(
                    child: ListTile(
                        title: Text(contacts.name),
                        subtitle: Text(contacts.contact),
                        trailing: IconButton(
                          onPressed: () async {
                            await DBHelper.deleteContacts(contacts.id!);
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        onTap: () async {
                          final refresh = await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (_) => AddContacts(
                                        contact: Contact(
                                            id: contacts.id,
                                            name: contacts.name,
                                            contact: contacts.contact),
                                      )));
                          if (refresh) {
                            setState(() {});
                          }
                        }),
                  );
                }).toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final refresh = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddContacts()));
          if (refresh) {
            setState(() {});
          }
          setState(() {
            
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
