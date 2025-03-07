import '../app_const/import_list.dart';


class CustomAppBarWithBody extends StatelessWidget {
  final String appBarName;
  final Widget? leadingIcon;
  final Widget? body;
  final Widget? bottomNavigationBar;

  final List<Widget>? actions;

  final Color? flexibleSpaceBarColor;
  final Color? scaffoldBackgroundColor;
  final Color? appbarColor;

  const CustomAppBarWithBody({super.key,
    required this.appBarName,
    this.leadingIcon,
    this.actions,

    this.flexibleSpaceBarColor,
    this.scaffoldBackgroundColor=Colors.white,
    this.appbarColor=Colors.blue,

    this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(appBarName, style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black
          ),),
        centerTitle: true,
        leading: leadingIcon,
        backgroundColor: appbarColor,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: flexibleSpaceBarColor,),
        ),
        actions: actions,
      ),

      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
