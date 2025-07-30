import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UXResearchBrief extends StatelessWidget {
  const UXResearchBrief({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;

    bool isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UX Research Brief',
          style: TextStyle(fontSize: 20.sp),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: isTablet
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildCards(isTablet),
        )
            : SingleChildScrollView(
          child: Column(
            children: _buildCards(isTablet),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(bool isTablet) {
    List<Map<String, String>> cardData = [
      {
        'title': 'About the client',
        'content': 'FF Fitness Forever\nFitness Gym, Est. 2020\nUnique membership model\n\nMission: "Get people making working out fun!"'
      },
      {
        'title': 'About the project',
        'content': 'Background: A new expansion plan in San Francisco...\n\nThe problem: low progress tracking.\n\nMethod: Qualitative + survey.'
      },
      {
        'title': 'Goals',
        'content': 'Identify new user problems.\nDefine success metrics.\nEncourage more signups.\n\nOutput: Research report.'
      },
      {
        'title': 'Target audience',
        'content': 'Female users aged 25–34\nLive near SF\nGo to gym 3+ times/week.'
      },
      {
        'title': 'Timeline & budget',
        'content': 'Timeline:\n✔️ Kickoff\n✔️ Interviews\n✔️ Analysis\n🕒 Report pending\n\nBudget: TBC'
      },
    ];

    return cardData
        .map(
          (data) => Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title']!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  data['content']!,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .toList();
  }
}
