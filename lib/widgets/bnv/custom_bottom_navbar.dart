import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const CustomBottomNavigationBar({
    Key key,
    this.onTap,
    this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xFF006AFF),
      selectedFontSize: 13.sp,
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 13.sp,
      unselectedItemColor: const Color(0xFF484848),
      onTap: (index) {
        onTap(index);
      },
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Arama",
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/svg/search.svg",
              width: 30.w,
              height: 30.h,
              color: currentIndex == 0
                  ? const Color(0xFF006AFF)
                  : const Color(0xFF484848),
            ),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Favoriler",
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/svg/favorite.svg",
              width: 30.w,
              height: 30.h,
              color: currentIndex == 1
                  ? const Color(0xFF006AFF)
                  : const Color(0xFF484848),
            ),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Başvurular",
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/svg/wp.svg",
              width: 30.w,
              height: 30.h,
              color: currentIndex == 2
                  ? const Color(0xFF006AFF)
                  : const Color(0xFF484848),
            ),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Chat",
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/svg/chat.svg",
              width: 30.w,
              height: 30.h,
              color: currentIndex == 3
                  ? const Color(0xFF006AFF)
                  : const Color(0xFF484848),
            ),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Profil",
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/svg/profile.svg",
              width: 30.w,
              height: 30.h,
              color: currentIndex == 4
                  ? const Color(0xFF006AFF)
                  : const Color(0xFF484848),
            ),
          ),
        ),
      ],
    );
  }
}
