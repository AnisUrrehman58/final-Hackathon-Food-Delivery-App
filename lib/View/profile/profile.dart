import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/divider.dart';
import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
          children: [
        Container(
          height: height * 1.2,
          width: width,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AImages.backGroundImages),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 30),
                  child: const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person,size: 35,),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 30),
                          child: const Text(
                            "Anis",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 30),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: const Text(
                        "anis069@gmail.com",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Orders",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const DividerWidgets(),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.article,
                color: Colors.white,
              ),
              title: Text(
                "My Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerWidgets(),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.location_on_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Delivery Address",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerWidgets(),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.payment_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Payment Methods",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerWidgets(),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.local_offer,
                color: Colors.white,
              ),
              title: Text(
                "Promo Cord",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerWidgets(),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Notifications ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerWidgets(),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              title: Text(
                "About",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerWidgets(),
            const SizedBox(height: 20),

            SizedBox(
              height: height * 0.05,
                width: width * 0.75,
                child: ElevatedButton(onPressed: (){
                  Get.offAll(() => const LoginScreen());
                },style: ElevatedButton.styleFrom(
                        backgroundColor: AColor.buttonBackGround,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),child:
                const Text('Log Out',style: TextStyle(
                    fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20))))
          ],
        ),
      ]),
    );
  }
}

