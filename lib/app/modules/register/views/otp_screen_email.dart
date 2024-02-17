import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

// ignore: must_be_immutable
class OTPScreenEmail extends StatefulWidget {
  final String pass;
  final String name;
  final String username;
  final String otp;
  final String type;
  final String countryDial;
  final String email;
  final String number;
  const OTPScreenEmail(
      {super.key,
      required this.countryDial,
      required this.email,
      required this.otp,
      required this.number,
      required this.type,
      required this.name,
      required this.username,
      required this.pass});

  @override
  State<OTPScreenEmail> createState() => _OTPScreenEmailState();
}

class _OTPScreenEmailState extends State<OTPScreenEmail> {
  final umumC = Get.find<AuthController>();

  final RegisterController controller = Get.put(RegisterController());
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 250,
                child: Image.asset('assets/logo_a.png'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Verifikasi OTP',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Masukkan Kode yang telah dikirim ke Email ${widget.email}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: '3b8382'.toColor(),
                    fontSize: 18),
                controller: otpController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Kode Verifikasi',
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefix: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                  ),
                ),
                maxLength: 5,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Text(
                    'Email anda salah?',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Edit',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: '3b8382'.toColor()),
                  onPressed: () async {
                    if (widget.otp == otpController.text) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Berhasil Verifikasi"),
                              content: Text('Kode benar'),
                            );
                          });
                      umumC.registerPeserta(
                          name: widget.name,
                          username: widget.username,
                          email: widget.email,
                          noHp: widget.countryDial + widget.number,
                          pass: widget.pass,
                          type: widget.type);
                      print(widget.name);
                      print(widget.username);
                      print(widget.email);
                      print(widget.countryDial + widget.number);
                      print(widget.pass);
                      print(widget.type);
                      controller.firstNameController.clear();
                      controller.lastNameController.clear();
                      controller.usernameController.clear();
                      controller.emailController.clear();
                      controller.phoneNumberController.clear();
                      controller.passwordController.clear();
                      controller.rePasswordController.clear();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Gagal Verifikasi"),
                            content: Text('Kode salah'),
                          );
                        },
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      'Verify',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
