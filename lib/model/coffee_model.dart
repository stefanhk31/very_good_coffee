// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Coffee extends Equatable {
  final String id;
  final String imageUrl;
  const Coffee({
    this.id = '',
    this.imageUrl =
        'https://upload.wikimedia.org/wikipedia/commons/5/59/Coffee_Cup.png',
  });

  Coffee copyWith({
    String? id,
    String? imageUrl,
  }) {
    return Coffee(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': imageUrl,
    };
  }

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      id: const Uuid().v4(),
      imageUrl: map['file'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coffee.fromJson(String source) =>
      Coffee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coffee(id: $id, url: $imageUrl)';

  @override
  List<Object?> get props => [id, imageUrl];
}
