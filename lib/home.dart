import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smanagement/bloc/ai_bloc.dart';
import 'package:smanagement/models/ai_message_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AiBloc aiBloc = AiBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AiBloc, AiState>(
        bloc: aiBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              final List<AiMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage("assets/aibg.jpg"),
                        fit: BoxFit.cover)),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Personal AI",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                        child: ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              bool isUser = messages[index].role == "user";
                              return Align(
                                alignment: isUser
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 16),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        isUser ? "ME" : "AI",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: isUser
                                              ? Colors.amber
                                              : Colors.blue.shade300,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        messages[index].parts.first.text,
                                        style:
                                        const TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                    if(aiBloc.loading)Lottie.asset('assets/ailoading.json'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fillColor: Colors.white,
                                hintText: "Ask Me Anything...",
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                aiBloc.add(
                                    ChatGenerateMessage(inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: const Center(
                                  child: Icon(Icons.send, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
