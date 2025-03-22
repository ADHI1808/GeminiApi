part of 'ai_bloc.dart';

@immutable
sealed class AiState{}
final class AiInitial extends AiState{}

class ChatSuccessState extends AiState{
  final List<AiMessageModel> messages;
  ChatSuccessState({
   required this.messages,
});
}