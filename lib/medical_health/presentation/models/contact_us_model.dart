import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContactUsModel extends Equatable {
  final IconData icon;
  final String title;

  const ContactUsModel({
    required this.icon,
    required this.title,
  });

  @override
  List<Object?> get props => [
        icon,
        title,
      ];
}
