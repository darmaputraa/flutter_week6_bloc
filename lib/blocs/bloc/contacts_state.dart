part of 'contacts_bloc.dart';

// class ContactsState extends Equatable {
//   final List<GetContact> allContacts;
//   const ContactsState({
//     this.allContacts = const <GetContact>[],
//   });

//   @override
//   List<Object> get props => [allContacts];
// }

// class ContactsInitial extends ContactsState {}

// class OnLoadingContact extends ContactsState {}

// class OnSuccessAddContact extends ContactsState {}

abstract class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

class ContactsLoadingState extends ContactsState {}

class ContactsLoadedState extends ContactsState {
  final List<GetContact> contactList;

  const ContactsLoadedState({
    this.contactList = const <GetContact>[],
  });

  @override
  List<Object> get props => [contactList];
}

class ContactsErrorState extends ContactsState {}
