import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreProductListScreen extends StatelessWidget {
  const ExploreProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreProductListViewWidget exploreProductListViewWidget = Get.put(ExploreProductListViewWidget(context: context));
    return Scaffold(
      body: exploreProductListViewWidget.exploreProductListViewWidget(context: context),
    );
  }
}
