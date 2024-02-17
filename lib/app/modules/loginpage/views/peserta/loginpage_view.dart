import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/modules/loginpage/views/forget_password.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/select_register.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/loginpage_controller.dart';

class LoginpageView extends GetView<LoginpageController> {
  LoginpageView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        color: blue,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 18.h,
                          child: Image.asset('assets/square-05.png'),
                        ),
                        Text(
                          'AmubaPreneur',
                          style: GoogleFonts.poppins(
                            color: putih,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      color: putih,
                    ),
                    controller: controller.usernameController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                        color: putih,
                      ),
                      hintText: 'Username',
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        color: putih,
                      ),
                      controller: controller.passwordController,
                      autocorrect: false,
                      obscureText: controller.isHidden.value,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          color: putih,
                        ),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isHidden.toggle();
                          },
                          icon: Icon(
                            controller.isHidden.isFalse
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye,
                            color: controller.isHidden.isFalse
                                ? Colors.black87
                                : Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.off(ForgetPasswordView());
                        },
                        child: Text(
                          'Forget Password ?',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.usernameController.text.isEmpty &
                        controller.passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Failed",
                        "Username dan Password harus diisi",
                        colorText: Colors.white,
                        backgroundColor: Colors.red[300],
                        icon: const Icon(Icons.warning, color: Colors.white),
                        snackPosition: SnackPosition.TOP,
                      );
                    } else if (controller.usernameController.text.isEmpty) {
                      Get.snackbar(
                        "Failed",
                        "Username harus diisi",
                        colorText: Colors.white,
                        backgroundColor: Colors.red[300],
                        icon: const Icon(Icons.warning, color: Colors.white),
                        snackPosition: SnackPosition.TOP,
                      );
                    } else if (controller.passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Failed",
                        "Password harus diisi",
                        colorText: Colors.white,
                        backgroundColor: Colors.red[300],
                        icon: const Icon(Icons.warning, color: Colors.white),
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      String username = controller.usernameController.text;
                      String password = controller.passwordController.text;
                      authController.login(username, password);
                      controller.passwordController.clear();
                    }
                  },
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: putih,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Dont have an account?',
                      style: GoogleFonts.montserrat(color: putih),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const SelectRegister());
                      },
                      child: Text(
                        ' Create Account',
                        style: GoogleFonts.montserrat(
                          color: putih,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
