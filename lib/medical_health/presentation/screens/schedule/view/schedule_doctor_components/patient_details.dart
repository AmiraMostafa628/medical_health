import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';


class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Text(
            'Patient Details',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorManager.primaryColor,
                  fontSize: 16.0,
                ),
          ),
          Row(
            spacing: 10.0,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: ColorManager.hintTextColor,
                  ),
                ),
                child: Text(
                  'YourSelf',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.hintTextColor,
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Another Person',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.whiteColor,
                      ),
                ),
              ),
            ],
          ),
          Text(
            'Full Name',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 18.0),
          ),
          CustomTextFormField(
              text: 'John doe',
              type: TextInputType.text,
              textEditingController: TextEditingController()),
          Text(
            'Age',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 18.0),
          ),
          CustomTextFormField(
              text: '30',
              type: TextInputType.text,
              textEditingController: TextEditingController()),
          Text(
            'Gender',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 18.0),
          ),
          Row(
            spacing: 10.0,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: ColorManager.hintTextColor,
                  ),
                ),
                child: Text(
                  'Male',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.hintTextColor,
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Female',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.whiteColor,
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: ColorManager.hintTextColor,
                  ),
                ),
                child: Text(
                  'Other',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.hintTextColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
