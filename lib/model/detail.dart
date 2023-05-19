import 'package:hive/hive.dart';
part '../hive/detail.g.dart';

@HiveType(typeId: 0)
class DetailsModel {
  @HiveField(0)
  bool? batchcomplete;
  @HiveField(1)
  Query? query;

  DetailsModel({this.batchcomplete, this.query});

  DetailsModel.fromJson(Map<String, dynamic> json) {
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

@HiveType(typeId: 1)
class Query {
  @HiveField(0)
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

@HiveType(typeId: 2)
class Pages {
  @HiveField(0)
  int? pageid;
  @HiveField(1)
  int? ns;
  @HiveField(2)
  String? title;
  @HiveField(3)
  List<Revisions>? revisions;

  Pages({this.pageid, this.ns, this.title, this.revisions});

  Pages.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'];
    ns = json['ns'];
    title = json['title'];
    if (json['revisions'] != null) {
      revisions = <Revisions>[];
      json['revisions'].forEach((v) {
        revisions!.add(new Revisions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = this.pageid;
    data['ns'] = this.ns;
    data['title'] = this.title;
    if (this.revisions != null) {
      data['revisions'] = this.revisions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 3)
class Revisions {
  @HiveField(0)
  Slots? slots;

  Revisions({this.slots});

  Revisions.fromJson(Map<String, dynamic> json) {
    slots = json['slots'] != null ? new Slots.fromJson(json['slots']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slots != null) {
      data['slots'] = this.slots!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 4)
class Slots {
  @HiveField(0)
  Main? main;

  Slots({this.main});

  Slots.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 5)
class Main {
  @HiveField(0)
  String? contentmodel;
  @HiveField(1)
  String? contentformat;
  @HiveField(2)
  String? content;

  Main({this.contentmodel, this.contentformat, this.content});

  Main.fromJson(Map<String, dynamic> json) {
    contentmodel = json['contentmodel'];
    contentformat = json['contentformat'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentmodel'] = this.contentmodel;
    data['contentformat'] = this.contentformat;
    data['content'] = this.content;
    return data;
  }
}
