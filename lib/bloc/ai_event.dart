part of 'ai_bloc.dart';

@immutable
sealed class AiEvent{}

class ChatGenerateMessage extends AiEvent{
  final String inputMessage;
  ChatGenerateMessage({
    required this.inputMessage
});
}