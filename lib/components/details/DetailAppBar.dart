import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget detailAppBar(String title,
    {required BuildContext context, required TextStyle titleStyle}) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: const Color.fromARGB(255, 118, 81, 183),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.white,
                  size: 15,
                )),
             Text(
                    title,
                    style: titleStyle,
                  )
                
          ],
        ),
      ));
}
