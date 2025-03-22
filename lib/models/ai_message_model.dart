import 'dart:convert';

class AiMessageModel {
  final String role;
  final List<AiPartModel> parts;

  AiMessageModel({
    required this.role,
    required this.parts,
  });

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory AiMessageModel.fromMap(Map<String, dynamic> map) {
    return AiMessageModel(
      role: map['role'] ?? '',
      parts: List<AiPartModel>.from(
        map['parts'] ?? [].map((x) => AiPartModel),
      ),
    );
  }
  String toJson()=>json.encode(toMap());
  factory AiMessageModel.fromJson(String source)=>AiMessageModel.fromMap(json.decode(source));

}

class AiPartModel{
  final String text;
  AiPartModel({
    required this.text
  });
  Map<String,dynamic> toMap(){
    return{
      'text':text
    };
  }

}