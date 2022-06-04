import 'package:flutter/material.dart';
import 'package:kliniku/components/screens/model/onboarding_model.dart';
import 'package:kliniku/pages/Auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentidx = 0;
  late PageController _pageController;

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

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 241, 195, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(192, 241, 195, 1),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () async {
                await _storeOnBoardInfo();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => Authpage())));
              },
              child: Text(
                "Skip",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(113, 99, 99, 1)),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
            itemCount: page.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentidx = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(page[index].image),
                  Text(
                    page[index].title,
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    page[index].subtitle,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arimo',
                        color: Color.fromRGBO(90, 88, 88, 1),
                        letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 10,
                    child: ListView.builder(
                      itemCount: page.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              width: currentidx == index ? 25 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(23, 152, 75, 1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (index == page.length - 1) {
                        await _storeOnBoardInfo();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Authpage()));
                      }
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceIn);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(23, 152, 75, 1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentidx == page.length - 1 ? "MULAI" : "NEXT",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
