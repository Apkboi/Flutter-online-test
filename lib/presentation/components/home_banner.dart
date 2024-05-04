import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/presentation/components/text_view.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Pallets.bannerBorder,
          padding: EdgeInsets.all(3),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              decoration: const BoxDecoration(color: Pallets.bannerBg),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 24),
              child: Row(
                children: [
                  Image.asset(
                    'assets/trophy.png',
                    width: 53,
                    height: 40,
                  ),
                  27.horizontalSpace,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Go Pro (No Ads)',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Pallets.bannerTextColor,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            const Shadow(
                              // blurRadius: 10.0,
                              color: Colors.white,
                              offset: Offset(0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      // .verticalSpace,
                      TextView(
                        text: 'No fuss, no ads, for only \$1 a \nmonth',
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Pallets.bannerTextColor,
                          fontWeight: FontWeight.w400,
                          // fontStyle: FontStyle.italic,
                          shadows: [
                            const Shadow(
                              // blurRadius: 10.0,
                              color: Colors.white,
                              offset: Offset(0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 23,
          top: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Pallets.bannerTextColor,
            ),
            height: 70,
            width: 60,
            child: const Center(
              child: TextView(
                text: '\$1',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Pallets.orange,
              ),
            ),
          ),
        )
      ],
    );
  }
}
