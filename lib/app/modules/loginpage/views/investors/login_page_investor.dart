// import 'package:entrepreneur_app/app/controller/auth_controller.dart';
// import 'package:entrepreneur_app/app/modules/register/views/investors/register_investors.dart';
// import 'package:entrepreneur_app/app/shared/theme.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../controllers/loginpage_controller.dart';

// class LoginpageInvestors extends GetView<LoginpageController> {
//   LoginpageInvestors({Key? key}) : super(key: key);
//   final authController = Get.find<AuthController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: primerColor,
//         child: Stack(
//           children: [
//             Stack(
//               children: [
//                 Positioned(
//                   top: -180,
//                   left: -50,
//                   right: 0,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 1.2,
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(1000),
//                       color: mainColor,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: -250,
//                   right: -150,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(1000),
//                       color: subPrimerColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Login Account',
//                                 style: GoogleFonts.josefinSans(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 'Mari Kembangkan Usaha Kita',
//                                 style: GoogleFonts.josefinSans(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.04,
//                       ),
//                       SizedBox(
//                           height: 200, child: Image.asset('assets/Login.png')),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'AMUBA',
//                             style: GoogleFonts.josefinSans(
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             'KARIR',
//                             style: GoogleFonts.josefinSans(
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold,
//                               color: mainColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.08,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: TextFormField(
//                           controller: controller.usernameController,
//                           autocorrect: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Username',
//                           ),
//                         ),
//                       ),
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: TextFormField(
//                             controller: controller.passwordController,
//                             autocorrect: false,
//                             obscureText: controller.isHidden.value,
//                             decoration: InputDecoration(
//                               hintText: 'Password',
//                               suffixIcon: IconButton(
//                                 onPressed: () {
//                                   controller.isHidden.toggle();
//                                 },
//                                 icon: Icon(
//                                   controller.isHidden.isFalse
//                                       ? Icons.remove_red_eye
//                                       : Icons.remove_red_eye,
//                                   color: controller.isHidden.isFalse
//                                       ? Colors.black87
//                                       : Colors.black12,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Text(
//                               'Forget Password ?',
//                               style: GoogleFonts.montserrat(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: mainColor),
//                         onPressed: () {
//                           if (controller.usernameController.text.isEmpty &
//                               controller.passwordController.text.isEmpty) {
//                             Get.snackbar(
//                               "Failed",
//                               "Username dan Password harus diisi",
//                               colorText: Colors.white,
//                               backgroundColor: Colors.red[300],
//                               icon: const Icon(Icons.warning,
//                                   color: Colors.white),
//                               snackPosition: SnackPosition.TOP,
//                             );
//                           } else if (controller
//                               .usernameController.text.isEmpty) {
//                             Get.snackbar(
//                               "Failed",
//                               "Username harus diisi",
//                               colorText: Colors.white,
//                               backgroundColor: Colors.red[300],
//                               icon: const Icon(Icons.warning,
//                                   color: Colors.white),
//                               snackPosition: SnackPosition.TOP,
//                             );
//                           } else if (controller
//                               .passwordController.text.isEmpty) {
//                             Get.snackbar(
//                               "Failed",
//                               "Password harus diisi",
//                               colorText: Colors.white,
//                               backgroundColor: Colors.red[300],
//                               icon: const Icon(Icons.warning,
//                                   color: Colors.white),
//                               snackPosition: SnackPosition.TOP,
//                             );
//                           } else {
//                             String username =
//                                 controller.usernameController.text;
//                             String password =
//                                 controller.passwordController.text;
//                             authController.logininvestor(username, password);
//                             controller.passwordController.clear();
//                           }
//                         },
//                         child: SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width,
//                           child: Center(
//                             child: Text(
//                               'Login',
//                               style: GoogleFonts.montserrat(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             'Not register yet ? ',
//                             style: GoogleFonts.montserrat(),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Get.to(RegisterInvestors());
//                             },
//                             child: Text(
//                               'Create Account',
//                               style: GoogleFonts.montserrat(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
