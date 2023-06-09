part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

class AddContact extends ContactsEvent {
  final GetContact getContact;
  const AddContact({
    required this.getContact,
  });

  @override
  List<Object> get props => [getContact];
}

class UpdateContact extends ContactsEvent {
  final GetContact getContact;
  const UpdateContact({
    required this.getContact,
  });

  @override
  List<Object> get props => [getContact];
}

class DeleteContact extends ContactsEvent {
  final GetContact getContact;
  const DeleteContact({
    required this.getContact,
  });

  @override
  List<Object> get props => [getContact];
}
