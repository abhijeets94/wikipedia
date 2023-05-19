import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatefulWidget {
  static const routeName = "/history-details-screen";
  HistoryDetailScreen({super.key, this.searchedItem, this.detailImage});
  final searchedItem;
  String? detailImage;

  @override
  State<HistoryDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<HistoryDetailScreen> {
  late final String? search;
  late final String? title;

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
    debugPrint("args => ${args.values.toList()[0]}");
    search = args.values.toList()[1].toString();
    title = args.values.toList()[0].toString();

    // Provider.of<WikiProvider>(context, listen: false)
    //     .setContent(search!.title!, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Provider.of<WikiProvider>(context, listen: false)
            //     .setContent('', context);

            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "$title",
          style: const TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Center(
              //   child: CachedNetworkImage(
              //     imageUrl: title!,
              //     fit: BoxFit.fill,
              //     height: 200,
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Text(
                "$search",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
