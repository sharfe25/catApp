import 'dart:collection';

import 'package:catbreeds/components/details/DetailAppBar.dart';
import 'package:catbreeds/models/Cat.dart';
import 'package:catbreeds/providers/detailsProvider.dart';
import 'package:catbreeds/utils/loading.dart';
import 'package:catbreeds/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsProvider detailsProvider;
  Cat? cat;
  Map<String, dynamic> catData = HashMap();

  @override
  void initState() {
    super.initState();
    detailsProvider = Provider.of<DetailsProvider>(context, listen: false);
    setDetails();
    detailsProvider.addListener(() {
      setDetails();
    });
  }

  @override
  void dispose() {
    detailsProvider.removeListener(() {
      setDetails();
    });
    super.dispose();
  }

  void setDetails() {
    if (mounted) {
      setState(() {
        cat = detailsProvider.getCat;
      });
      catData.addAll({
        "Origin": cat!.origin,
        "Intelligence": cat!.intelligence.toString(),
        "Adaptability": cat!.adaptability.toString(),
        "Life Span": cat!.lifeSpan.toString(),
        "Affection Level": cat!.affectionLevel.toString(),
        "Child Friendly": cat!.childFriendly.toString(),
        "Dog Friendly": cat!.dogFriendly.toString(),
        "Health Issues": cat!.healthIssues.toString(),
      });
    }
  }

  Widget itemTile(int index) {
    return ListTile(
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        trailing: SizedBox(
            width: 120,
            child: Text(catData.values.elementAt(index),
                style: containTextStyle(
                    color: const Color.fromARGB(255, 58, 134, 97),
                    fontSize: 1.6 * Get.height / 100))),
        title: Text(catData.keys.elementAt(index),
            style: containTextStyle(fontSize: 1.6 * Get.height / 100)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 220, 207, 242),
        child: Center(
          child: cat != null
              ? Column(
                  children: <Widget>[
                    detailAppBar(cat!.name,
                        context: context, titleStyle: titleTextStyle()),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: cat?.imageUrl == 'loading'
                            ? const LoaderView()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: cat?.imageUrl == null
                                    ? Image.asset('assets/logo.png',
                                        width: Get.width * 0.9,
                                        height: Get.width * 0.9,
                                        fit: BoxFit.cover)
                                    : Image.network(cat!.imageUrl!,
                                        width: Get.width * 0.9,
                                        height: Get.width * 0.9,
                                        fit: BoxFit.cover))),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cat!.description,
                            textAlign: TextAlign.justify,
                            style: containTextStyle(
                                fontSize: 1.6 * Get.height / 100),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "Characteristics",
                                style: titleTextStyle(color: Colors.black),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Material(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: catData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return itemTile(index);
                                      })))
                        ],
                      ),
                    )))
                  ],
                )
              : const Text("No information to display"),
        ));
  }
}
