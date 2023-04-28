import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:wiki/constants/api_routes.dart';
import 'package:wiki/constants/widgets.dart';
import 'package:wiki/model/detail.dart' as details;
import 'package:wiki/model/search.dart';

import '../model/searchImageDesc.dart';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class WikiProvider extends ChangeNotifier {
  Dio dio = Dio();

  bool _isConnected = false;
  List<Search> _searchResult = [];
  List<Pages> _searchResultImageDesc = [];
  List<details.Pages> _contentDetails = [];
  Map<String, String> _searchResultImage = {};

  bool get checkInternetResult => _isConnected;
  List<Search> get getSearchResults => _searchResult;
  List<Pages> get getSearchResultsImageDesc => _searchResultImageDesc;
  List<details.Pages> get getContentDetails => _contentDetails;
  Map<String, String> get getSearchResultsImage => _searchResultImage;

  void checkInternet(BuildContext context) async {
    try {
      final checkInternet = await InternetAddress.lookup('google.com');
      debugPrint('internet => $checkInternet');
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
    final response = await dio
        .get(
      apiSearch(searchParam),
      options: buildCacheOptions(
        Duration(days: 3),
        maxStale: Duration(days: 5),
      ),
    )
        .then((value) {
      try {
        _searchResult =
            SearchModel.fromJson(jsonDecode(value.toString())).query!.search!;
        for (int i = 0; i < _searchResult.length; i++) {
          searchImageDesc(_searchResult[i].title!, context);
        }
        notifyListeners();
      } catch (e) {
        showSnackBar("Not reponding", context);
      }
    });
  }

  Future searchImageDesc(String searchParam, BuildContext context) async {
    debugPrint("\n\nSearch Param = $searchParam");
    final response = await dio
        .get(
      apiSearchThubnailAndDesc(searchParam),
    )
        .then((value) {
      try {
        _searchResultImage[searchParam] =
            SearchImageDesc.fromJson(jsonDecode(value.toString()))
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
    if (searchParam.isNotEmpty) {
      final Response = await dio
          .get(
        apiContent(searchParam),
      )
          .then((value) {
        try {
          _contentDetails =
              details.DetailsModel.fromJson(jsonDecode(value.toString()))
                  .query!
                  .pages!;

          // notifyListeners();
        } catch (e) {
          showSnackBar("Not reponding", context);
        }
      });
    } else {
      _contentDetails = [
        details.Pages(
          pageid: 0,
          ns: 0,
          revisions: [
            details.Revisions(
              slots: details.Slots(
                main: details.Main(
                    content: '', contentformat: '', contentmodel: ''),
              ),
            ),
          ],
        ),
      ];
    }
    notifyListeners();
  }
}
