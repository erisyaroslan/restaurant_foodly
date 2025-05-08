import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_foodly/common/custom_button.dart';
import 'package:restaurant_foodly/common/custom_textfield.dart';
import 'package:restaurant_foodly/controllers/food_controller.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({
    super.key,
    required this.back,
    required this.next,
    required this.title,
    required this.description,
    required this.price,
    required this.preparation,
    required this.types,
  });

  final Function() back;
  final Function() next;
  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController price;
  final TextEditingController preparation;
  final TextEditingController types;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return SizedBox(
      height: hieght,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Details",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to enter information correctly",
                  style: appStyle(11, kGray, FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextfield(
                  controller: title,
                  hintText: "Title",
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),

                const SizedBox(height: 15),

                CustomTextfield(
                  controller: description,
                  hintText: "Add food description",
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),

                const SizedBox(height: 15),

                CustomTextfield(
                  controller: preparation,
                  hintText: "Food preparation time e.g 10 min",
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),

                const SizedBox(height: 15),

                CustomTextfield(
                  controller: price,
                  hintText: "Price with no currency e.g 100",
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.money),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Food Types",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to type and helps with food search",
                  style: appStyle(11, kGray, FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => Column(
                children: [
                  CustomTextfield(
                    controller: types,
                    hintText: "Breakfast / Lunch / Dinner / Snacks / Drinks",
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.money),
                  ),
                  const SizedBox(height: 15),
                  controller.types.isNotEmpty
                      ? Row(
                        children: List.generate(controller.types.length, (i) {
                          return Container(
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.h),
                                child: ReusableText(
                                  text: controller.types[i],
                                  style: appStyle(
                                    11,
                                    kWhite,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 15),

                  CustomButton(
                    text: "Add Food Types",
                    btnColor: kSecondary,
                    onTap: () {
                      controller.setTypes = types.text;
                      types.text = "";
                    },
                    btnRadius: 6,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Back",
                  btnWidth: width / 2.3,
                  btnRadius: 9,
                  onTap: () {
                    back();
                  },
                ),
                CustomButton(
                  text: "Back",
                  btnWidth: width / 2.3,
                  btnRadius: 9,
                  onTap: () {
                    next();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
