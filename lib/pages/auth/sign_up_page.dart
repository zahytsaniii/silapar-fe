import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silapar/base/custom_loade.dart';
import 'package:silapar/base/show_custom_snackbar.dart';
import 'package:silapar/controllers/auth_controller.dart';
import 'package:silapar/models/signup_body_model.dart';
import 'package:silapar/pages/auth/sign_in_page.dart';
import 'package:silapar/routes/route_helper.dart';
import 'package:silapar/utils/colors.dart';
import 'package:silapar/utils/dimensions.dart';
import 'package:silapar/widgets/app_text_field.dart';
import 'package:silapar/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less then six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    //app logo
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage:
                              AssetImage("assets/image/logo_part1.png"),
                        ),
                      ),
                    ),
                    //email
                    AppTextField(
                        textController: emailController,
                        hintText: "Email",
                        icon: Icons.email),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //password
                    AppTextField(
                      textController: passwordController,
                      hintText: "Password",
                      icon: Icons.password_sharp,
                      isObscure: true,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //name
                    AppTextField(
                        textController: nameController,
                        hintText: "Name",
                        icon: Icons.person),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //phone
                    AppTextField(
                        textController: phoneController,
                        hintText: "Phone",
                        icon: Icons.phone),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //sign up button
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Sign Up",
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //tagline
                    RichText(
                        text: TextSpan(
                            text: "Have an account already?",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font16,
                            ),
                            children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => SignInPage()),
                            text: " Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font16,
                            ),
                          )
                        ])),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    //sign up options
                    RichText(
                        text: TextSpan(
                            text: "Sign up using one of the following methods",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font16,
                            ))),
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: Dimensions.radius30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      "assets/image/" + signUpImages[index]),
                                ),
                              )),
                    )
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
