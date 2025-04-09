import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

class Freelancer {
  final String id;
  final String cpf;
  final String nome;
  final String email;
  final GeoPoint localizacao;
  final List<DateTimeRange> horariosDisponiveis;

  Freelancer({
    required this.id,
    required this.cpf,
    required this.nome,
    required this.email,
    required this.localizacao,
    required this.horariosDisponiveis,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cpf': cpf,
      'nome': nome,
      'email': email,
      'localizacao': localizacao,
      'horariosDisponiveis': horariosDisponiveis.map((range) => {
        'start': range.start.toUtc(),
        'end': range.end.toUtc(),
      }).toList(),
    };
  }

  factory Freelancer.fromMap(Map<String, dynamic> map) {
    return Freelancer(
      id: map['id'],
      cpf: map['cpf'],
      nome: map['nome'],
      email: map['email'],
      localizacao: map['localizacao'] as GeoPoint,
      horariosDisponiveis: (map['horariosDisponiveis'] as List).map((item) => DateTimeRange(
        start: (item['start'] as Timestamp).toDate().toLocal(),
        end: (item['end'] as Timestamp).toDate().toLocal(),
      )).toList(),
    );
  }
}

