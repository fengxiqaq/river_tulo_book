class Location {
  int? id;
  String? name;
  String? iso3;
  String? iso2;
  String? numericCode;
  String? phoneCode;
  String? capital;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  String? tld;
  String? native;
  String? region;
  String? subregion;
  String? nationality;
  List<Timezones>? timezones;
  Translations? translations;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiU;
  List<States>? states;

  Location(
      {this.id,
      this.name,
      this.iso3,
      this.iso2,
      this.numericCode,
      this.phoneCode,
      this.capital,
      this.currency,
      this.currencyName,
      this.currencySymbol,
      this.tld,
      this.native,
      this.region,
      this.subregion,
      this.nationality,
      this.timezones,
      this.translations,
      this.latitude,
      this.longitude,
      this.emoji,
      this.emojiU,
      this.states});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    numericCode = json['numeric_code'];
    phoneCode = json['phone_code'];
    capital = json['capital'];
    currency = json['currency'];
    currencyName = json['currency_name'];
    currencySymbol = json['currency_symbol'];
    tld = json['tld'];
    native = json['native'];
    region = json['region'];
    subregion = json['subregion'];
    nationality = json['nationality'];
    if (json['timezones'] != null) {
      timezones = <Timezones>[];
      json['timezones'].forEach((v) {
        timezones?.add(Timezones.fromJson(v));
      });
    }
    translations = json['translations'] != null
        ? Translations?.fromJson(json['translations'])
        : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states?.add(States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['iso3'] = iso3;
    data['iso2'] = iso2;
    data['numeric_code'] = numericCode;
    data['phone_code'] = phoneCode;
    data['capital'] = capital;
    data['currency'] = currency;
    data['currency_name'] = currencyName;
    data['currency_symbol'] = currencySymbol;
    data['tld'] = tld;
    data['native'] = native;
    data['region'] = region;
    data['subregion'] = subregion;
    data['nationality'] = nationality;
    if (timezones != null) {
      data['timezones'] = timezones?.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations?.toJson();
    }
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['emoji'] = emoji;
    data['emojiU'] = emojiU;
    if (states != null) {
      data['states'] = states?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timezones {
  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  Timezones(
      {this.zoneName,
      this.gmtOffset,
      this.gmtOffsetName,
      this.abbreviation,
      this.tzName});

  Timezones.fromJson(Map<String, dynamic> json) {
    zoneName = json['zoneName'];
    gmtOffset = json['gmtOffset'];
    gmtOffsetName = json['gmtOffsetName'];
    abbreviation = json['abbreviation'];
    tzName = json['tzName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['zoneName'] = zoneName;
    data['gmtOffset'] = gmtOffset;
    data['gmtOffsetName'] = gmtOffsetName;
    data['abbreviation'] = abbreviation;
    data['tzName'] = tzName;
    return data;
  }
}

class Translations {
  String? kr;
  String? ptBR;
  String? pt;
  String? nl;
  String? hr;
  String? fa;
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? cn;
  String? tr;

  Translations(
      {this.kr,
      this.ptBR,
      this.pt,
      this.nl,
      this.hr,
      this.fa,
      this.de,
      this.es,
      this.fr,
      this.ja,
      this.it,
      this.cn,
      this.tr});

  Translations.fromJson(Map<String, dynamic> json) {
    kr = json['kr'];
    ptBR = json['pt-BR'];
    pt = json['pt'];
    nl = json['nl'];
    hr = json['hr'];
    fa = json['fa'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    ja = json['ja'];
    it = json['it'];
    cn = json['cn'];
    tr = json['tr'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kr'] = kr;
    data['pt-BR'] = ptBR;
    data['pt'] = pt;
    data['nl'] = nl;
    data['hr'] = hr;
    data['fa'] = fa;
    data['de'] = de;
    data['es'] = es;
    data['fr'] = fr;
    data['ja'] = ja;
    data['it'] = it;
    data['cn'] = cn;
    data['tr'] = tr;
    return data;
  }
}

class States {
  int? id;
  String? name;
  String? stateCode;
  String? latitude;
  String? longitude;
  dynamic type;
  List<Cities>? cities;

  States(
      {this.id,
      this.name,
      this.stateCode,
      this.latitude,
      this.longitude,
      this.type,
      this.cities});

  States.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateCode = json['state_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities?.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_code'] = stateCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['type'] = type;
    if (cities != null) {
      data['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  String? latitude;
  String? longitude;

  Cities({this.id, this.name, this.latitude, this.longitude});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
