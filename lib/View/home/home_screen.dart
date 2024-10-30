import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../CustomWidgets/food_card.dart';
import '../../CustomWidgets/title_text.dart';
import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../Detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _controller = PageController(
    viewportFraction: 0.95,  // 85% width for each page
  );
  int currentIndex = 1;

  List foodItem = [AImages.burger,AImages.cake,AImages.taco,AImages.creamCake];
  List bannerList = [AImages.banner2,AImages.banner3,AImages.banner1,AImages.banner4];
  bool isSelected = true; // Track selection state
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        /// App Bar
        appBar: PreferredSize(preferredSize: Size.fromHeight(height * 0.12),
            child: AppBar(
              ///  Change Drawer icon color
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title:  Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text('Delivery',style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.6))),
                  const Text('Maplewood Suites',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w500)),
                ],
              ),
              backgroundColor: Colors.transparent, // Make AppBar transparent
              flexibleSpace: Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AImages.appBarBackGround), // Local image
                    fit: BoxFit.cover, // Adjust image to cover the background
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    // Toggle the selection state on tap
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15, top: 12),
                    padding: const EdgeInsets.all(3.5),
                    height: 42,
                    width: width * 0.21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AColor.loginContainer,
                      border: Border.all(color: Colors.white.withOpacity(0.8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Walk Icon Container
                        Expanded(
                          child: Container(
                            height: 39,
                            width: width * 0.10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: isSelected
                                  ? AColor.buttonBackGround
                                  : Colors.transparent,
                            ),
                            child: Image.asset('Assets/icons/walk.png'),
                          ),
                        ),

                        // Cycle Icon Container
                        Expanded(
                          child: Container(
                            height: 39,
                            width: width * 0.10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: !isSelected
                                  ? AColor.buttonBackGround
                                  : Colors.transparent,
                            ),
                            child: const Icon(Icons.directions_bike),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        drawer:  Drawer(
          backgroundColor: AColor.buttonBackGround,
        ),

        /// Body
        body: SingleChildScrollView(
          child: Container(
            height: height *1.3,
            width: width,
            decoration: BoxDecoration(
              /// BackGround Image
              image: DecorationImage(image: AssetImage(AImages.backGroundImages),fit: BoxFit.cover),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  /// Search Field
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration:  InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical:height *0.01 ),
                      hintText: 'Your order?',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                      suffixIcon: const Icon(Icons.qr_code_scanner,color: Colors.white),
                      prefixIcon: const Icon(Icons.search,color: Colors.white,size: 32),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  const BorderSide(color: Colors.white,width:0.6)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  const BorderSide(color: Colors.white,width:0.6)
                        )
          
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText(title: 'Categories'),
                      TextButton(onPressed: (){}, child:
                      Text('See all',style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 15))),
          
                    ],
                  ),
          
                  /// Categories Box
                  SizedBox(
                    height: height * 0.09,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: foodItem.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: height * 0.09,
                            width: width *0.20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AColor.loginContainer,
                                border: Border.all(color: Colors.white.withOpacity(0.5),width: 1.3),
                                image:  DecorationImage(image: AssetImage(foodItem[index]))
                            ),
                          );
          
                        },),
                  ),
                   SizedBox(height: height * 0.01),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width *0.03),
                    child:  Row(
                      children: [
                        const TitleText(title: 'Burgers'),
                        SizedBox(width: width * 0.07),
                        const TitleText(title: 'Dessert'),
                        SizedBox(width: width * 0.08),
                        const TitleText(title: 'Mexican'),
                        SizedBox(width: width * 0.08),
                        const TitleText(title: 'Sushi'),
                      ],
                    ),
                  ),
          
                  SizedBox(height: height * 0.02),
          
                  SizedBox(
                    height: height * 0.22,
                    child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),  // Right margin for spacing
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06,
                            vertical: height * 0.02,
                          ),
                          height: height * 0.23,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.5),width: 1.3),
                            borderRadius: BorderRadius.circular(12),
                            // color: AColor.loginContainer,
                            image: DecorationImage(image: AssetImage(bannerList[index].toString()),fit: BoxFit.cover)
                          ),
                          /// Special Widgets
                          // child: const StackPractice(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: SmoothPageIndicator(
                      effect: const WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                        dotWidth: 8,
                        dotHeight: 8,
                        radius: 10
                      ),controller: _controller, count: 4),
                  ),
                  SizedBox(height: height * 0.02),
               const Text('Fastest near you',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.white)),
          
                  SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder:(context, index) {
                  return  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailScreen()));
                      },
                      child: const FoodCard());
            
                }, ),
          )

                ],
              ),
            ),
          ),
        )

      ),
    );
  }
}

class StackPractice extends StatelessWidget {
  const StackPractice({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned(
          top: 0,
          child: Text('30% OFF',
            style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: width * 0.32,
            child: ElevatedButton(
              onPressed: () {},style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff262965),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Order Now',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          right: -25,
          child: Image.asset(AImages.pasta),
        ),
        Positioned(
          top: height * 0.05,
          left: 0,
          child: Text(
            'Discover discounts in your\nfavorite local restaurants',
            style: TextStyle(fontSize: 16,color: Colors.white.withOpacity(0.6)),
          ),
        ),
      ],
    );
  }
}



