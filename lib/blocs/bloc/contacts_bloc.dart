// import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/get_contact.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(const ContactsState()) {
    on<AddContact>(_onAddContact);
    on<DeleteContact>(_onDeleteContact);
  }

  // Future<void> _onAddContact(
  //     AddContact event, Emitter<ContactsState> emit) async {
  //   emit(OnLoadingContact());

  //   await Future.delayed(const Duration(seconds: 1));
  //   final state = this.state;
  //   emit(ContactsState(
  //       allContacts: List.from(state.allContacts)..add(event.getContact)));
  // }

  void _onAddContact(AddContact event, Emitter<ContactsState> emit) {
    final state = this.state;
    emit(ContactsState(
      allContacts: List.from(state.allContacts)..add(event.getContact),
    ));
  }

  void _onDeleteContact(DeleteContact event, Emitter<ContactsState> emit) {
    final state = this.state;
    emit(ContactsState(
      allContacts: List.from(state.allContacts)..remove(event.getContact),
    ));
  }
}
