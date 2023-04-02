import 'package:flutter/material.dart';
import 'package:flutter_week6_bloc/blocs/bloc_export.dart';

import '../model/get_contact.dart';

class CreateContact extends StatelessWidget {
  CreateContact({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void saveNewContact() {
    final name = nameController.text;
    final phone = phoneController.text;
    final email = emailController.text;
    if (name.isEmpty && phone.isEmpty && email.isEmpty) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          'Create New Contact',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.amber[600],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 36, 22, 22),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill name';
                    }
                    return null;
                  },
                  controller: nameController,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.people),
                    labelText: "Name",
                    hintText: "Input Name",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your phone number';
                    }
                    return null;
                  },
                  controller: phoneController,
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.phone,
                  maxLength: 12,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Phone Number",
                    hintText: "Input Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill email address';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  controller: emailController,
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_sharp),
                    labelText: "Email",
                    hintText: "Input Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveNewContact;
                        var getContact = GetContact(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text);
                        context.read<ContactsBloc>().add(
                              AddContact(getContact: getContact),
                            );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber,
                    ),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
