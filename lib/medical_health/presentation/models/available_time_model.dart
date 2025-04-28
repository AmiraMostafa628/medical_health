import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AvailableTimeModel extends Equatable {
  final String item;
  final Color itemColor;
  final Color itemBackgroundColor;

  const AvailableTimeModel({
    required this.item,
    required this.itemColor,
    required this.itemBackgroundColor,
  });

  @override
  List<Object?> get props => [
        item,
        itemColor,
        itemBackgroundColor,
      ];
}
