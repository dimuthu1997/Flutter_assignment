import 'package:assessment/models/vendor.dart';
import 'package:assessment/services/services/vendor_service.dart';
import 'package:flutter/material.dart';

class VendorProfileScreen extends StatefulWidget {
  final int vendorId;
  final String vendorName;

  const VendorProfileScreen({
    Key? key,
    required this.vendorId,
    required this.vendorName,
  }) : super(key: key);

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen> {
  Vendor? vendor;
  bool isLoading = true;
  String? errorMessage;
  bool isFavorite = false;

  final VendorService _vendorService = VendorService();

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() => isLoading = true);
    try {
      final vendorData = await _vendorService.vendor('4');
      setState(() {
        vendor = Vendor.fromJson(vendorData);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VendorProfileAppBar(
        onClose: () => Navigator.of(context).pop(),
        vendorName: widget.vendorName,
        rating: vendor?.companyData?.rating?.toInt(),
        addressLineOne: vendor?.companyData?.addressLineOne,
        imageUrl: vendor?.companyData?.profileImg ?? "",
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : vendor != null
                  ? VendorProfileBody(
                      vendor: vendor!,
                      isFavorite: isFavorite,
                      onFavoriteToggle: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    )
                  : const Center(child: Text('No vendor data available')),
    );
  }
}

class VendorProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onClose;
  final String vendorName;
  final int? rating;
  final String imageUrl;
  final String? addressLineOne;

  const VendorProfileAppBar({
    Key? key,
    required this.onClose,
    required this.vendorName,
    this.rating,
    required this.imageUrl,
    this.addressLineOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: onClose,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 110.0,
                    height: 110.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 10.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendorName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        addressLineOne ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 45.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.purple,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.7),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          rating?.toString() ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildDefaultTabs(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(300);
}

Widget _buildDefaultTabs() {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: [
        Material(
          child: TabBar(
            physics: const ClampingScrollPhysics(),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.purple,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Coupons'),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Information'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class VendorProfileBody extends StatelessWidget {
  final Vendor vendor;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const VendorProfileBody({
    Key? key,
    required this.vendor,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GridView.builder(
        itemCount: vendor.userSpecificCoupons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) {
          return VendorProfileCard(
            imageUrl: vendor.companyData!.profileImg ?? "",
            name: vendor.companyData!.name ?? "",
            isFavorite: isFavorite,
            onFavoriteToggle: onFavoriteToggle,
            description: vendor.companyData!.description ?? "",
            id: vendor.companyData!.id!.toInt(),
            profileUrl: vendor.companyData!.profileImg ?? "",
          );
        },
      ),
    );
  }
}

class VendorProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isFavorite;
  final String description;
  final int id;
  final String profileUrl;
  final VoidCallback onFavoriteToggle;

  const VendorProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.isFavorite,
    required this.description,
    required this.id,
    required this.profileUrl,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(profileUrl),
                ),
                GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 20.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 12.0),
                children: [
                  const TextSpan(text: "Save "),
                  TextSpan(
                    text: id.toString(),
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: " LKR"),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
