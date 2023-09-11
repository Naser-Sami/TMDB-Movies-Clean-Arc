import 'package:clean_architecture_structure/config/routes/routes.dart';
import 'package:clean_architecture_structure/core/constants/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/config.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  bool _lastPage = false;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });

                    _lastPage = (index == 2);

                    // if (_pageIndex == 2) {
                    //   Navigator.pushReplacementNamed(
                    //       context, Routes.entryPoint);
                    // }
                  },
                  itemCount: demoOnBoardingData.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                    image: demoOnBoardingData[index].image,
                    title: demoOnBoardingData[index].title,
                    description: demoOnBoardingData[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demoOnBoardingData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                        onTap: () => setState(() {
                          _pageController.jumpToPage(_pageIndex);
                        }),
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );

                      if (_lastPage) {
                        Navigator.pushReplacementNamed(
                            context, Routes.entryPoint);
                      }
                    },
                    child: _lastPage ? const Text("Done") : const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    required this.onTap,
    super.key,
  });

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is LoadedThemeState) {
          return GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: isActive ? 12.0 : 4.0,
              width: 4.0,
              decoration: BoxDecoration(
                color: state.isDarkMode
                    ? isActive
                        ? DTColors.secondary
                        : DTColors.secondary.withOpacity(0.40)
                    : isActive
                        ? LTColors.backgroundColor2
                        : LTColors.backgroundColor2.withOpacity(0.40),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class OnBoarding {
  final String image, title, description;
  const OnBoarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoarding> demoOnBoardingData = [
  const OnBoarding(
    image: 'assets/images/dart_course.png',
    title: 'title 1',
    description: 'description 1',
  ),
  const OnBoarding(
    image: 'assets/images/header_image.png',
    title: 'title 2',
    description: 'description 2',
  ),
  const OnBoarding(
    image: 'assets/images/ui.png',
    title: 'title 3',
    description: 'description 3',
  ),
];

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
