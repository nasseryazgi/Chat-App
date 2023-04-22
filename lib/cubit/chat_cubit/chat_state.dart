import '../../models/message.dart';

abstract class ChatState{}

class chatInitial extends ChatState{}
class chatSuccess extends ChatState{
  List<Message>messagesList =[];
  chatSuccess({required this.messagesList});
}