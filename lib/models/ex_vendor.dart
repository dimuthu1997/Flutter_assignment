class ExploreVendor {
  String status;
  List<ParentCompanyData> parentCompanyData;

  ExploreVendor({
    required this.status,
    required this.parentCompanyData,
  });

  factory ExploreVendor.fromJson(Map<String, dynamic> json) {
    return ExploreVendor(
      status: json['status'],
      parentCompanyData: List<ParentCompanyData>.from(
          json['parentCompanyData'].map((x) => ParentCompanyData.fromJson(x))),
    );
  }
}

class ParentCompanyData {
  int id;
  int parentCompanyId;
  String name;
  String address;
  int? rating;
  String description;
  String profileImg;
  String coverImg;

  ParentCompanyData({
    required this.id,
    required this.parentCompanyId,
    required this.name,
    required this.address,
    this.rating,
    required this.description,
    required this.profileImg,
    required this.coverImg,
  });

  factory ParentCompanyData.fromJson(Map<String, dynamic> json) {
    return ParentCompanyData(
      id: json['id'],
      parentCompanyId: json['parent_company_id'],
      name: json['name'],
      address: json['address'],
      rating: json['rating'],
      description: json['description'],
      profileImg: json['profile_img'],
      coverImg: json['cover_img'],
    );
  }
}
