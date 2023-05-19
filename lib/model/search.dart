import 'package:hive/hive.dart';
part '../hive/search.g.dart';

@HiveType(typeId: 0)
class SearchModel {
  @HiveField(0)
  String? batchcomplete;
  // Continue? continue;
  @HiveField(1)
  Query? query;

  SearchModel(
      {this.batchcomplete,
      // this.continue,
      this.query});

  SearchModel.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    // continue = json['continue'] != null ? new Continue.fromJson(json['continue']) : null;
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = this.batchcomplete;
    // if (this.continue != null) {
    //   data['continue'] = this.continue!.toJson();
    // }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Query {
  @HiveField(0)
  Searchinfo? searchinfo;
  @HiveField(1)
  List<Search>? search;

  Query({this.searchinfo, this.search});

  Query.fromJson(Map<String, dynamic> json) {
    searchinfo = json['searchinfo'] != null
        ? new Searchinfo.fromJson(json['searchinfo'])
        : null;
    if (json['search'] != null) {
      search = <Search>[];
      json['search'].forEach((v) {
        search!.add(new Search.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchinfo != null) {
      data['searchinfo'] = this.searchinfo!.toJson();
    }
    if (this.search != null) {
      data['search'] = this.search!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Searchinfo {
  @HiveField(0)
  int? totalhits;

  Searchinfo({this.totalhits});

  Searchinfo.fromJson(Map<String, dynamic> json) {
    totalhits = json['totalhits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalhits'] = this.totalhits;
    return data;
  }
}

@HiveType(typeId: 3)
class Search {
  @HiveField(0)
  int? ns;
  @HiveField(1)
  String? title;
  @HiveField(2)
  int? pageid;
  @HiveField(3)
  int? size;
  @HiveField(4)
  int? wordcount;
  @HiveField(5)
  String? snippet;
  @HiveField(6)
  String? timestamp;

  Search(
      {this.ns,
      this.title,
      this.pageid,
      this.size,
      this.wordcount,
      this.snippet,
      this.timestamp});

  Search.fromJson(Map<String, dynamic> json) {
    ns = json['ns'];
    title = json['title'];
    pageid = json['pageid'];
    size = json['size'];
    wordcount = json['wordcount'];
    snippet = json['snippet'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ns'] = this.ns;
    data['title'] = this.title;
    data['pageid'] = this.pageid;
    data['size'] = this.size;
    data['wordcount'] = this.wordcount;
    data['snippet'] = this.snippet;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
