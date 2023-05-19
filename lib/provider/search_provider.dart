import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as https;
import 'package:path_provider/path_provider.dart';
import 'package:wiki/constants/api_routes.dart';
import 'package:wiki/constants/widgets.dart';
import 'package:wiki/model/detail.dart' as details;
import 'package:wiki/model/search.dart';
import 'package:wiki/services/hive_services.dart';

import '../model/searchImageDesc.dart';

class WikiProvider extends ChangeNotifier {
  bool _isConnected = false;
  List<Search> _searchResult = [];
  List<Pages> _searchResultImageDesc = [];
  List<details.Pages> _contentDetails = [];
  final Map<String, String> _searchResultImage = {};
  List<Map<String, String>> historyData = [];

  bool get checkInternetResult => _isConnected;
  List<Search> get getSearchResults => _searchResult;
  List<Pages> get getSearchResultsImageDesc => _searchResultImageDesc;
  List<details.Pages> get getContentDetails => _contentDetails;
  Map<String, String> get getSearchResultsImage => _searchResultImage;

  // Box? box;

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    // box = await Hive.openBox('wiki');
    return;
  }

  void checkInternet(BuildContext context) async {
    try {
      final checkInternet = await InternetAddress.lookup('google.com');
      if (checkInternet.isNotEmpty && checkInternet[0].rawAddress.isNotEmpty) {
        _isConnected = true;
      } else {
        _isConnected = false;
      }
    } catch (e) {
      _isConnected = false;
    }
    notifyListeners();
  }

  Future searchResults(String searchParam, BuildContext context) async {
    _searchResultImageDesc = [];
    final response = await https
        .get(
      Uri.parse(apiSearch(searchParam)),
    )
        .then((value) {
      try {
        _searchResult = SearchModel.fromJson(jsonDecode(value.body.toString()))
            .query!
            .search!;
        for (int i = 0; i < _searchResult.length; i++) {
          searchImageDesc(_searchResult[i].title!, context);
        }
        notifyListeners();
      } catch (e) {
        debugPrint("Not reponding => $e");
      }
    });
  }

  Future searchImageDesc(String searchParam, BuildContext context) async {
    debugPrint("\n\nSearch Param = $searchParam");
    final response = await https
        .get(
      Uri.parse(apiSearchThubnailAndDesc(searchParam)),
    )
        .then((value) {
      try {
        _searchResultImage[searchParam] =
            SearchImageDesc.fromJson(jsonDecode(value.body.toString()))
                .query!
                .pages![0]
                .thumbnail!
                .source!;
        // notifyListeners();
      } catch (e) {
        _searchResultImage[searchParam] =
            "https://upload.wikimedia.org/wikipedia/commons/d/de/Wikipedia-logo_%28inverse%29.png";
        // showSnackBar("Not reponding", context);
      }
      notifyListeners();
    });
  }

  Future setContent(String searchParam, BuildContext context) async {
    final hiveServices = HiveService();

    await openBox(); //Hive OpenBox
    if (searchParam.isNotEmpty) {
      final Response = await https
          .get(
        Uri.parse(apiContent(searchParam)),
      )
          .then((value) async {
        try {
          _contentDetails =
              details.DetailsModel.fromJson(jsonDecode(value.body.toString()))
                  .query!
                  .pages!;
          await putData(searchParam,
              _contentDetails[0].revisions![0].slots!.main!.content);

          historyData.add({
            searchParam: _contentDetails[0].revisions![0].slots!.main!.content!,
          });
          debugPrint("Check page as list = ${historyData.length}");
          await hiveServices.addBoxes(items: historyData, boxName: 'History');

          // notifyListeners();
        } catch (e) {
          showSnackBar("Not reponding", context);
        }
      });
    }
    // var myMap = box!.toMap().values.toList();
    // debugPrint("myMap => $myMap");
    notifyListeners();
  }

  Future putData(search, content) async {
    // await box!.clear(); //hive box clear

    // await box!.add({search: content}); //hive box adding
  }
}

mixin CheckMixin {
  getThisMixin() {
    print("gettingMix");
  }
}
