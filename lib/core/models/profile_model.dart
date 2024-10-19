// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  final String name;
  final double weight;
  final double height;
  final int age;
  final String genero;
  final String nivelAtividadeFisica;
  final String objetivo;

  ProfileModel(
      {required this.name,
      required this.weight,
      required this.height,
      required this.age,
      required this.genero,
      required this.nivelAtividadeFisica,
      required this.objetivo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'weight': weight,
      'height': height,
      'age': age,
      'genero': genero,
      'nivelAtividadeFisica': nivelAtividadeFisica,
      'objetivo': objetivo,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      weight: map['weight'] as double,
      height: map['height'] as double,
      age: map['age'] as int,
      genero: map['genero'] as String,
      nivelAtividadeFisica: map['nivelAtividadeFisica'] as String,
      objetivo: map['objetivo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProfileModel.empty() {
    return ProfileModel(
      name: '',
      weight: 0.0,
      height: 0.0,
      age: 0,
      genero: '',
      nivelAtividadeFisica: '',
      objetivo: '',
    );
  }

  ProfileModel copyWith({
    String? name,
    double? weight,
    double? height,
    int? age,
    String? genero,
    String? nivelAtividadeFisica,
    String? objetivo,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      genero: genero ?? this.genero,
      nivelAtividadeFisica: nivelAtividadeFisica ?? this.nivelAtividadeFisica,
      objetivo: objetivo ?? this.objetivo,
    );
  }
}
