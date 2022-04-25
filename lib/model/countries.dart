class CountriesModel {
  List<Countries>? countries;

  CountriesModel({this.countries});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? name;
  String? iso2;
  String? iso3;

  Countries({this.name, this.iso2, this.iso3});

  // mengambil json yang telah kita request dan membentuknya menjadi object.
  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
  }

  // membentuk object tadi menjadi tipe data Map (Map adalah kumpulan dari pasangan
  // key/value) untuk kita gunakan pada tampilannya nanti.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    return data;
  }
}
