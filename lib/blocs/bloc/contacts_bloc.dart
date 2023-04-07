// import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../contact_repository.dart';
import '../../model/get_contact.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsLoadingState()) {
    on<LoadContacts>(_onLoadContacts);
    on<AddContact>(_onAddContact);
    on<DeleteContact>(_onDeleteContact);
    // on<UpdateContact>(_onUpdateContact);
  }

  // Future<void> _onLoadContacts(
  //     LoadContacts event, Emitter<ContactsState> emit) async {
  //   emit(ContactsLoadingState());

  //   await Future.delayed(const Duration(seconds: 2));
  //   emit(const ContactsLoadedState());

  //   emit(ContactsErrorState());
  // }

  // _onLoadContacts(LoadContacts event, Emitter<ContactsState> emit) {
  //   emit(ContactsLoadedState(contactList: event.contactList));
  // }

  void _onLoadContacts(
    LoadContacts event,
    Emitter<ContactsState> emit,
  ) async {
    emit(ContactsLoadingState());
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(const ContactsLoadedState());
    } catch (_) {
      emit(ContactsErrorState());
    }
  }

  _onAddContact(
    AddContact event,
    Emitter<ContactsState> emit,
  ) {
    final state = this.state;
    if (state is ContactsLoadedState) {
      emit(
        ContactsLoadedState(
          contactList: List.from(state.contactList)..add(event.getContact),
        ),
      );
    }
  }

  _onDeleteContact(
    DeleteContact event,
    Emitter<ContactsState> emit,
  ) {
    final state = this.state;
    if (state is ContactsLoadedState) {
      emit(
        ContactsLoadedState(
          contactList: List.from(state.contactList)..remove(event.getContact),
        ),
      );
    }
  }
}
