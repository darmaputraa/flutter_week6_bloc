import 'package:flutter/material.dart';
import '../blocs/bloc_export.dart';
// import '../model/get_contact.dart';
// import '../widget/contact_widget.dart';
import 'create_contact.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          'Contact',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.amber[600],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
              if (state is ContactsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ContactsLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.contactList.length,
                    itemBuilder: (context, index) {
                      var getContact = state.contactList[index];
                      return Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          // dense: true,
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            // radius: 24,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${getContact.name}',
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Phone: ${getContact.phone}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Email: ${getContact.email}',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),

                          /// For delete contact (tap this)
                          onTap: () {
                            context.read<ContactsBloc>().add(
                                  DeleteContact(getContact: getContact),
                                );
                          },
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ContactsErrorState) {
                return const Center(
                  child: Text(
                    'No Contact',
                    style: TextStyle(fontSize: 32),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'No Contact',
                    style: TextStyle(fontSize: 32),
                  ),
                );
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CreateContact(),
            ),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: const Alignment(0.0, 0.0),
              radius: 0.5,
              colors: [
                Colors.green,
                Colors.green.shade600,
              ],
            ),
          ),
          child: const Icon(
            Icons.person_add_alt_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
