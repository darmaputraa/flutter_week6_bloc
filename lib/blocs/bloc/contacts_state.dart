part of 'contacts_bloc.dart';

class ContactsState extends Equatable {
  final List<GetContact> allContacts;
  const ContactsState({
    this.allContacts = const <GetContact>[],
  });

  @override
  List<Object> get props => [allContacts];
}

class ContactsInitial extends ContactsState {}

class OnLoadingContact extends ContactsState {}

class OnSuccessAddContact extends ContactsState {}
