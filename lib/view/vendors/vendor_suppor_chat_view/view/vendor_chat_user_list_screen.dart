// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/view/vendors/vendor_suppor_chat_view/view/vendor_chat_screen.dart';

class VendorChatUserListScreen extends StatefulWidget {
  const VendorChatUserListScreen({super.key});

  @override
  State<VendorChatUserListScreen> createState() => _VendorChatUserListScreenState();
}

class _VendorChatUserListScreenState extends State<VendorChatUserListScreen> {


  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomAppBar(
                    appBarName: "Message",
                    leadingColor: Colors.black,
                    titleColor: Colors.black,
                    onTap: () => Get.back(),
                  ),
                  
                  20.heightBox,
                  RoundTextField(
                      hint: "Search an user",
                    focusColor: AppColors.secondaryColor,
                    borderWidth: 1,
                    borderColor: AppColors.blackColor,
                    prefixIcon: Icon(Icons.search_outlined),
                    filled: true,
                    fillColor: AppColors.greenLight,
                  ),

                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: _userWidget(
                            userImage: AppImages.profileImage,
                            userName: "User",
                            lastMsg: "Worem consectetur adipiscing elit.",
                            time: "12.50",
                            onTap: () {
                              Get.to(()=>VendorChatScreen());
                            },
                          )
                      );
                    },
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _userWidget({required  String  userImage, required String userName, required String lastMsg, required String time, required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(image: AssetImage(userImage),
                  width: 60, height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              10.widthBox,

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: userName,
                    fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black,
                  ),

                  Text(lastMsg,
                    maxLines: 1,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp, color: AppColors.blackColor
                    ),
                  )

                ],
              )
            ],
          ),

          CustomText(
            title: time,
            fontWeight: FontWeight.w400,
            fontSize: 12, color: Colors.black,
          )
        ],
      ),
    );
  }
}
