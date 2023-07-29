import 'dart:ui';

import 'package:catbreads/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget infoCard(item,
    {required TextStyle titleTextStyle, required TextStyle containTextStyle}) {
  return Card(
      color: const Color.fromARGB(255, 118, 81, 183),
      semanticContainer: false,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(children: [
        Padding(
            padding: const EdgeInsets.all(10),
            child: item.imageUrl == 'loading'
                ? const LoaderView()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: item.imageUrl == null
                        ? Image.asset('assets/logo.png',
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            fit: BoxFit.cover)
                        : Image.network(item.imageUrl,
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            fit: BoxFit.cover),
                  )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              child: Text(item.name, style: titleTextStyle),
            ),
            Chip(
              label: Text("Intelligence: ${item.intelligence}",
                  style: containTextStyle),
            ),
            Chip(
              label: Text("Origin: ${item.origin}", style: containTextStyle),
            ),
          ],
        ),
        const Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(FontAwesomeIcons.chevronRight, color: Colors.white),
            ),
          ),
        ),
      ]));
}
