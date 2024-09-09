import 'package:flutter/material.dart';
import 'package:pet_app/models/onboard_models.dart';
import 'package:pet_app/styles/colors.dart';

import 'pets_home_screen.dart';

class PetsOnBoardiingScreen extends StatefulWidget {
  const PetsOnBoardiingScreen({super.key});

  @override
  State<PetsOnBoardiingScreen> createState() => _PetsOnBoardiingScreenState();
}

class _PetsOnBoardiingScreenState extends State<PetsOnBoardiingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.7,
              color: Colors.white,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: OnBoardData.length,
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  return onBoardingItems(size, index);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                if (currentPage == OnBoardData.length - 1) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PetsHomeScreen(),
                      ),
                      (route) => false);
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
              },
              child: Container(
                height: 70,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    currentPage == OnBoardData.length - 1
                        ? "Начать"
                        : "Далее",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  OnBoardData.length,
                  (index) => indicatorForSlider(index: index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget indicatorForSlider({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 20 : 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentPage == index ? Colors.orange : black.withOpacity(0.2),
      ),
    );
  }

  Column onBoardingItems(Size size, int index) {
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 240,
                    width: size.width * 0.9,
                    color: orangeContainer,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: -40,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -11,
                            child: Image.network(
                              "https://clipart-library.com/images/rTnrpap6c.png",
                              color: pawColor1,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -20,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -12,
                            child: Image.network(
                              "https://clipart-library.com/images/rTnrpap6c.png",
                              color: pawColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 60,
                child: Image.asset(
                  OnBoardData[index].image,
                  height: 320,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
            children: [
              TextSpan(text: "Найди здесь "),
              TextSpan(
                text: "Питомца\n",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(text: "Своей мечты"),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Text(
            OnBoardData[index].text,
            style: const TextStyle(
              fontSize: 15.5,
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
