import 'dart:math';
import 'package:flutter/services.dart';
import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/modules/loginpage/views/peserta/loginpage_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/register_controller.dart';

// ignore: must_be_immutable
class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  final String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  bool isEmailValid(String email) {
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        color: blue,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: TextFormField(
                              controller: controller.firstNameController,
                              keyboardType: TextInputType.name,
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp, color: Colors.white),
                              decoration: InputDecoration(
                                labelStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                labelText: 'First Name',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            child: TextFormField(
                              controller: controller.lastNameController,
                              keyboardType: TextInputType.name,
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp, color: Colors.white),
                              decoration: InputDecoration(
                                labelStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                labelText: 'Last Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        controller: controller.usernameController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp, color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          FilteringTextInputFormatter.deny(RegExp(r'[A-Z]')),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp, color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          labelText: 'Alamat Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      IntlPhoneField(
                        controller: controller.phoneNumberController,
                        initialCountryCode: 'ID',
                        initialValue: 'ID',
                        onCountryChanged: (country) {
                          authController.countryDial.value =
                              "+${country.dialCode}";
                        },
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp, color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                        inputFormatters: [
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            if (newValue.text.startsWith('0')) {
                              return oldValue;
                            }
                            return newValue;
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          obscureText: controller.isHidden.value,
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp, color: Colors.white),
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.poppins(color: Colors.white),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.rePasswordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: controller.isHidden1.value,
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp, color: Colors.white),
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.poppins(color: Colors.white),
                            labelText: 'Re-Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isHidden1.toggle();
                              },
                              icon: Icon(
                                controller.isHidden1.isFalse
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye,
                                color: controller.isHidden1.isFalse
                                    ? Colors.black87
                                    : Colors.black12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: pink),
                        onPressed: () async {
                          if (controller.firstNameController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Nama depan harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller
                              .lastNameController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Nama belakang harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller
                              .usernameController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Username harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller.emailController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Email harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller
                              .phoneNumberController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Nomor Telepon harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller
                              .passwordController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Password harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller
                              .rePasswordController.text.isEmpty) {
                            Get.snackbar(
                              "Failed",
                              "Ulangi Password harus diisi",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (controller.passwordController.text !=
                              controller.rePasswordController.text) {
                            Get.snackbar(
                              "Failed",
                              "Password tidak sama",
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else {
                            var nohp = authController.countryDial.value +
                                controller.phoneNumberController.text;
                            var username = controller.usernameController.text;
                            var email = controller.emailController.text;
                            authController.cekAkunPeserta(
                                username, nohp, email);
                          }
                        },
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Register',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Have you already account ? ',
                            style: GoogleFonts.montserrat(color: putih),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginpageView());
                            },
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.montserrat(
                                color: putih,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
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
          ],
        ),
      ),
    );
  }
}

final RegisterController controller = Get.put(RegisterController());

final EmailService emailService =
    EmailService('Permintaan aktivasi akun', controller.emailController.text);
//email service $subject , $ fullname
//jika kirim email reset password subject = Permintaan Ganti Password
//jika saat aktivasi akun subject = Permintaan aktivasi akun
//jika saat penarikan cashback subject = Konfirmasi Penarikan Cashback
String emailStatus = '';
void sendAktivasiEmailPeserta(String email, String kodeOtp) async {
  String recipientEmail = email;
  String otp = kodeOtp;
  try {
    await emailService.sendPasswordResetEmail(recipientEmail, otp);
    emailStatus = 'Email berhasil dikirim';
  } catch (e) {
    emailStatus = 'Gagal mengirim email: $e';
  }
}

String generateOTPPeserta(int length) {
  final Random _random = Random();
  const String _chars = '0123456789';

  String otp = '';
  for (int i = 0; i < length; i++) {
    otp += _chars[_random.nextInt(_chars.length)];
  }
  return otp;
}

class EmailService {
  final String email = 'amuba@sisatap.com';
  final String password = '3HQ%CgLpmTwW';
  final String subject;
  final String fullname;

  EmailService(this.subject, this.fullname);

  Future<void> sendPasswordResetEmail(String recipientEmail, String otp) async {
    final smtpServer = SmtpServer(
      'sisatap.com',
      username: email,
      password: password,
      port: 465,
      ssl: true,
    );

    final message = Message()
      ..from = Address(email, 'Amuba Preneur')
      ..recipients.add(recipientEmail)
      ..subject = subject
      ..html =
          '''
       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="x-apple-disable-message-reformatting" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="color-scheme" content="light dark" />
    <meta name="supported-color-schemes" content="light dark" />
    <title></title>
    <style type="text/css" rel="stylesheet" media="all">
    /* Base ------------------------------ */
    
    @import url("https://fonts.googleapis.com/css?family=Nunito+Sans:400,700&display=swap");
    body {
      width: 100% !important;
      height: 100%;
      margin: 0;
      -webkit-text-size-adjust: none;
    }
    
    a {
      color: #3869D4;
    }
    
    a img {
      border: none;
    }
    
    td {
      word-break: break-word;
    }
    
    .preheader {
      display: none !important;
      visibility: hidden;
      mso-hide: all;
      font-size: 1px;
      line-height: 1px;
      max-height: 0;
      max-width: 0;
      opacity: 0;
      overflow: hidden;
    }
    /* Type ------------------------------ */
    
    body,
    td,
    th {
      font-family: "Montserrat", sans-serif;
    }
    
    h1 {
      margin-top: 0;
      color: #333333;
      font-size: 22px;
      font-weight: bold;
      text-align: left;
    }
    
    h2 {
      margin-top: 0;
      color: #333333;
      font-size: 16px;
      font-weight: bold;
      text-align: left;
    }
    
    h3 {
      margin-top: 0;
      color: #333333;
      font-size: 14px;
      font-weight: bold;
      text-align: left;
    }
    
    td,
    th {
      font-size: 16px;
    }
    
    p,
    ul,
    ol,
    blockquote {
      margin: .4em 0 1.1875em;
      font-size: 16px;
      line-height: 1.625;
    }
    
    p.sub {
      font-size: 13px;
    }
    /* Utilities ------------------------------ */
    
    .align-right {
      text-align: right;
    }
    
    .align-left {
      text-align: left;
    }
    
    .align-center {
      text-align: center;
    }
    
    .u-margin-bottom-none {
      margin-bottom: 0;
    }
    /* Buttons ------------------------------ */
    
    .button {
      background-color: #3869D4;
      border-top: 10px solid #3869D4;
      border-right: 18px solid #3869D4;
      border-bottom: 10px solid #3869D4;
      border-left: 18px solid #3869D4;
      display: inline-block;
      color: #FFF;
      text-decoration: none;
      border-radius: 3px;
      box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);
      -webkit-text-size-adjust: none;
      box-sizing: border-box;
    }
    
    .button--green {
      background-color: #22BC66;
      border-top: 10px solid #22BC66;
      border-right: 18px solid #22BC66;
      border-bottom: 10px solid #22BC66;
      border-left: 18px solid #22BC66;
    }
    
    .button--red {
      background-color: #FF6136;
      border-top: 10px solid #FF6136;
      border-right: 18px solid #FF6136;
      border-bottom: 10px solid #FF6136;
      border-left: 18px solid #FF6136;
    }
    
    @media only screen and (max-width: 500px) {
      .button {
        width: 100% !important;
        text-align: center !important;
      }
    }
    /* Attribute list ------------------------------ */
    
    .attributes {
      margin: 0 0 21px;
    }
    
    .attributes_content {
      background-color: #F4F4F7;
      padding: 16px;
    }
    
    .attributes_item {
      padding: 0;
    }
    /* Related Items ------------------------------ */
    
    .related {
      width: 100%;
      margin: 0;
      padding: 25px 0 0 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .related_item {
      padding: 10px 0;
      color: #CBCCCF;
      font-size: 15px;
      line-height: 18px;
    }
    
    .related_item-title {
      display: block;
      margin: .5em 0 0;
    }
    
    .related_item-thumb {
      display: block;
      padding-bottom: 10px;
    }
    
    .related_heading {
      border-top: 1px solid #CBCCCF;
      text-align: center;
      padding: 25px 0 10px;
    }
    /* Discount Code ------------------------------ */
    
    .discount {
      width: 100%;
      margin: 0;
      padding: 24px;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #F4F4F7;
      border: 2px dashed #CBCCCF;
    }
    
    .discount_heading {
      text-align: center;
    }
    
    .discount_body {
      text-align: center;
      font-size: 15px;
    }
    /* Social Icons ------------------------------ */
    
    .social {
      width: auto;
    }
    
    .social td {
      padding: 0;
      width: auto;
    }
    
    .social_icon {
      height: 20px;
      margin: 0 8px 10px 8px;
      padding: 0;
    }
    /* Data table ------------------------------ */
    
    .purchase {
      width: 100%;
      margin: 0;
      padding: 35px 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .purchase_content {
      width: 100%;
      margin: 0;
      padding: 25px 0 0 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .purchase_item {
      padding: 10px 0;
      color: #51545E;
      font-size: 15px;
      line-height: 18px;
    }
    
    .purchase_heading {
      padding-bottom: 8px;
      border-bottom: 1px solid #EAEAEC;
    }
    
    .purchase_heading p {
      margin: 0;
      color: #85878E;
      font-size: 12px;
    }
    
    .purchase_footer {
      padding-top: 15px;
      border-top: 1px solid #EAEAEC;
    }
    
    .purchase_total {
      margin: 0;
      text-align: right;
      font-weight: bold;
      color: #333333;
    }
    
    .purchase_total--label {
      padding: 0 15px 0 0;
    }
    
    body {
      background-color: #F2F4F6;
      color: #51545E;
    }
    
    p {
      color: #51545E;
    }
    
    .email-wrapper {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #F2F4F6;
    }
    
    .email-content {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    /* Masthead ----------------------- */
    
    .email-masthead {
      padding: 25px 0;
      text-align: center;
    }
    
    .email-masthead_logo {
      width: 94px;
    }
    
    .email-masthead_name {
      font-size: 16px;
      font-weight: bold;
      color: #A8AAAF;
      text-decoration: none;
      text-shadow: 0 1px 0 white;
    }
    /* Body ------------------------------ */
    
    .email-body {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }
    
    .email-body_inner {
      width: 570px;
      margin: 0 auto;
      padding: 0;
      -premailer-width: 570px;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #FFFFFF;
    }
    
    .email-footer {
      width: 570px;
      margin: 0 auto;
      padding: 0;
      -premailer-width: 570px;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      text-align: center;
    }
    
    .email-footer p {
      color: #A8AAAF;
    }
    
    .body-action {
      width: 100%;
      margin: 30px auto;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      text-align: center;
    }
    
    .body-sub {
      margin-top: 25px;
      padding-top: 25px;
      border-top: 1px solid #EAEAEC;
    }
    
    .content-cell {
      padding: 45px;
    }
    /*Media Queries ------------------------------ */
    
    @media only screen and (max-width: 600px) {
      .email-body_inner,
      .email-footer {
        width: 100% !important;
      }
    }
    
    @media (prefers-color-scheme: dark) {
      body,
      .email-body,
      .email-body_inner,
      .email-content,
      .email-wrapper,
      .email-masthead,
      .email-footer {
        background-color: #333333 !important;
        color: #FFF !important;
      }
      p,
      ul,
      ol,
      blockquote,
      h1,
      h2,
      h3,
      span,
      .purchase_item {
        color: #FFF !important;
      }
      .attributes_content,
      .discount {
        background-color: #222 !important;
      }
      .email-masthead_name {
        text-shadow: none !important;
      }
    }
    
    :root {
      color-scheme: light dark;
      supported-color-schemes: light dark;
    }
    </style>
    <!--[if mso]>
    <style type="text/css">
      .f-fallback  {
        font-family: "Montserrat", sans-serif;
      }
    </style>
  <![endif]-->
  </head>
  <body>
    <span class="preheader">Gunakan kode berikut untuk $subject.</span>
    <table class="email-wrapper" width="100%" cellpadding="0" cellspacing="0" role="presentation">
      <tr>
        <td align="center">
          <table class="email-content" width="100%" cellpadding="0" cellspacing="0" role="presentation">
            <tr>
              <td class="email-masthead">
                <a href="https://untuksahabat.com" class="f-fallback email-masthead_name">
                <img src="https://amuba.sisatap.com/storage/images/amuba-preneur.jpeg"
                style="width: 200px; height: auto;"
                >
              </a>
              </td>
            </tr>
            <!-- Email Body -->
            <tr>
              <td class="email-body" width="570" cellpadding="0" cellspacing="0">
                <table class="email-body_inner" align="center" width="570" cellpadding="0" cellspacing="0" role="presentation">
                  <!-- Body content -->
                  <tr>
                    <td class="content-cell">
                      <div class="f-fallback">
                        <h1>Hallo $fullname,</h1>
                        <p>Anda telah melakukan  $subject untuk aplikasi Amuba Preneur. 
                        Gunakan kode verifikasi berikut. <strong></strong></p>
                        <!-- Action -->
                        <table class="body-action" align="center" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                          <tr>
                            <td align="center">
                              <!-- Border based button -->
                              <table width="100%" border="0" cellspacing="0" cellpadding="0" role="presentation">
                                <tr>
                                  <td align="center">
                                   <b> <a href="" class="f-fallback button button--green" target="_blank">$otp</a>
                                   </b>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                        <p>Jika Anda tidak melakukan  $subject abaikan email ini!!!</p>
                        <p>Terimakasih,
                          <br>Amuba Preneur.</p>
                        <!-- Sub copy -->
                        <table class="body-sub" role="presentation">
                          <tr>
                            <td>
                               
                            </td>
                          </tr>
                        </table>
                      </div>
                    </td>
                  </tr
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table class="email-footer" align="center" width="570" cellpadding="0" cellspacing="0" role="presentation">
                  <tr>
                    <td class="content-cell" align="center">
                      <p class="f-fallback sub align-center">
                         <a href="https://untuksahabat.com">amubapreneur.com</a>
                        <br> 
                      </p>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
    ''';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
    } catch (e) {
      print('Error sending email: $e');
      Get.back();
      Get.snackbar(
        'Failed',
        'Kode Otp Gagal Dikirim',
        backgroundColor: Colors.red[300],
        colorText: putih,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
