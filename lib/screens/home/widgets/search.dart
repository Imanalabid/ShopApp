import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/Colors.dart';
import '../../../generated/l10n.dart';
import '../pages/home_page.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 315.w,
      child: Padding(
        padding: EdgeInsets.only(
            left: isArabic() ? 20.w : 10.w, right: isArabic() ? 10.w : 10.w),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.Icon1Color,
              size: 28,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.005,
            ),
            Text(
              S.of(context).what_you_want_to_learn,
              style: TextStyle(
                  color: AppColors.smalltextfontColor,
                  fontFamily: 'Manrope',
                  fontSize: 12.sp),
            ),
            SizedBox(
                width: isArabic()
                    ? MediaQuery.of(context).size.width * 0.38.w
                    : MediaQuery.of(context).size.width * 0.33),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
