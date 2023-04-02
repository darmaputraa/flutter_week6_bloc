// import 'package:flutter/material.dart';

// import '../blocs/bloc_export.dart';
// import '../model/get_contact.dart';

// class ContactDetail extends StatelessWidget {
//   const ContactDetail({super.key, required this.contactList});

//   final List<GetContact> contactList;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ContactsBloc, ContactsState>(
//       builder: (context, state) {
//         List<GetContact> contactList = state.allContact;
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: Padding(
//             padding: const EdgeInsets.only(top: 100, left: 18, right: 18),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Icon(
//                     Icons.person,
//                     size: 100,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: contactList.length,
//                   itemBuilder: (context, index) {
//                     var getContact = contactList[index];
//                     return ListTile(
//                       title: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Name: ${getContact.name}',
//                             style: const TextStyle(
//                                 fontSize: 26, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ))
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
