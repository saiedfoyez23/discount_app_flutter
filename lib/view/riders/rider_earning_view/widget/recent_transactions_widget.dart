import 'package:discount_me_app/res/app_const/import_list.dart';

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: Container(
            width: width,
            height: 2,
            decoration: BoxDecoration(
              color: Color(0xffe4e4e4),
            ),
          ),
        ),
        Container(
          width: 160.w,
          alignment: Alignment.center,
          child:  CustomText(
            title: "Recent Transactions",
            color: AppColors.blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Container(
            width: width,
            height: 2,
            decoration: BoxDecoration(
              color: Color(0xffe4e4e4),
            ),
          ),
        ),
      ],
    );
  }
}
