// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';

class VendorAddItemScreen extends StatelessWidget {
  const VendorAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: CustomText(title: "Add Item", color: AppColors.blackColor, fontSize: 24.sp, fontWeight: FontWeight.w700,),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: AppColors.whiteColor,),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Upload Food Image",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  CustomDottedWidget(),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Item Name",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  RoundTextField(
                    hint: "Name",
                  ),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Item Details",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  RoundTextField(
                    hint: "description",
                  ),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Item Category Name",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  RoundTextField(
                    hint: "category",
                  ),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Item Category Icon",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  CustomDottedWidget()
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Item Price",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  RoundTextField(hint: "\$50"),
                ],
              ),

              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Item discount",
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  12.heightBox,
                  RoundTextField(hint: "\$20"),
                ],
              ),


              20.heightBox,
              Roundbutton(
                  title: "Confirm",
                  borderRadius: 8.r,
                  buttonColor: AppColors.secondaryColor,
                  onTap: (){}),
              40.heightBox,

            ],
          ),
        )
      ),
    );
  }
}
