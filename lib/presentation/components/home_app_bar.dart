import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/presentation/components/text_view.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Pallets.primary),
      // height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          19.verticalSpace,
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/user.png'),
                radius: 25,
              ),
              21.horizontalSpace,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Hello, Victor Abraham',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          // blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  // .verticalSpace,
                  TextView(
                    text: 'abraham.nnu@gmail.com',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          // blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
          46.verticalSpace
        ],
      ),
    );
  }
}
