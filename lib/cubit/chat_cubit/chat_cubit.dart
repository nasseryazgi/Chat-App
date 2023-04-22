import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubit/chat_cubit/chat_state.dart';

import '../../constants.dart';
import '../../models/message.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(chatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<Message> messagesList = [];

  void sendMessage({required String message,  required String email}) {
    messages.add(
      {
        kMessage: message,
        kCreatedAt: DateTime.now(),
        kId: email.toString(),
      },
    );
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      print(event.docs);
      for (var data in event.docs) {
        messagesList.add(Message.fromJson(data));
      }
      emit(chatSuccess(messagesList: messagesList));
    });
  }
}
