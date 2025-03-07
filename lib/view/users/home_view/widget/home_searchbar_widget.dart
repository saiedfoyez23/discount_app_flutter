import 'package:discount_me_app/res/app_const/import_list.dart';

class HomeSearchbarWidget extends StatelessWidget {
  const HomeSearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border:Border.all(width: 1, color: AppColors.whiteDark),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.grey,
              size: 32.h.w,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r))),
      ),
    );
  }
}
