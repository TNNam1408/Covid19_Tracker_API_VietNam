class VietNam {
  String? sourceUrl;
  String? lastUpdatedAtApify;
  String? author;
  Buymecoffee? buymecoffee;
  String? lastUpdatedAtSource;
  int? infected;
  int? recovered;
  int? deceased;
  int? treated;
  List<Detail>? detail;

  VietNam(
      {this.sourceUrl,
        this.lastUpdatedAtApify,
        this.author,
        this.buymecoffee,
        this.lastUpdatedAtSource,
        this.infected,
        this.recovered,
        this.deceased,
        this.treated,
        this.detail});

  VietNam.fromJson(Map<String, dynamic> json) {
    sourceUrl = json['sourceUrl'];
    lastUpdatedAtApify = json['lastUpdatedAtApify'];
    author = json['author'];
    buymecoffee = json['buymecoffee'] != null
        ? Buymecoffee.fromJson(json['buymecoffee'])
        : null;
    lastUpdatedAtSource = json['lastUpdatedAtSource'];
    infected = json['infected'];
    recovered = json['recovered'];
    deceased = json['deceased'];
    treated = json['treated'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourceUrl'] = sourceUrl;
    data['lastUpdatedAtApify'] = lastUpdatedAtApify;
    data['author'] = author;
    if (buymecoffee != null) {
      data['buymecoffee'] = buymecoffee!.toJson();
    }
    data['lastUpdatedAtSource'] = lastUpdatedAtSource;
    data['infected'] = infected;
    data['recovered'] = recovered;
    data['deceased'] = deceased;
    data['treated'] = treated;
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Buymecoffee {
  String? momo;
  String? bank;

  Buymecoffee({this.momo, this.bank});

  Buymecoffee.fromJson(Map<String, dynamic> json) {
    momo = json['momo'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['momo'] = momo;
    data['bank'] = bank;
    return data;
  }
}

class Detail {
  String? name;
  int? death;
  int? treating;
  int? cases;
  int? recovered;
  int? casesToday;

  Detail(
      {this.name,
        this.death,
        this.treating,
        this.cases,
        this.recovered,
        this.casesToday});

  Detail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    death = json['death'];
    treating = json['treating'];
    cases = json['cases'];
    recovered = json['recovered'];
    casesToday = json['casesToday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['death'] = death;
    data['treating'] = treating;
    data['cases'] = cases;
    data['recovered'] = recovered;
    data['casesToday'] = casesToday;
    return data;
  }
}