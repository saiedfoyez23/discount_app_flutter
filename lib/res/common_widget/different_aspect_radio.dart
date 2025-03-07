

import 'package:flutter/material.dart';

mixin differentAspectRadio {
  double getAspectRatioForScreenSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 400) {
      return 0.5; // Small devices (e.g., small phones)
    } else if (screenWidth >= 400 && screenWidth < 600) {
      return 0.7; // Medium devices (e.g., regular phones)
    } else if (screenWidth >= 600 && screenWidth < 1024) {
      return 0.75; // Large devices (e.g., tablets or large phones)
    } else {
      return 0.8; // Extra large devices (e.g., tablets in landscape)
    }
  }

}