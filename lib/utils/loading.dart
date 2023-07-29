import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoaderView extends StatefulWidget {
  const LoaderView({Key? key}) : super(key: key);

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.3,
      height: Get.width * 0.3,
      child: const Center(
        child: SpinKitRotatingCircle(
      color:  Color.fromARGB(255, 179, 149, 232),
      size: 50.0,
    )));
  }
}
