import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../BottomNavigation/bottom_navigation_menu.dart';
import '../SignUp/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = true;
  bool isLoading = false;

  void _login() async {
    setState(() {
      isLoading = true; // Start loading animation
    });

    // Simulate loading for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false; // Stop loading animation
    });

    // Navigate to Home Screen (replace 'HomeScreen' with your screen widget)
    Get.offAll(() => const BottomNavigationMenu());
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            /// BackGround Image
            image: DecorationImage(image: AssetImage(AImages.backGroundImages),fit: BoxFit.cover),
          ),

          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: height * 0.12),
              child: Column(
                children: [
                  /// Login Logo
                  Image.asset(AImages.loginLogo,scale: 0.8),
                  SizedBox(height: height * 0.02),
                  const Text('Deliver Favourite Food',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25)),
                  SizedBox(height: height * 0.03),

                  /// Login Container
                  Container(
                    padding: EdgeInsets.only(left: width * 0.05,top: height *0.03,right: width *0.05),
                    height: height * 0.5,
                    width: width *0.82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AColor.loginContainer,
                    ),
                    child:  Column(
                      children: [
                        const Text('Login',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.white),),
                        SizedBox(height: height * 0.03),
                        /// email field
                      TextFormField(
                        // controller: controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,color: Colors.white.withOpacity(0.6)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          filled: true,
                          fillColor: AColor.loginContainer,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.2,color: Colors.white),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.2,color: Colors.white),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ),
                        SizedBox(height: height * 0.03),

                        /// Password field
                        TextFormField(
                          obscureText: isVisible,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                                icon: isVisible
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    : const Icon(Icons.visibility,
                                        color: Colors.white, size: 20)),
                            prefixIcon: Icon(Icons.lock,color: Colors.white.withOpacity(0.6)),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                            filled: true,
                            fillColor: AColor.loginContainer,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1.2,color: Colors.white),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1.2,color: Colors.white),
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){}, child: const Text('Forget Password?',style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                            decoration: BoxDecoration(
                                color: AColor.buttonBackGround,
                                borderRadius: BorderRadius.circular(25)
                            ),// Container ka background color purple
                            /// Login button's `onLongPress` for saving email to SharedPreferences
                            child: SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: isLoading ? null : _login,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AColor.buttonBackGround,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                ),
                                child: isLoading
                                    ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      strokeWidth: 2,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Loading...",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                )
                                    : const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ),
                            )),
                        SizedBox(height: height * 0.01),
                        Text('Or',style: TextStyle(color: Colors.red.withOpacity(0.8))),

                         /// Social LogIn
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             CircleAvatar(radius: 20,backgroundImage: AssetImage(AImages.google)),
                             SizedBox(width: width *0.05),
                             CircleAvatar(radius: 20,backgroundImage: AssetImage(AImages.faceBook)),
                           ],
                         ),
                      ],
                    ),
                  ),
                  SizedBox(height: height *0.02),

                  const Text("Don't have Account?",style: TextStyle(color: Colors.white,fontSize: 17),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                  }, child:const Text('REGISTER',style: TextStyle(color: Colors.white,fontSize: 17),),
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}

