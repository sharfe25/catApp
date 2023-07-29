import 'package:catbreeds/components/landing/Card.dart';
import 'package:catbreeds/controllers/cats.controller.dart';
import 'package:catbreeds/models/Cat.dart';
import 'package:catbreeds/providers/detailsProvider.dart';
import 'package:catbreeds/utils/errorResponse.dart';
import 'package:catbreeds/utils/textStyles.dart';
import 'package:catbreeds/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  List<Cat> items = [];
  List<Cat> duplicateItems = [];
  TextEditingController searchController = TextEditingController();
  CatsController catsController = CatsController();
  late DetailsProvider detailsProvider;


  @override
  void initState() {
    super.initState();
    detailsProvider = Provider.of<DetailsProvider>(context, listen: false);
    getAllCats();
  }


  void getAllCats() async {
    final response = await catsController.getAllCats();
    if (response["res"]) {
      setState(() {
        duplicateItems = response["body"];
        items = response["body"];
      });
      for (var item in items) {
        if(item.imageUrl != null && item.imageUrl == 'loading'){
          item.imageUrl = await catsController.getCatImage(item.referenceImageId);
          if(item.id == detailsProvider.getCat?.id){
            detailsProvider.setCat(item);
          }
        }
        setState(() {});
      }
      
    } else {
      final snackBar = buildSnackBar(response["body"], context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: searchController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                              detailsProvider.setCat(items[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailsView(),
                                        fullscreenDialog: true));
                              },
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: infoCard(items[index],
                                  titleTextStyle: titleTextStyle(fontSize: 1.6 * Get.height / 100),
                                  containTextStyle: TextStyle(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Nunito',
                                      fontSize: 1.2 * Get.height / 100))));
                    },
                  ),
                )
              : const Text("No information to display"),
        ],
      ),
    );
  }
}
