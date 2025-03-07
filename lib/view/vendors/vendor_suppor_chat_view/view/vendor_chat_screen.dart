// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:discount_me_app/res/app_const/import_list.dart';

class VendorChatScreen extends StatefulWidget {
  const VendorChatScreen({super.key});

  @override
  State<VendorChatScreen> createState() => _VendorChatScreenState();
}

class _VendorChatScreenState extends State<VendorChatScreen> {
  // Sample data for the chat
  final List<Map<String, dynamic>> chatMessages = [
    {
      "sender": "User", // Changed to "User"
      "message": "Hey there! 👋",
      "time": "10:08",
      "isSentByMe": false,
    },
    {
      "sender": "User", // Changed to "User"
      "message":
          "Game RA 2 has just had a new update for macOS.\nThere is support for many new items and characters. 😌",
      "time": "10:08",
      "isSentByMe": false,
    },
    {
      "sender": "Me", // "Me" for messages sent by the user
      "message": "Hi!",
      "time": "10:10",
      "isSentByMe": true,
    },
    {
      "sender": "Me", // "Me" for messages sent by the user
      "message":
          "Great, thanks for letting me know! \nI really look forward to experiencing it soon. 🎉",
      "time": "10:11",
      "isSentByMe": true,
    },
    {
      "sender": "User", // Changed to "User"
      "message": "Does this update fix error 352 for the Engineer character?",
      "time": "10:11",
      "isSentByMe": false,
    },
  ];

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
          opacity: 0.5,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              // App Bar section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    20.widthBox,
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.asset(
                            AppImages.profileImage,
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        10.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Katryn Murphy",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.heightBox,

              // Chat messages section
              Expanded(
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = chatMessages[index];
                    final isSentByMe = message['isSentByMe'] as bool;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Align(
                        alignment: isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: width * 0.70,
                          decoration: BoxDecoration(
                            color: isSentByMe
                                ? AppColors.secondaryColor
                                : AppColors.greenLightHover,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: isSentByMe
                                    ? Radius.circular(0)
                                    : Radius.circular(10),
                                topLeft: isSentByMe
                                    ? Radius.circular(10)
                                    : Radius.circular(0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['message'],
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: isSentByMe
                                        ? Colors.white
                                        : Color(0xff1D242D)),
                              ),
                              6.heightBox,
                              Align(
                                alignment: isSentByMe
                                    ? Alignment.bottomRight
                                    : Alignment.bottomLeft,
                                child: Container(
                                  width: 60.w,
                                  child: Row(
                                    children: [
                                      isSentByMe
                                          ? Image.asset(
                                        AppImages.sendIcon,
                                        scale: 4,
                                      )
                                          : SizedBox(),
                                      isSentByMe ? 6.widthBox : 0.widthBox,
                                      Text(
                                        message['time'],
                                        style: GoogleFonts.roboto(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: isSentByMe? Colors.white : AppColors.primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Input message field section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: IconButton(
                        onPressed: () {
                          PickerDialog().showImagePickerDialog(context);
                        },
                        icon: Image.asset(
                          AppImages.fileAttachmentIcon,
                          scale: 4,
                        ),
                      ),
                    ),
                    10.widthBox,
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Message',
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Image.asset(
                              AppImages.msgSendIcon,
                              scale: 3.5,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(width: 1.5, color: AppColors.secondaryColor)
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
