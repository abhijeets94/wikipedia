import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki/provider/search_provider.dart';

import '../model/search.dart';

class HistoryDetailScreen extends StatefulWidget {
  static const routeName = "/history-details-screen";
  HistoryDetailScreen({super.key, this.searchedItem, this.detailImage});
  final searchedItem;
  String? detailImage;

  @override
  State<HistoryDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<HistoryDetailScreen> {
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

    var args =
        ModalRoute.of(context)?.settings.arguments! as Map<String, dynamic>;
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
              Center(
                child: CachedNetworkImage(
                  imageUrl: image!,
                  fit: BoxFit.fill,
                  height: 200,
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
