// Create a controller to manage the name state
import 'package:discount_me_app/res/app_const/import_list.dart';

class NameController extends GetxController {
  // Reactive variable to store the name
  var name = "Daniel Martinez".obs;

  // Function to update the name
  void updateName(String newName) {
    name.value = newName;
  }
}