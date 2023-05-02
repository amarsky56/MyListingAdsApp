class AllItemColors {
/*
{
  "name": "Red",
  "colorCode": "DC143C"
}
*/

  String? name;
  String? colorCode;

  AllItemColors({
    this.name,
    this.colorCode,
  });

  AllItemColors.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    colorCode = json['colorCode']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['colorCode'] = colorCode;
    return data;
  }
}

class AllItem {
/*
{
  "name": "Sold1",
  "type": "Listing",
  "image": [
    "Listing"
  ],
  "colors": [
    {
      "name": "Red",
      "colorCode": "DC143C"
    }
  ]
}
*/

  String? name;
  String? type;
  List<String>? image;
  List<AllItemColors>? colors;

  AllItem({
    this.name,
    this.type,
    this.image,
    this.colors,
  });

  AllItem.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    type = json['type']?.toString();
    if (json['image'] != null) {
      final v = json['image'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      image = arr0;
    } else {
      image = <String>[];
    }
    if (json['colors'] != null) {
      final v = json['colors'];
      final arr0 = <AllItemColors>[];
      v.forEach((v) {
        arr0.add(AllItemColors.fromJson(v));
      });
      colors = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    if (image != null) {
      final v = image;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['image'] = arr0;
    }
    if (colors != null) {
      final v = colors;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['colors'] = arr0;
    }
    return data;
  }
}
