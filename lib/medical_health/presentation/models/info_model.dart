import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final String title;
  final String titleInfo;

  const InfoModel({
    required this.title,
    required this.titleInfo,
  });

  @override
  List<Object?> get props => [
        title,
        titleInfo,
      ];
}
