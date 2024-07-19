class ExploreCoupon {
  String status;
  List<Coupon> coupons;

  ExploreCoupon({required this.status, required this.coupons});

  factory ExploreCoupon.fromJson(Map<String, dynamic> json) {
    return ExploreCoupon(
      status: json['status'],
      coupons:
          List<Coupon>.from(json['coupons'].map((x) => Coupon.fromJson(x))),
    );
  }
}

class Coupon {
  int id;
  String title;
  String description;
  int value;
  String valueType;
  int minSaving;
  int maxSaving;
  String validFrom;
  String validTo;
  int isLimited;
  int isAvailableForExpired;
  int hasFavorited;
  int parentCompanyId;
  String parentCompanyName;
  String parentCompanyProfileImg;
  String parentCompanyCoverImg;
  List<CouponPackageData> couponPackagesData;

  Coupon({
    required this.id,
    required this.title,
    required this.description,
    required this.value,
    required this.valueType,
    required this.minSaving,
    required this.maxSaving,
    required this.validFrom,
    required this.validTo,
    required this.isLimited,
    required this.isAvailableForExpired,
    required this.hasFavorited,
    required this.parentCompanyId,
    required this.parentCompanyName,
    required this.parentCompanyProfileImg,
    required this.parentCompanyCoverImg,
    required this.couponPackagesData,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      value: json['value'],
      valueType: json['value_type'],
      minSaving: json['min_saving'],
      maxSaving: json['max_saving'],
      validFrom: json['valid_from'],
      validTo: json['valid_to'],
      isLimited: json['is_limited'],
      isAvailableForExpired: json['is_available_for_expired'],
      hasFavorited: json['hasFavorited'],
      parentCompanyId: json['parent_company_id'],
      parentCompanyName: json['parent_company_name'],
      parentCompanyProfileImg: json['parent_company_profile_img'],
      parentCompanyCoverImg: json['parent_company_cover_img'],
      couponPackagesData: List<CouponPackageData>.from(
          json['coupon_packages_data']
              .map((x) => CouponPackageData.fromJson(x))),
    );
  }
}

class CouponPackageData {
  int id;
  int couponId;
  int packageId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  PackageData packageData;

  CouponPackageData({
    required this.id,
    required this.couponId,
    required this.packageId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.packageData,
  });

  factory CouponPackageData.fromJson(Map<String, dynamic> json) {
    return CouponPackageData(
      id: json['id'],
      couponId: json['coupon_id'],
      packageId: json['package_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      packageData: PackageData.fromJson(json['package_data']),
    );
  }
}

class PackageData {
  int id;
  String name;
  int value;
  String currencyCode;
  int validDuration;
  String description;
  String moreInfo;
  dynamic moreInfoUrl;
  String termsConditions;
  int isActive;
  dynamic zohoItemCode;
  int updatedBy;
  String createdAt;
  String updatedAt;
  String packageColor;
  dynamic zohoItemId;
  int isHidden;
  int isOneTimeUsage;
  int isInstallment;
  dynamic installmentAmount;

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

  factory PackageData.fromJson(Map<String, dynamic> json) {
    return PackageData(
      id: json['id'],
      name: json['name'],
      value: json['value'],
      currencyCode: json['currency_code'],
      validDuration: json['valid_duration'],
      description: json['description'],
      moreInfo: json['more_info'],
      moreInfoUrl: json['more_info_url'],
      termsConditions: json['terms_conditions'],
      isActive: json['is_active'],
      zohoItemCode: json['zoho_item_code'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      packageColor: json['package_color'],
      zohoItemId: json['zoho_item_id'],
      isHidden: json['is_hidden'],
      isOneTimeUsage: json['is_one_time_usage'],
      isInstallment: json['is_installment'],
      installmentAmount: json['installment_amount'],
    );
  }
}
