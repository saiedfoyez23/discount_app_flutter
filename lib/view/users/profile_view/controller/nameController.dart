// Create a controller to manage the name state
import 'package:get/get.dart';

class NameController extends GetxController {
  // Reactive variable to store the name
  var name = "Daniel Martinez".obs;

  // Function to update the name
  void updateName(String newName) {
    name.value = newName;
  }
}