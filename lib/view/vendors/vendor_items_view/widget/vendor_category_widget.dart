// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class VendorCategoryWidget extends StatelessWidget {
  const VendorCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 80,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        padding: EdgeInsets.all(5),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, // Color of the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08), // Shadow color with opacity
                    spreadRadius: 0, // Spread radius of the shadow
                    blurRadius: 8, // Blur radius of the shadow
                    offset: Offset(0, 2), // Offset of the shadow (x, y)
                  ),
                ],
                borderRadius: BorderRadius.circular(8.r)
            ),
            margin: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.catMilk, scale: 4,),
                6.heightBox,
                CustomText(title: "Milk",color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500,),
              ],
            ),
          );
        },
      ),
    );
  }
}


