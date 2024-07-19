class Vendor {
  Vendor({
    required this.status,
    required this.companyData,
    required this.subscribedPackage,
    required this.slashedCoupons,
    required this.userSpecificCoupons,
  });

  final String? status;
  final CompanyData? companyData;
  final dynamic subscribedPackage;
  final List<dynamic> slashedCoupons;
  final List<Coupon> userSpecificCoupons;

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      status: json["status"],
      companyData: json["companyData"] == null
          ? null
          : CompanyData.fromJson(json["companyData"]),
      subscribedPackage: json["subscribedPackage"],
      slashedCoupons: json["slashedCoupons"] == null
          ? []
          : List<dynamic>.from(json["slashedCoupons"]!.map((x) => x)),
      userSpecificCoupons: json["userSpecificCoupons"] == null
          ? []
          : List<Coupon>.from(
              json["userSpecificCoupons"]!.map((x) => Coupon.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "companyData": companyData?.toJson(),
        "subscribedPackage": subscribedPackage,
        "slashedCoupons": slashedCoupons.map((x) => x).toList(),
        "userSpecificCoupons":
            userSpecificCoupons.map((x) => x.toJson()).toList(),
      };
}

class CompanyData {
  CompanyData({
    required this.id,
    required this.name,
    required this.subName,
    required this.description,
    required this.addressLineOne,
    required this.city,
    required this.district,
    required this.province,
    required this.country,
    required this.postalCode,
    required this.website,
    required this.menuLink,
    required this.hotlineNumber,
    required this.phoneNumberOne,
    required this.phoneNumberTwo,
    required this.isActive,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.facebook,
    required this.instagram,
    required this.vendorContactEmail,
    required this.tags,
    required this.termsConditions,
    required this.siteUrl,
    required this.profileImg,
    required this.coverImg,
    required this.menuImg,
    required this.rating,
    required this.bannerImg,
    required this.company,
    required this.parentComCategoryData,
    required this.cityData,
    required this.districtData,
    required this.provinceData,
    required this.countryData,
    required this.socialLinks,
    required this.coupons,
    required this.media,
  });

  final int? id;
  final String? name;
  final String? subName;
  final String? description;
  final String? addressLineOne;
  final num? city;
  final num? district;
  final num? province;
  final num? country;
  final num? postalCode;
  final String? website;
  final dynamic menuLink;
  final String? hotlineNumber;
  final dynamic phoneNumberOne;
  final dynamic phoneNumberTwo;
  final num? isActive;
  final num? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? facebook;
  final dynamic instagram;
  final String? vendorContactEmail;
  final String? tags;
  final dynamic termsConditions;
  final String? siteUrl;
  final String? profileImg;
  final String? coverImg;
  final List<Img> menuImg;
  final int? rating;
  final List<Img> bannerImg;
  final List<Company> company;
  final List<ParentComCategoryDatum> parentComCategoryData;
  final CityData? cityData;
  final Data? districtData;
  final Data? provinceData;
  final CountryData? countryData;
  final dynamic socialLinks;
  final List<Coupon> coupons;
  final List<Media> media;

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      id: json["id"],
      name: json["name"],
      subName: json["sub_name"],
      description: json["description"],
      addressLineOne: json["address_line_one"],
      city: json["city"],
      district: json["district"],
      province: json["province"],
      country: json["country"],
      postalCode: json["postal_code"],
      website: json["website"],
      menuLink: json["menu_link"],
      hotlineNumber: json["hotline_number"],
      phoneNumberOne: json["phone_number_one"],
      phoneNumberTwo: json["phone_number_two"],
      isActive: json["is_active"],
      updatedBy: json["updated_by"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      facebook: json["facebook"],
      instagram: json["instagram"],
      vendorContactEmail: json["vendor_contact_email"],
      tags: json["tags"],
      termsConditions: json["terms_conditions"],
      siteUrl: json["site_url"],
      profileImg: json["profile_img"],
      coverImg: json["cover_img"],
      menuImg: json["menu_img"] == null
          ? []
          : List<Img>.from(json["menu_img"]!.map((x) => Img.fromJson(x))),
      rating: json["rating"],
      bannerImg: json["banner_img"] == null
          ? []
          : List<Img>.from(json["banner_img"]!.map((x) => Img.fromJson(x))),
      company: json["company"] == null
          ? []
          : List<Company>.from(
              json["company"]!.map((x) => Company.fromJson(x))),
      parentComCategoryData: json["parent_com_category_data"] == null
          ? []
          : List<ParentComCategoryDatum>.from(json["parent_com_category_data"]!
              .map((x) => ParentComCategoryDatum.fromJson(x))),
      cityData: json["city_data"] == null
          ? null
          : CityData.fromJson(json["city_data"]),
      districtData: json["district_data"] == null
          ? null
          : Data.fromJson(json["district_data"]),
      provinceData: json["province_data"] == null
          ? null
          : Data.fromJson(json["province_data"]),
      countryData: json["country_data"] == null
          ? null
          : CountryData.fromJson(json["country_data"]),
      socialLinks: json["social_links"],
      coupons: json["coupons"] == null
          ? []
          : List<Coupon>.from(json["coupons"]!.map((x) => Coupon.fromJson(x))),
      media: json["media"] == null
          ? []
          : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_name": subName,
        "description": description,
        "address_line_one": addressLineOne,
        "city": city,
        "district": district,
        "province": province,
        "country": country,
        "postal_code": postalCode,
        "website": website,
        "menu_link": menuLink,
        "hotline_number": hotlineNumber,
        "phone_number_one": phoneNumberOne,
        "phone_number_two": phoneNumberTwo,
        "is_active": isActive,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "facebook": facebook,
        "instagram": instagram,
        "vendor_contact_email": vendorContactEmail,
        "tags": tags,
        "terms_conditions": termsConditions,
        "site_url": siteUrl,
        "profile_img": profileImg,
        "cover_img": coverImg,
        "menu_img": menuImg.map((x) => x.toJson()).toList(),
        "rating": rating,
        "banner_img": bannerImg.map((x) => x.toJson()).toList(),
        "company": company.map((x) => x.toJson()).toList(),
        "parent_com_category_data":
            parentComCategoryData.map((x) => x.toJson()).toList(),
        "city_data": cityData?.toJson(),
        "district_data": districtData?.toJson(),
        "province_data": provinceData?.toJson(),
        "country_data": countryData?.toJson(),
        "social_links": socialLinks,
        "coupons": coupons.map((x) => x.toJson()).toList(),
        "media": media.map((x) => x.toJson()).toList(),
      };
}

class Img {
  Img({
    required this.id,
    required this.value,
  });

  final int? id;
  final String? value;

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      id: json["id"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}

class CityData {
  CityData({
    required this.id,
    required this.districtId,
    required this.nameEn,
    required this.nameSi,
    required this.nameTa,
    required this.subNameEn,
    required this.subNameSi,
    required this.subNameTa,
    required this.postcode,
    required this.latitude,
    required this.longitude,
    required this.isActive,
  });

  final int? id;
  final int? districtId;
  final String? nameEn;
  final String? nameSi;
  final dynamic nameTa;
  final dynamic subNameEn;
  final dynamic subNameSi;
  final dynamic subNameTa;
  final String? postcode;
  final num? latitude;
  final num? longitude;
  final num? isActive;

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      id: json["id"],
      districtId: json["district_id"],
      nameEn: json["name_en"],
      nameSi: json["name_si"],
      nameTa: json["name_ta"],
      subNameEn: json["sub_name_en"],
      subNameSi: json["sub_name_si"],
      subNameTa: json["sub_name_ta"],
      postcode: json["postcode"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      isActive: json["is_active"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "name_en": nameEn,
        "name_si": nameSi,
        "name_ta": nameTa,
        "sub_name_en": subNameEn,
        "sub_name_si": subNameSi,
        "sub_name_ta": subNameTa,
        "postcode": postcode,
        "latitude": latitude,
        "longitude": longitude,
        "is_active": isActive,
      };
}

class Company {
  Company({
    required this.id,
    required this.parentCompanyId,
    required this.name,
    required this.subName,
    required this.description,
    required this.addressLineOne,
    required this.city,
    required this.district,
    required this.province,
    required this.country,
    required this.postalCode,
    required this.website,
    required this.menuLink,
    required this.hotlineNumber,
    required this.phoneNumberOne,
    required this.phoneNumberTwo,
    required this.locationLat,
    required this.locationLng,
    required this.code,
    required this.isActive,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImg,
    required this.coverImg,
    required this.media,
  });

  final int? id;
  final int? parentCompanyId;
  final String? name;
  final dynamic subName;
  final String? description;
  final String? addressLineOne;
  final num? city;
  final num? district;
  final num? province;
  final num? country;
  final num? postalCode;
  final String? website;
  final dynamic menuLink;
  final String? hotlineNumber;
  final dynamic phoneNumberOne;
  final dynamic phoneNumberTwo;
  final num? locationLat;
  final num? locationLng;
  final String? code;
  final num? isActive;
  final num? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? profileImg;
  final String? coverImg;
  final List<Media> media;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"],
      parentCompanyId: json["parent_company_id"],
      name: json["name"],
      subName: json["sub_name"],
      description: json["description"],
      addressLineOne: json["address_line_one"],
      city: json["city"],
      district: json["district"],
      province: json["province"],
      country: json["country"],
      postalCode: json["postal_code"],
      website: json["website"],
      menuLink: json["menu_link"],
      hotlineNumber: json["hotline_number"],
      phoneNumberOne: json["phone_number_one"],
      phoneNumberTwo: json["phone_number_two"],
      locationLat: json["location_lat"],
      locationLng: json["location_lng"],
      code: json["code"],
      isActive: json["is_active"],
      updatedBy: json["updated_by"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      profileImg: json["profile_img"],
      coverImg: json["cover_img"],
      media: json["media"] == null
          ? []
          : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_company_id": parentCompanyId,
        "name": name,
        "sub_name": subName,
        "description": description,
        "address_line_one": addressLineOne,
        "city": city,
        "district": district,
        "province": province,
        "country": country,
        "postal_code": postalCode,
        "website": website,
        "menu_link": menuLink,
        "hotline_number": hotlineNumber,
        "phone_number_one": phoneNumberOne,
        "phone_number_two": phoneNumberTwo,
        "location_lat": locationLat,
        "location_lng": locationLng,
        "code": code,
        "is_active": isActive,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_img": profileImg,
        "cover_img": coverImg,
        "media": media.map((x) => x.toJson()).toList(),
      };
}

class Media {
  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? modelType;
  final int? modelId;
  final String? collectionName;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? disk;
  final num? size;
  final List<dynamic> manipulations;
  final List<dynamic> customProperties;
  final List<dynamic> responsiveImages;
  final num? orderColumn;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json["id"],
      modelType: json["model_type"],
      modelId: json["model_id"],
      collectionName: json["collection_name"],
      name: json["name"],
      fileName: json["file_name"],
      mimeType: json["mime_type"],
      disk: json["disk"],
      size: json["size"],
      manipulations: json["manipulations"] == null
          ? []
          : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
      customProperties: json["custom_properties"] == null
          ? []
          : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
      responsiveImages: json["responsive_images"] == null
          ? []
          : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
      orderColumn: json["order_column"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": manipulations.map((x) => x).toList(),
        "custom_properties": customProperties.map((x) => x).toList(),
        "responsive_images": responsiveImages.map((x) => x).toList(),
        "order_column": orderColumn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class CountryData {
  CountryData({
    required this.id,
    required this.iso,
    required this.name,
    required this.nicename,
    required this.iso3,
    required this.numcode,
    required this.phonecode,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? iso;
  final String? name;
  final String? nicename;
  final String? iso3;
  final num? numcode;
  final num? phonecode;
  final num? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      id: json["id"],
      iso: json["iso"],
      name: json["name"],
      nicename: json["nicename"],
      iso3: json["iso3"],
      numcode: json["numcode"],
      phonecode: json["phonecode"],
      isActive: json["is_active"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso": iso,
        "name": name,
        "nicename": nicename,
        "iso3": iso3,
        "numcode": numcode,
        "phonecode": phonecode,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Coupon {
  Coupon({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.parentCompanyId,
    required this.value,
    required this.valueType,
    required this.systemMaxSlash,
    required this.customerMaxSlash,
    required this.minSaving,
    required this.maxSaving,
    required this.validFrom,
    required this.validTo,
    required this.moreInfo,
    required this.termsConditions,
    required this.isActive,
    required this.isSpecialCoupon,
    required this.createdAt,
    required this.updatedAt,
    required this.isLimited,
    required this.couponTags,
    required this.isUser,
    required this.isForEveryone,
    required this.isAvailableForExpired,
    required this.hasFavorited,
    required this.thumbnail,
    required this.couponPackagesData,
    required this.media,
    required this.couponCompanyData,
  });

  final int? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final int? parentCompanyId;
  final num? value;
  final String? valueType;
  final num? systemMaxSlash;
  final num? customerMaxSlash;
  final num? minSaving;
  final num? maxSaving;
  final DateTime? validFrom;
  final DateTime? validTo;
  final dynamic moreInfo;
  final dynamic termsConditions;
  final num? isActive;
  final num? isSpecialCoupon;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? isLimited;
  final String? couponTags;
  final num? isUser;
  final num? isForEveryone;
  final num? isAvailableForExpired;
  final num? hasFavorited;
  final String? thumbnail;
  final List<CouponPackagesDatum> couponPackagesData;
  final List<dynamic> media;
  final List<CouponCompanyDatum> couponCompanyData;

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      description: json["description"],
      parentCompanyId: json["parent_company_id"],
      value: json["value"],
      valueType: json["value_type"],
      systemMaxSlash: json["system_max_slash"],
      customerMaxSlash: json["customer_max_slash"],
      minSaving: json["min_saving"],
      maxSaving: json["max_saving"],
      validFrom: DateTime.tryParse(json["valid_from"] ?? ""),
      validTo: DateTime.tryParse(json["valid_to"] ?? ""),
      moreInfo: json["more_info"],
      termsConditions: json["terms_conditions"],
      isActive: json["is_active"],
      isSpecialCoupon: json["is_special_coupon"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      isLimited: json["is_limited"],
      couponTags: json["coupon_tags"],
      isUser: json["is_user"],
      isForEveryone: json["is_for_everyone"],
      isAvailableForExpired: json["is_available_for_expired"],
      hasFavorited: json["hasFavorited"],
      thumbnail: json["thumbnail"],
      couponPackagesData: json["coupon_packages_data"] == null
          ? []
          : List<CouponPackagesDatum>.from(json["coupon_packages_data"]!
              .map((x) => CouponPackagesDatum.fromJson(x))),
      media: json["media"] == null
          ? []
          : List<dynamic>.from(json["media"]!.map((x) => x)),
      couponCompanyData: json["coupon_company_data"] == null
          ? []
          : List<CouponCompanyDatum>.from(json["coupon_company_data"]!
              .map((x) => CouponCompanyDatum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "parent_company_id": parentCompanyId,
        "value": value,
        "value_type": valueType,
        "system_max_slash": systemMaxSlash,
        "customer_max_slash": customerMaxSlash,
        "min_saving": minSaving,
        "max_saving": maxSaving,
        "valid_from": validFrom?.toIso8601String(),
        "valid_to": validTo?.toIso8601String(),
        "more_info": moreInfo,
        "terms_conditions": termsConditions,
        "is_active": isActive,
        "is_special_coupon": isSpecialCoupon,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_limited": isLimited,
        "coupon_tags": couponTags,
        "is_user": isUser,
        "is_for_everyone": isForEveryone,
        "is_available_for_expired": isAvailableForExpired,
        "hasFavorited": hasFavorited,
        "thumbnail": thumbnail,
        "coupon_packages_data":
            couponPackagesData.map((x) => x.toJson()).toList(),
        "media": media.map((x) => x).toList(),
        "coupon_company_data":
            couponCompanyData.map((x) => x.toJson()).toList(),
      };
}

class CouponCompanyDatum {
  CouponCompanyDatum({
    required this.id,
    required this.couponId,
    required this.companyId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.companyData,
  });

  final int? id;
  final int? couponId;
  final int? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final Company? companyData;

  factory CouponCompanyDatum.fromJson(Map<String, dynamic> json) {
    return CouponCompanyDatum(
      id: json["id"],
      couponId: json["coupon_id"],
      companyId: json["company_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      companyData: json["company_data"] == null
          ? null
          : Company.fromJson(json["company_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "coupon_id": couponId,
        "company_id": companyId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "company_data": companyData?.toJson(),
      };
}

class CouponPackagesDatum {
  CouponPackagesDatum({
    required this.id,
    required this.couponId,
    required this.packageId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.packageData,
  });

  final int? id;
  final int? couponId;
  final int? packageId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final PackageData? packageData;

  factory CouponPackagesDatum.fromJson(Map<String, dynamic> json) {
    return CouponPackagesDatum(
      id: json["id"],
      couponId: json["coupon_id"],
      packageId: json["package_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      packageData: json["package_data"] == null
          ? null
          : PackageData.fromJson(json["package_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "coupon_id": couponId,
        "package_id": packageId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "package_data": packageData?.toJson(),
      };
}

class PackageData {
  PackageData({
    required this.id,
    required this.name,
    required this.value,
    required this.currencyCode,
    required this.validDuration,
    required this.description,
    required this.moreInfo,
    required this.moreInfoUrl,
    required this.termsConditions,
    required this.isActive,
    required this.zohoItemCode,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.packageColor,
    required this.zohoItemId,
    required this.isHidden,
    required this.isOneTimeUsage,
    required this.isInstallment,
    required this.installmentAmount,
  });

  final int? id;
  final String? name;
  final num? value;
  final String? currencyCode;
  final int? validDuration;
  final String? description;
  final String? moreInfo;
  final String? moreInfoUrl;
  final String? termsConditions;
  final num? isActive;
  final dynamic zohoItemCode;
  final num? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? packageColor;
  final String? zohoItemId;
  final int? isHidden;
  final num? isOneTimeUsage;
  final num? isInstallment;
  final num? installmentAmount;

  factory PackageData.fromJson(Map<String, dynamic> json) {
    return PackageData(
      id: json["id"],
      name: json["name"],
      value: json["value"],
      currencyCode: json["currency_code"],
      validDuration: json["valid_duration"],
      description: json["description"],
      moreInfo: json["more_info"],
      moreInfoUrl: json["more_info_url"],
      termsConditions: json["terms_conditions"],
      isActive: json["is_active"],
      zohoItemCode: json["zoho_item_code"],
      updatedBy: json["updated_by"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      packageColor: json["package_color"],
      zohoItemId: json["zoho_item_id"],
      isHidden: json["is_hidden"],
      isOneTimeUsage: json["is_one_time_usage"],
      isInstallment: json["is_installment"],
      installmentAmount: json["installment_amount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "currency_code": currencyCode,
        "valid_duration": validDuration,
        "description": description,
        "more_info": moreInfo,
        "more_info_url": moreInfoUrl,
        "terms_conditions": termsConditions,
        "is_active": isActive,
        "zoho_item_code": zohoItemCode,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "package_color": packageColor,
        "zoho_item_id": zohoItemId,
        "is_hidden": isHidden,
        "is_one_time_usage": isOneTimeUsage,
        "is_installment": isInstallment,
        "installment_amount": installmentAmount,
      };
}

class Data {
  Data({
    required this.id,
    required this.provinceId,
    required this.nameEn,
    required this.nameSi,
    required this.nameTa,
    required this.isActive,
  });

  final int? id;
  final int? provinceId;
  final String? nameEn;
  final String? nameSi;
  final String? nameTa;
  final num? isActive;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      provinceId: json["province_id"],
      nameEn: json["name_en"],
      nameSi: json["name_si"],
      nameTa: json["name_ta"],
      isActive: json["is_active"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name_en": nameEn,
        "name_si": nameSi,
        "name_ta": nameTa,
        "is_active": isActive,
      };
}

class ParentComCategoryDatum {
  ParentComCategoryDatum({
    required this.id,
    required this.parentCompanyId,
    required this.categoryId,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryData,
  });

  final int? id;
  final int? parentCompanyId;
  final int? categoryId;
  final dynamic createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CategoryData? categoryData;

  factory ParentComCategoryDatum.fromJson(Map<String, dynamic> json) {
    return ParentComCategoryDatum(
      id: json["id"],
      parentCompanyId: json["parent_company_id"],
      categoryId: json["category_id"],
      createdBy: json["created_by"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      categoryData: json["category_data"] == null
          ? null
          : CategoryData.fromJson(json["category_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_company_id": parentCompanyId,
        "category_id": categoryId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category_data": categoryData?.toJson(),
      };
}

class CategoryData {
  CategoryData({
    required this.id,
    required this.index,
    required this.name,
    required this.description,
    required this.isActive,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.icon,
    required this.background,
    required this.media,
  });

  final int? id;
  final num? index;
  final String? name;
  final dynamic description;
  final num? isActive;
  final dynamic updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? icon;
  final String? background;
  final List<Media> media;

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json["id"],
      index: json["index"],
      name: json["name"],
      description: json["description"],
      isActive: json["is_active"],
      updatedBy: json["updated_by"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      icon: json["icon"],
      background: json["background"],
      media: json["media"] == null
          ? []
          : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "name": name,
        "description": description,
        "is_active": isActive,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "icon": icon,
        "background": background,
        "media": media.map((x) => x.toJson()).toList(),
      };
}
