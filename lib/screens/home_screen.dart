import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wiki/provider/search_provider.dart';
import 'package:wiki/screens/details_screen.dart';
import 'package:wiki/screens/history_screen.dart';
import 'package:wiki/services/hive_services.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  final searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Debouncer(milliseconds: 1000).run(() {
      Provider.of<WikiProvider>(context, listen: false).checkInternet(context);
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height / 8,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/d/de/Wikipedia-logo_%28inverse%29.png",
                    placeholder: (context, url) => const Icon(Icons.book),
                    width: 50,
                    height: 50,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Provider.of<WikiProvider>(context)
                                  .checkInternetResult
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: TextField(
                controller: searchController,
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    // Future.delayed(const Duration(milliseconds: 500), () {
                    //   Provider.of<WikiProvider>(context, listen: false)
                    //       .searchResults(searchController.text, context);
                    // });
                    Debouncer(
                      milliseconds: 500,
                    ).run(() {
                      Provider.of<WikiProvider>(context, listen: false)
                          .searchResults(searchController.text, context);
                    });
                  }
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.grey[50],
                  filled: true,
                ),
              )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Provider.of<WikiProvider>(context).checkInternetResult
                ? SearchResultList(searchController: searchController)
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          var box =
                              await HiveService().getBoxes(boxName: 'History');
                          if (context.mounted) {
                            Navigator.pushNamed(
                                context, HistoryScreen.routeName,
                                arguments: box);
                          }
                        },
                        child: const Text("Check history"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Hive.deleteBoxFromDisk('History');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        child: const Text("Clear history"),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Consumer<WikiProvider>(builder: (context, wikiProvider, __) {
      return searchController.text.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: wikiProvider.getSearchResults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      DetailScreen.routeName,
                      arguments: {
                        "searchedContent": wikiProvider.getSearchResults[index],
                        "searchedImage": wikiProvider.getSearchResultsImage[
                            wikiProvider.getSearchResults[index].title]
                      },
                    ),
                    child: Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${wikiProvider.getSearchResultsImage[wikiProvider.getSearchResults[index].title]}",
                            width: 50,
                            height: 50,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              "${wikiProvider.getSearchResults[index].title}",
                              style: const TextStyle(fontSize: 25),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                );
              });
    });
  }
}

class Debouncer {
  late final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
