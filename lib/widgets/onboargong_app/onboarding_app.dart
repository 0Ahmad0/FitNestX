import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import 'circle_progress_bar.dart';
import 'inroduction.dart';

/// A IntroScreen Class.
const gradientCircle = [
  Color(0xff92A3FD),
  Color(0xff9DCEFF),
  Color(0xff92A3FD),
];

class IntroScreenOnboarding extends StatefulWidget {
  final List<Introduction>? introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;
  final Function()? onTapSkipButton;
  IntroScreenOnboarding({
    Key? key,
    this.introductionList,
    this.onTapSkipButton,
    this.backgroudColor,
    this.foregroundColor,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  }) : super(key: key);

  @override
  _IntroScreenOnboardingState createState() => _IntroScreenOnboardingState();
}

class _IntroScreenOnboardingState extends State<IntroScreenOnboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            height: 550.0,
            child: PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: widget.introductionList!,
            ),
          ),
        ),
        //                Row(
        //                  mainAxisAlignment: MainAxisAlignment.center,
        //                  children: _buildPageIndicator(),
        //                ),
        Padding(
          padding: EdgeInsets.all(20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _customProgress(),
            ],
          ),
        ),
      ],
    );
  }

//  Widget _buildNextButton() {
//    return (_currentPage != widget.introductionList.length - 1
//        ? Expanded(
//      child: Align(
//        alignment: FractionalOffset.bottomRight,
//        child: FlatButton(
//          onPressed: () {
//            _pageController.nextPage(
//              duration: Duration(milliseconds: 500),
//              curve: Curves.ease,
//            );
//          },
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
////                    Text(
////                      'Next',
////                      style: TextStyle(
////                        color: Colors.black,
////                        fontSize: 22.0,
////                      ),
////                    ),
//            ],
//          ),
//        ),
//      ),
//    )
//        : Expanded(
//      child: Align(
//        alignment: FractionalOffset.bottomRight,
//        child: FlatButton(
//          onPressed: () {
//            print('Start');
//          },
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
////                    Text(
////                      'Start',
////                      style: TextStyle(
////                        color: Colors.black,
////                        fontSize: 22.0,
////                      ),
////                    ),
//            ],
//          ),
//        ),
//      ),
//    ));
//  }

//  Widget _indicator(bool isActive) {
//    return AnimatedContainer(
//      duration: Duration(milliseconds: 150),
//      margin: EdgeInsets.symmetric(horizontal: 8.0),
//      height: 8.0,
//      width: isActive ? 24 : 16,
//      decoration: BoxDecoration(
//        color: isActive ? Color(0xFF7B51D3) : Colors.grey,
//        borderRadius: BorderRadius.all(Radius.circular(10)),
//      ),
//    );
//  }

//  List<Widget> _buildPageIndicator() {
//    List<Widget> list = [];
//    for (int i = 0; i < widget.introductionList.length; i++) {
//      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
//    }
//    return list;
//  }

  Widget _customProgress() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          child: CircleProgressBar(
            backgroundColor: Colors.white,
            gradientColors: gradientCircle,
            value: ((_currentPage + 1) * 1.0 / widget.introductionList!.length),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: AppColors.brand)),
          child: IconButton(
            onPressed: () {
              _currentPage != widget.introductionList!.length - 1
                  ? _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    )
                  : widget.onTapSkipButton!();
            },
            icon: Icon(
              (_currentPage != widget.introductionList!.length - 1)
                  ? Icons.arrow_forward_ios
                  : Icons.check,
              color: Colors.white,
            ),
            iconSize: 15,
          ),
        )
      ],
    );
  }
}
