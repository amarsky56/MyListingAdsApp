class ProfileMoldel {
/*
{
  "phone": "string",
  "name": "string",
  "address": "string",
  "city": "string",
  "stateProvince": "string",
  "postalCode": "string",
  "profilePicture": "string",
  "logo": "string",
  "email": "string",
  "website": "string",
  "companyName": "string",
  "brokerageName": "string",
  "profilePictureWithPath": "string",
  "logoWithPath": "string"
}
*/

  String? phone;
  String? name;
  String? address;
  String? city;
  String? stateProvince;
  String? postalCode;
  String? profilePicture;
  String? logo;
  String? email;
  String? website;
  String? companyName;
  String? brokerageName;
  String? profilePictureWithPath;
  String? logoWithPath;

  ProfileMoldel({
    this.phone,
    this.name,
    this.address,
    this.city,
    this.stateProvince,
    this.postalCode,
    this.profilePicture,
    this.logo,
    this.email,
    this.website,
    this.companyName,
    this.brokerageName,
    this.profilePictureWithPath,
    this.logoWithPath,
  });

  ProfileMoldel.fromJson(Map<String, dynamic> json) {
    phone = json['phone']?.toString();
    name = json['name']?.toString();
    address = json['address']?.toString();
    city = json['city']?.toString();
    stateProvince = json['stateProvince']?.toString();
    postalCode = json['postalCode']?.toString();
    profilePicture = json['profilePicture']?.toString();
    logo = json['logo']?.toString();
    email = json['email']?.toString();
    website = json['website']?.toString();
    companyName = json['companyName']?.toString();
    brokerageName = json['brokerageName']?.toString();
    profilePictureWithPath = json['profilePictureWithPath']?.toString();
    logoWithPath = json['logoWithPath']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['stateProvince'] = stateProvince;
    data['postalCode'] = postalCode;
    data['profilePicture'] = profilePicture;
    data['logo'] = logo;
    data['email'] = email;
    data['website'] = website;
    data['companyName'] = companyName;
    data['brokerageName'] = brokerageName;
    data['profilePictureWithPath'] = profilePictureWithPath;
    data['logoWithPath'] = logoWithPath;
    return data;
  }
}
