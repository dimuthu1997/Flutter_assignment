import 'package:assessment/models/ex_coupon.dart';
import 'package:assessment/models/ex_vendor.dart';
import 'package:assessment/screens/vendor_profile_screen.dart';
import 'package:assessment/services/services/ex_coupon_service.dart';
import 'package:assessment/services/services/ex_vendor_service.dart';
import 'package:assessment/utils/constants/assets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ExploreCoupon? exploreCoupon;
  ExploreVendor? exploreVendor;
  bool isLoading = true;
  String? errorMessage;
  bool isFavorite = false;

  final ExVendorService _exVendorService = ExVendorService();
  final ExCouponService _exCouponService = ExCouponService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() => isLoading = true);
    try {
      final vendorData = await _exVendorService.exVendor('4');
      final couponData = await _exCouponService.exCoupon('4');

      setState(() {
        exploreVendor = ExploreVendor.fromJson(vendorData);
        exploreCoupon = ExploreCoupon.fromJson(couponData);
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            _buildTabBar(),
            const SizedBox(height: 30.0),
            _buildDefaultTabBar(),
            const SizedBox(height: 30.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent(exploreCoupon?.coupons, buildCouponGrid,
                      'No coupons available'),
                  _buildTabContent(exploreVendor?.parentCompanyData,
                      buildVendorGrid, 'No vendors available'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: _buildLeadingIcon(),
      title: const Text(
        "Food and Drinks",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Image.asset(
            AppAssets.pageInfoImage,
            width: 24.0,
            height: 24.0,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildLeadingIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: TabBar(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2.0,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          labelPadding:
              const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          dividerColor: Colors.transparent,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.confirmation_number,
                    size: 20.0,
                  ),
                  SizedBox(width: 5),
                  Text('Coupons'),
                ],
              ),
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.work,
                    size: 20.0,
                  ),
                  SizedBox(width: 5),
                  Text('Vendors'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultTabBar() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 0.0,
              ),
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
                      child: Text('All'),
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
                      child: Text('Burgers'),
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
                      child: Text('Japanese'),
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

  Widget _buildTabContent<T>(
      List<T>? data, Widget Function() buildGrid, String emptyMessage) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (data != null && data.isNotEmpty) {
      return buildGrid();
    } else {
      return Center(child: Text(emptyMessage));
    }
  }

  Widget buildCouponGrid() {
    return GridView.builder(
      itemCount: exploreCoupon!.coupons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        final coupon = exploreCoupon!.coupons[index];
        return _buildGridItem(
          title: coupon.parentCompanyName,
          description: coupon.description,
          imageUrl: coupon.parentCompanyCoverImg,
          profileUrl: coupon.parentCompanyProfileImg,
          id: coupon.id,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VendorProfileScreen(
                  vendorId: coupon.id,
                  vendorName: coupon.title,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildVendorGrid() {
    return GridView.builder(
      itemCount: exploreVendor!.parentCompanyData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        final vendor = exploreVendor!.parentCompanyData[index];
        return _buildGridItem(
          title: vendor.name,
          description: vendor.description,
          imageUrl: vendor.coverImg,
          profileUrl: vendor.profileImg,
          id: vendor.id,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VendorProfileScreen(
                  vendorId: vendor.id,
                  vendorName: vendor.name,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGridItem({
    required String title,
    required String description,
    required int id,
    required String imageUrl,
    required String profileUrl,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGridHeader(id, imageUrl, profileUrl),
              const SizedBox(height: 20.0),
              Text(
                title,
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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                  children: [
                    const TextSpan(
                      text: "Save ",
                    ),
                    TextSpan(
                      text: "$id",
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: " LKR",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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
      ),
    );
  }

  Widget _buildGridHeader(int id, String imageUrl, String profileUrl) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(profileUrl),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          right: 10.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
