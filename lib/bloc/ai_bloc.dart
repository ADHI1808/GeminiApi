import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:smanagement/models/ai_message_model.dart';
import 'package:smanagement/models/ai_repo.dart';
part 'ai_event.dart';
part 'ai_state.dart';



class AiBloc extends Bloc<AiEvent, AiState> {
  AiBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateMessage>(chatGenerateNewMessage);
    }
    List<AiMessageModel> messages=[];
  bool loading=false;

  FutureOr<void> chatGenerateNewMessage(
  ChatGenerateMessage event,Emitter<AiState> emit) async{
  messages.add(AiMessageModel(role: "user", parts: [AiPartModel(text: event.inputMessage)]));
  emit(ChatSuccessState(messages: messages));
  loading=true;
  String generatedText=  await ChatRepo.aiTextGenerationRepo(messages);
  if(generatedText.length>0){
    messages.add(AiMessageModel(role: 'model', parts:[
      AiPartModel(text: generatedText)
    ]));
    emit(ChatSuccessState(messages: messages));
  }
  loading=false;
  }
}
