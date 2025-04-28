import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';

class CardSection extends StatelessWidget {
  const CardSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ProfileStates>(
      builder: (context,state) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      AssetsManager.cardDecoration,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Positioned(
                  top: 80,
                  left: 16,
                  child: Text(
                    state.cardNumber ?? '000 000 000 00',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 16,
                        color: ColorManager.whiteColor,
                        letterSpacing: 2),
                  )),
              Positioned(
                  bottom: 40,
                  left: 16,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Card holder name',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: ColorManager.whiteColor,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                            SizedBox(
                              width: 110,
                              child: Text(
                                state.cardName,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: ColorManager.whiteColor,
                                  overflow: TextOverflow.ellipsis
                                    ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry date',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: ColorManager.whiteColor,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                            Text(
                              state.expiryDate?? '04/28',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: ColorManager.whiteColor,
                                  ),
                            )
                          ],
                        ),
                        SvgPicture.asset(
                          AssetsManager.card,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      }
    );
  }
}
