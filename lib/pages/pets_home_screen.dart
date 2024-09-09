import 'package:flutter/material.dart';
import 'package:pet_app/models/cats_models.dart';
import 'package:pet_app/pages/pets_detail_page.dart';
import 'package:pet_app/services/telegram_chanel.dart';
import 'package:pet_app/styles/colors.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selectedCategory = 0;

  int selectedIndex = 0;

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat,
    Icons.person_2_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Местоположение",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "Бишкек, ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "KG",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 50,
                      width: 50,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 20),
              headerPart(size),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Row(
                  children: [
                    Text(
                      "Категории:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              categoryItems(size),
              SizedBox(height: size.height / 35),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Завести питомца:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    cats.length,
                    (index) {
                      final cat = cats[index];
                      return petsItems(size, cat);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ...List.generate(
              icons.length,
              (index) => GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 50,
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          Icon(
                            icons[index],
                            size: 30,
                            color: selectedIndex == index
                                ? Colors.blue
                                : Colors.black.withOpacity(0.6),
                          ),
                          const SizedBox(height: 5),
                          selectedIndex == index
                              ? Container(
                                  height: 5,
                                  width: 5,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                )
                              : Container(),
                        ],
                      ),
                      index == 2
                          ? Positioned(
                              right: 0,
                              top: -10,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: buttonColor,
                                ),
                                child: const Text(
                                  "4",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding petsItems(Size size, Cat cat) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PetsDetailPage(
                cat: cat,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.55,
            color: cat.color.withOpacity(0.5),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -10,
                  width: 100,
                  height: 100,
                  child: Transform.rotate(
                    angle: 12,
                    child: Image.network(
                      "https://clipart-library.com/images/rTnrpap6c.png",
                      color: cat.color,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: -25,
                  width: 90,
                  height: 90,
                  child: Transform.rotate(
                    angle: -12,
                    child: Image.network(
                      "https://clipart-library.com/images/rTnrpap6c.png",
                      color: cat.color,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 10,
                  child: Hero(
                    tag: cat.image,
                    child: Image.asset(
                      cat.image,
                      height: size.height * 0.23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cat.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                                Text(
                                  "${cat.distance} (km)",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          cat.fav
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: cat.fav
                              ? Colors.red
                              : Colors.black.withOpacity(0.06),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding categoryItems(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(height: size.height / 11),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12.withOpacity(0.05),
              ),
              child: const Icon(Icons.tune_rounded),
            ),
            ...List.generate(
              categories.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                    selectedCategory = index;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selectedCategory == index
                            ? buttonColor
                            : Colors.black12.withOpacity(0.03)),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: 16,
                          color: selectedCategory == index
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container headerPart(Size size) {
    return Container(
      height: 140,
      width: size.width / 1.2,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 49, 180, 240).withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 30,
            width: 50,
            height: 50,
            child: Transform.rotate(
              angle: 12,
              child: Image.network(
                "https://clipart-library.com/images/rTnrpap6c.png",
                color: pawColor2,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 15,
            width: 50,
            height: 50,
            child: Transform.rotate(
              angle: -12,
              child: Image.network(
                "https://clipart-library.com/images/rTnrpap6c.png",
                color: pawColor2,
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: 120,
            width: 110,
            height: 110,
            child: Transform.rotate(
              angle: -16,
              child: Image.network(
                "https://clipart-library.com/images/rTnrpap6c.png",
                color: pawColor2,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/pets-image/cat1.png",
              height: 120,
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Присоединяйтесь \n к нашему сообществу",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Любителей животных",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height / 100,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: TextButton(
                      onPressed: launcherTelegramChanel,
                      child: Text(
                        "Присоединиться",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
