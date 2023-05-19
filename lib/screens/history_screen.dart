import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, historyData});
  static const String routeName = '/history-screen';

  @override
  Widget build(BuildContext context) {
    var history = ModalRoute.of(context)!.settings.arguments! as List;
    // debugPrint("history => $history");
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: history.length,
        itemBuilder: (context, index) => SizedBox(
          height: MediaQuery.of(context).size.height / 8,
          child: Card(
            elevation: 1.5,
            child: Center(
              child: Text(
                "${history[index].keys}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
