import '../app_const/import_list.dart';

class SnackMessage {
  void showSnackbar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}