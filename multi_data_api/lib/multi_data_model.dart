class MultiData {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;
  Meta? mMeta;

  MultiData(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.support,
        this.mMeta});

  MultiData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    support =
    json['support'] != null ? new Support.fromJson(json['support']) : null;
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    if (this.mMeta != null) {
      data['_meta'] = this.mMeta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['color'] = this.color;
    data['pantone_value'] = this.pantoneValue;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}

class Meta {
  String? poweredBy;
  String? upgradeUrl;
  String? docsUrl;
  String? templateGallery;
  String? message;
  List<String>? features;
  String? upgradeCta;

  Meta(
      {this.poweredBy,
        this.upgradeUrl,
        this.docsUrl,
        this.templateGallery,
        this.message,
        this.features,
        this.upgradeCta});

  Meta.fromJson(Map<String, dynamic> json) {
    poweredBy = json['powered_by'];
    upgradeUrl = json['upgrade_url'];
    docsUrl = json['docs_url'];
    templateGallery = json['template_gallery'];
    message = json['message'];
    features = json['features'].cast<String>();
    upgradeCta = json['upgrade_cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['powered_by'] = this.poweredBy;
    data['upgrade_url'] = this.upgradeUrl;
    data['docs_url'] = this.docsUrl;
    data['template_gallery'] = this.templateGallery;
    data['message'] = this.message;
    data['features'] = this.features;
    data['upgrade_cta'] = this.upgradeCta;
    return data;
  }
}
