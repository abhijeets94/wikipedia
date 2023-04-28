class SearchImageDesc {
  bool? batchcomplete;
  Query? query;

  SearchImageDesc({this.batchcomplete, this.query});

  SearchImageDesc.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = this.batchcomplete;
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    return data;
  }
}

class Query {
  List<Pages>? pages;

  Query({this.pages});

  Query.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? pageid;
  int? ns;
  String? title;
  Thumbnail? thumbnail;
  String? pageimage;
  // Terms? terms;

  Pages({
    this.pageid,
    this.ns,
    this.title,
    this.thumbnail,
    this.pageimage,
    // this.terms
  });

  Pages.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'];
    ns = json['ns'];
    title = json['title'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    pageimage = json['pageimage'];
    // terms = json['terms'] != null ? new Terms.fromJson(json['terms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = this.pageid;
    data['ns'] = this.ns;
    data['title'] = this.title;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    data['pageimage'] = this.pageimage;
    // if (this.terms != null) {
    //   data['terms'] = this.terms!.toJson();
    // }
    return data;
  }
}

class Thumbnail {
  String? source;
  int? width;
  int? height;

  Thumbnail({this.source, this.width, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
