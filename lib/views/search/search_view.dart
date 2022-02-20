import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'search_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (BuildContext context, SearchViewModel viewModel, Widget _) {
        return Scaffold(
          body: _buildBody,
        );
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }

  Widget get _buildBody => Column(
        children: [
          SizedBox(height: 60.h),
          _buildSearchBarAndFilterButton,
          SizedBox(height: 20.h),
          _buildFilters,
          SizedBox(height: 20.h),
          _buildResultCountAndSortButton,
          SizedBox(height: 20.h),
          _buildListView,
        ],
      );

  Widget get _buildListView => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) => _buildAdvertisementItem(index),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: 10,
          ),
        ),
      );

  Widget _buildAdvertisementItem(index) => Container(
        margin: const EdgeInsets.all(2),
        height: 410.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF9FBFF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 1,
              spreadRadius: 0,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage,
            SizedBox(height: 20.h),
            _buildPriceAndIcon,
            SizedBox(height: 10.h),
            _buildAddress,
            SizedBox(height: 10.h),
            _buildLocation,
            SizedBox(height: 10.h),
            _buildFirstPrice,
            SizedBox(height: 10.h),
            _buildMetresAndNumbersOfRooms,
          ],
        ),
      );

  Widget get _buildImage => Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "assets/images/jpeg/room_image.png",
              width: 335.w,
              height: 230.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 10.w,
            top: 10.h,
            child: SvgPicture.asset(
              "assets/icons/svg/favorite_2.svg",
              width: 20.w,
              height: 20.h,
            ),
          )
        ],
      );

  Widget get _buildPriceAndIcon => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "15.000 TL / Aylık",
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF484848),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4.w),
            SvgPicture.asset(
              "assets/icons/svg/approved.svg",
              width: 16.w,
              height: 15.h,
            )
          ],
        ),
      );

  Widget get _buildAddress => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          "Bostanlı Mah. Karşıyaka, İzmir",
          style: TextStyle(
            fontSize: 17.sp,
            color: const Color(0xFF484848),
          ),
        ),
      );

  Widget get _buildLocation => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          "Site İçinde Dubleks Daire",
          style: TextStyle(
            fontSize: 15.sp,
            color: const Color(0xFF484848),
          ),
        ),
      );

  Widget get _buildFirstPrice => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          "İlk kiralama bedeli:  30.000 TL",
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF484848),
          ),
        ),
      );

  Widget get _buildMetresAndNumbersOfRooms => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "280m² Net",
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF484848),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 80.w),
            Text(
              "3+1 | 2 Banyo",
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF484848),
              ),
            ),
          ],
        ),
      );

  Widget get _buildResultCountAndSortButton => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildResultCount,
            _buildSortButton,
          ],
        ),
      );

  Widget get _buildSortButton => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "İlanları Sırala",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF908E8E),
            ),
          ),
          SizedBox(width: 10.w),
          SvgPicture.asset(
            "assets/icons/svg/sort_icon.svg",
            width: 10.w,
            height: 7.h,
            color: const Color(0xFF908E8E),
          )
        ],
      );

  Widget get _buildResultCount => Text(
        "14 SONUÇ",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF908E8E),
        ),
      );

  Widget get _buildFilters => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: 20.h,
        child: ListView.separated(
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) => _buildItem(index),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          itemCount: 10,
        ),
      );

  Widget _buildItem(index) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF006AFF),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 2.w,
          top: 2.h,
          bottom: 2.h,
        ),
        child: Row(
          children: [
            Text(
              "Site İçinde",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 16,
              alignment: Alignment.center,
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                "X",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF006AFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _buildTff => SizedBox(
        width: 276.w,
        height: 40.h,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                "assets/icons/svg/feather-search.svg",
                width: 10.w,
                height: 10.h,
                color: const Color(0xFF006AFF),
              ),
            ),
            labelText: "Nerede ev arıyorsun?",
            labelStyle: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF908E8E),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
          ),
        ),
      );

  Widget get _buildSearchBarAndFilterButton => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTff,
            _buildFilterButton,
          ],
        ),
      );

  Widget get _buildFilterButton => Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFEDE8E9),
            )),
        child: SvgPicture.asset(
          "assets/icons/svg/filter_icon.svg",
          width: 20.w,
          height: 16.h,
        ),
      );
}
