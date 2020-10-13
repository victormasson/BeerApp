class Beer {
  int id;
  String name;
  String tagline;
  DateTime firstBrewed;
  String description;
  String imageUrl;
  double abv;
  double ibu;
  double targetFg;
  double targetOg;
  double ebc;
  double srm;
  double ph;
  double attenuationLevel;
  Volume volume;
  Volume boilVolume;
  Method method;
  Ingredients ingredients;
  List<String> foodPairing;
  String brewersTips;
  String contributedBy;

  Beer(
      {this.id,
      this.name,
      this.tagline,
      this.firstBrewed,
      this.description,
      this.imageUrl,
      this.abv,
      this.ibu,
      this.targetFg,
      this.targetOg,
      this.ebc,
      this.srm,
      this.ph,
      this.attenuationLevel,
      this.volume,
      this.boilVolume,
      this.method,
      this.ingredients,
      this.foodPairing,
      this.brewersTips,
      this.contributedBy});

  Beer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];

    String month = json['first_brewed'] != null
        ? json['first_brewed'].split('/')[0]
        : "01";
    String year =
        json['first_brewed'] != null ? json['first_brewed'].split('/')[1] : "0";
    firstBrewed = year != null && month != null
        ? DateTime.parse(year + month + '01')
        : DateTime.now();
    description = json['description'];
    imageUrl = json['image_url'];
    abv = json['abv'] != null ? double.parse(json['abv'].toString()) : null;
    ibu = json['ibu'] != null ? double.parse(json['ibu'].toString()) : null;
    targetFg = json['target_fg'] != null
        ? double.parse(json['target_fg'].toString())
        : null;
    targetOg = json['target_og'] != null
        ? double.parse(json['target_og'].toString())
        : null;
    ebc = json['ebc'] != null ? double.parse(json['ebc'].toString()) : null;
    srm = json['srm'] != null ? double.parse(json['srm'].toString()) : null;
    ph = json['ph'] != null ? double.parse(json['ph'].toString()) : null;
    attenuationLevel = json['attenuation_level'] != null
        ? double.parse(json['attenuation_level'].toString())
        : null;
    volume =
        json['volume'] != null ? new Volume.fromJson(json['volume']) : null;
    boilVolume = json['boil_volume'] != null
        ? new Volume.fromJson(json['boil_volume'])
        : null;
    method =
        json['method'] != null ? new Method.fromJson(json['method']) : null;
    ingredients = json['ingredients'] != null
        ? new Ingredients.fromJson(json['ingredients'])
        : null;
    foodPairing = json['food_pairing'].cast<String>();
    brewersTips = json['brewers_tips'];
    contributedBy = json['contributed_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tagline'] = this.tagline;
    data['first_brewed'] = this.firstBrewed;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['abv'] = this.abv;
    data['ibu'] = this.ibu;
    data['target_fg'] = this.targetFg;
    data['target_og'] = this.targetOg;
    data['ebc'] = this.ebc;
    data['srm'] = this.srm;
    data['ph'] = this.ph;
    data['attenuation_level'] = this.attenuationLevel;
    if (this.volume != null) {
      data['volume'] = this.volume.toJson();
    }
    if (this.boilVolume != null) {
      data['boil_volume'] = this.boilVolume.toJson();
    }
    if (this.method != null) {
      data['method'] = this.method.toJson();
    }
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.toJson();
    }
    data['food_pairing'] = this.foodPairing;
    data['brewers_tips'] = this.brewersTips;
    data['contributed_by'] = this.contributedBy;
    return data;
  }
}

class Volume {
  double value;
  String unit;

  Volume({this.value, this.unit});

  Volume.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value'].toString());
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}

class Method {
  List<MashTemp> mashTemp;
  Fermentation fermentation;
  String twist;

  Method({this.mashTemp, this.fermentation, this.twist});

  Method.fromJson(Map<String, dynamic> json) {
    if (json['mash_temp'] != null) {
      mashTemp = new List<MashTemp>();
      json['mash_temp'].forEach((v) {
        mashTemp.add(new MashTemp.fromJson(v));
      });
    }
    fermentation = json['fermentation'] != null
        ? new Fermentation.fromJson(json['fermentation'])
        : null;
    twist = json['twist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mashTemp != null) {
      data['mash_temp'] = this.mashTemp.map((v) => v.toJson()).toList();
    }
    if (this.fermentation != null) {
      data['fermentation'] = this.fermentation.toJson();
    }
    data['twist'] = this.twist;
    return data;
  }
}

class MashTemp {
  Volume temp;
  int duration;

  MashTemp({this.temp, this.duration});

  MashTemp.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] != null ? new Volume.fromJson(json['temp']) : null;
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    data['duration'] = this.duration;
    return data;
  }
}

class Fermentation {
  Volume temp;

  Fermentation({this.temp});

  Fermentation.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] != null ? new Volume.fromJson(json['temp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    return data;
  }
}

class Ingredients {
  List<Malt> malt;
  List<Hops> hops;
  String yeast;

  Ingredients({this.malt, this.hops, this.yeast});

  Ingredients.fromJson(Map<String, dynamic> json) {
    if (json['malt'] != null) {
      malt = new List<Malt>();
      json['malt'].forEach((v) {
        malt.add(new Malt.fromJson(v));
      });
    }
    if (json['hops'] != null) {
      hops = new List<Hops>();
      json['hops'].forEach((v) {
        hops.add(new Hops.fromJson(v));
      });
    }
    yeast = json['yeast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.malt != null) {
      data['malt'] = this.malt.map((v) => v.toJson()).toList();
    }
    if (this.hops != null) {
      data['hops'] = this.hops.map((v) => v.toJson()).toList();
    }
    data['yeast'] = this.yeast;
    return data;
  }
}

class Malt {
  String name;
  Amount amount;

  Malt({this.name, this.amount});

  Malt.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount =
        json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    return data;
  }
}

class Amount {
  double value;
  String unit;

  Amount({this.value, this.unit});

  Amount.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value'].toString());
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}

class Hops {
  String name;
  Amount amount;
  String add;
  String attribute;

  Hops({this.name, this.amount, this.add, this.attribute});

  Hops.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount =
        json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
    add = json['add'];
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    data['add'] = this.add;
    data['attribute'] = this.attribute;
    return data;
  }
}
