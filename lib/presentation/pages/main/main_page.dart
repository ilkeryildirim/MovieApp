import 'package:flutter/material.dart';
import 'package:flutter_base_app/core/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          _pages[_currentIndex],
          // Custom Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF090909), // #090909 arka plan
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 16.h), // Yukarıda 13, aşağıda 16
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Home button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Container(
                          width: 125.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Arka plan yok
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: _currentIndex == 0 
                                  ? Colors.white // Seçili: full beyaz border
                                  : Colors.white.withOpacity(0.2), // Seçili değil: %20 opak
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.all(8.w), // İkon ile border arası boşluk
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Anasayfa',
                                style: TextStyle(
                                  fontFamily: AppAssets.euclidFontFamily,
                                  color: Colors.white, // Her zaman beyaz
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      // Profile button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Container(
                          width: 125.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Arka plan yok
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: _currentIndex == 1 
                                  ? Colors.white // Seçili: full beyaz border
                                  : Colors.white.withOpacity(0.2), // Seçili değil: %20 opak
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.all(8.w), // İkon ile border arası boşluk
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Profil',
                                style: TextStyle(
                                  fontFamily: AppAssets.euclidFontFamily,
                                  color: Colors.white, // Her zaman beyaz
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 