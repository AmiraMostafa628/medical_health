import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ItemModel extends Equatable {
  final IconData icon;
  final String title;
  final String navigateScreen;

  const ItemModel({
    required this.icon,
    required this.title,
    required this.navigateScreen,
  });

  @override
  List<Object?> get props => [
        icon,
        title,
        navigateScreen,
      ];
}
