import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class ChatNumIcon extends StatelessWidget {
  const ChatNumIcon({
    super.key,
    required this.chatNum,
    this.color,
  });

  final num chatNum;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color ?? ColorManager.whiteColor,
      ),
      child: Row(
        spacing: 5,
        children: [
          Transform(
              transform: Matrix4.rotationY(3.141592653589793),
              alignment: Alignment.center,
              child: Icon(
                MdiIcons.chatProcessingOutline,
                color: ColorManager.primaryColor,
                size: 20,
              )),
          Text(
            chatNum.toString(),
            style: TextStyle(color: ColorManager.primaryColor),
          )
        ],
      ),
    );
  }
}
