
///
class LastSaveModel {
/*
{
  "mlsListingId": "r2750022",
  "title": "",
  "subtitle": "sunday 2pm",
  "hideprice": true,
  "listingPhoto": "1234567890_listing_21ee2449-cbaf-426a-99cb-f6870eb1d3d0_logotest.png",
  "address": "",
  "features": "",
  "price": "",
  "useSimpleForm": false
}
*/

  String? mlsListingId;
  String? title;
  String? subtitle;
  bool? hideprice;
  String? listingPhoto;
  String? address;
  String? features;
  String? price;
  bool? useSimpleForm;

  LastSaveModel({
    this.mlsListingId,
    this.title,
    this.subtitle,
    this.hideprice,
    this.listingPhoto,
    this.address,
    this.features,
    this.price,
    this.useSimpleForm,
  });
  LastSaveModel.fromJson(Map<String, dynamic> json) {
    mlsListingId = json['mlsListingId']?.toString();
    title = json['title']?.toString();
    subtitle = json['subtitle']?.toString();
    hideprice = json['hideprice'];
    listingPhoto = json['listingPhoto']?.toString();
    address = json['address']?.toString();
    features = json['features']?.toString();
    price = json['price']?.toString();
    useSimpleForm = json['useSimpleForm'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mlsListingId'] = mlsListingId;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['hideprice'] = hideprice;
    data['listingPhoto'] = listingPhoto;
    data['address'] = address;
    data['features'] = features;
    data['price'] = price;
    data['useSimpleForm'] = useSimpleForm;
    return data;
  }
}
