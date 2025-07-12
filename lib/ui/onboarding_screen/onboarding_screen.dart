import 'package:eventlyyy/ui/authen/login/login_screen.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = 'onboarding_screen';

  OnBoardingScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: '',
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_eventlyyyy.png'),
          SizedBox(height: 30),
          Image.asset('assets/images/hot-trending.png'),
          SizedBox(height: 30),
          Text(
            'Find Events That Inspire You',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryLight,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    ),

    PageViewModel(
      title: '',
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_eventlyyyy.png'),
          SizedBox(height: 20),
          Image.asset('assets/images/being-creative3.png'),
          SizedBox(height: 30),
          Text(
            'Effortless Event Planning',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryLight,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    ),

    PageViewModel(
      title: '',
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_eventlyyyy.png'),
          SizedBox(height: 20),
          Image.asset('assets/images/being-creative.png'),
          SizedBox(height: 30),
          Text(
            'Connect with Friends & Share Moments',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryLight,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      showDoneButton: true,
      showBackButton: true,
      done: Icon(
        Icons.arrow_circle_right_outlined,
        size: 40,
        color: AppColors.primaryLight,
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      back: Icon(
        Icons.arrow_circle_left_outlined,
        size: 40,
        color: AppColors.primaryLight,
      ),
      next: Icon(
        Icons.arrow_circle_right_outlined,
        size: 40,
        color: AppColors.primaryLight,
      ),
      dotsDecorator: DotsDecorator(
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeColor: AppColors.primaryLight,
        color: Colors.grey,
        spacing: const EdgeInsets.symmetric(horizontal: 4),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      globalBackgroundColor: Colors.white,
    );
  }
}
