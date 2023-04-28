import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki/provider/search_provider.dart';

import '../model/search.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = "/details-screen";
  DetailScreen({super.key, this.searchedItem, this.detailImage});
  final searchedItem;
  String? detailImage;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final args;
  late final Search? search;
  late final String? image;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = ModalRoute.of(context)?.settings.arguments! as Map<String, dynamic>;
    search = args["searchedContent"];
    image = args["searchedImage"];
    Provider.of<WikiProvider>(context, listen: false)
        .setContent(search!.title!, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Provider.of<WikiProvider>(context, listen: false)
                .setContent('', context);

            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "${search!.title}",
          style: const TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Hero(
                tag: Text("contentImage"),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: image!,
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<WikiProvider>(builder: (context, wikiprovider, _) {
                return Text(
                  wikiprovider.getContentDetails.isEmpty
                      ? ""
                      : "${wikiprovider.getContentDetails[0].revisions![0].slots?.main?.content}",
                  style: const TextStyle(fontSize: 18),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
