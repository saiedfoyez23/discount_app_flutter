// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class RiderTransactionDetailsScreen extends StatelessWidget {
  const RiderTransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Earnings",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    AppImages.transactionDetailsBg,
                    scale: 4,
                  ),
                ),
                10.widthBox,
                Expanded(
                    child: Container(
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _userDetails(title: "Full name :", value: "Jane Cooper"),
                      5.heightBox,
                      _userDetails(
                          title: "Phone number :", value: "(319) 555-0115"),
                      5.heightBox,
                      _userDetails(title: "Email :", value: "abc@example.com"),
                    ],
                  ),
                ))
              ],
            ),

            40.heightBox,
            CustomText(
              title: "Transaction details :",
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.black,
            ),
            20.heightBox,
            _transactionDetailsWidget(title: "Transaction ID : ", value: "12345678"),
            8.heightBox,
            _transactionDetailsWidget(title: "A/C holder name:", value: "Wade Warren"),
            8.heightBox,
            _transactionDetailsWidget(title: "A/C number:", value: "**** **** *456"),
            8.heightBox,
            _transactionDetailsWidget(title: "Received amount:", value: "\$ 500"),
            8.heightBox,
            _transactionDetailsWidget(title: "Detect Percentage:", value: "\$ 100"),
            8.heightBox,
            _transactionDetailsWidget(title: "Final Amount:", value: "\$ 400"),
          ],
        ),
      ),
    );
  }

  Widget _userDetails({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        CustomText(
          title: value,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
      ],
    );
  }
  Widget _transactionDetailsWidget({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff47586E),
        ),
        CustomText(
          title: value,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff47586E),
        ),
      ],
    );
  }
}
