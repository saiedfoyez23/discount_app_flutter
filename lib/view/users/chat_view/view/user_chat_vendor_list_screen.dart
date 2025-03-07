// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/view/users/chat_view/view/user_chat_screen.dart';

class UserChatVendorListScreen extends StatefulWidget {
  const UserChatVendorListScreen({super.key});

  @override
  State<UserChatVendorListScreen> createState() => _UserChatVendorListScreenState();
}

class _UserChatVendorListScreenState extends State<UserChatVendorListScreen> {


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
                      hint: "Search a Doctor",
                    focusColor: Colors.transparent,
                    prefixIcon: Icon(Icons.search_outlined),
                    filled: true,
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
                            userName: "Vendor",
                            lastMsg: "Worem consectetur adipiscing elit.",
                            time: "12.50",
                            onTap: () {
                              Get.to(()=>UserChatScreen());
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
