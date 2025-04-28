import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/models/contact_us_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class ContactUsSection extends StatelessWidget {
  ContactUsSection({super.key});

  final List<ContactUsModel> contactUsModel = [
    ContactUsModel(
      icon: Icons.headset_mic_outlined,
      title: 'Customer service',
    ),
    ContactUsModel(
      icon: FontAwesomeIcons.globe,
      title: 'Website',
    ),
    ContactUsModel(
      icon: FontAwesomeIcons.whatsapp,
      title: 'Whatsapp',
    ),
    ContactUsModel(
      icon: FontAwesomeIcons.facebookF,
      title: 'Facebook',
    ),
    ContactUsModel(
      icon: FontAwesomeIcons.instagram,
      title: 'Instagram',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: contactUsModel.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: ColorManager.lightPrimaryColor,
              child: Icon(
                item.icon,
                color: ColorManager.primaryColor,
              ),
            ),
            title: Text(
              item.title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.textBlackColor,
                    fontSize: 16,
                  ),
            ),
            trailing: CircleAvatar(
              radius: 16,
              backgroundColor: ColorManager.whiteColor,
              child: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorManager.primaryColor,
                    ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
