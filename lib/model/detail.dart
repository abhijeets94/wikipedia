class DetailsModel {
  bool? batchcomplete;
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

class Revisions {
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

class Slots {
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

class Main {
  String? contentmodel;
  String? contentformat;
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
