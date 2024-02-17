import 'dart:math';

import 'package:entrepreneur_app/app/modules/loginpage/controllers/loginpage_controller.dart';
import 'package:entrepreneur_app/app/modules/loginpage/views/peserta/loginpage_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  final LoginpageController loginpageController =
      Get.put(LoginpageController());
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: '0377a8'.toColor(),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.off(LoginpageView());
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 92.h,
          width: 100.w,
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
                  height: 20.h,
                  child: Image.asset('assets/logo_a.png'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Lupa Password',
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
                      'Masukkan Alamat Email Untuk Reset Password',
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
                child: TextFormField(
                  controller: loginpageController.emailResetController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  style:
                      GoogleFonts.poppins(fontSize: 10.sp, color: Colors.white),
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
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Obx(
                  () => TextFormField(
                    controller: loginpageController.passwordResetController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    obscureText: controller.isHidden.value,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(color: Colors.white),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Obx(
                  () => TextFormField(
                    controller: loginpageController.rePasswordResetController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    obscureText: controller.isHidden.value,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(color: Colors.white),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: '3b8382'.toColor()),
                  onPressed: () async {
                    if (loginpageController.passwordController.text !=
                        loginpageController.rePasswordResetController.text) {
                      Get.snackbar(
                        'Failed',
                        'Password yang anda masukkan tidak sama',
                        backgroundColor: Colors.red[300],
                        colorText: putih,
                        snackPosition: SnackPosition.TOP,
                      );
                    } else if (loginpageController
                            .emailResetController.text.isEmpty ||
                        loginpageController
                            .passwordResetController.text.isEmpty) {
                      Get.snackbar(
                        'Failed',
                        'Field yang diperlukan tidak boleh kosong',
                        backgroundColor: Colors.red[300],
                        colorText: putih,
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      String otp = generateOTP(5);
                      print(otp);
                      String email =
                          loginpageController.emailResetController.text;
                      sendPasswordResetEmail(email, otp);
                      Get.defaultDialog(
                          title: 'Loading', middleText: 'Please wait...');
                      Future.delayed(Duration(seconds: 5), () {
                        Get.snackbar(
                          'Success',
                          'Kode Otp Berhasil Dikirim',
                          backgroundColor: pembeda,
                          colorText: putih,
                          snackPosition: SnackPosition.TOP,
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                width: 100.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: pembeda,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Verifikasi OTP',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: putih,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        'Masukkan Kode OTP yang Telah Dikirim',
                                        style: GoogleFonts.poppins(
                                          color: putih,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: TextField(
                                          controller: otpController,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: '3b8382'.toColor(),
                                              fontSize: 18),
                                          decoration: InputDecoration(
                                            hintText: 'Masukkan OTP',
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
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          if (otp == otpController.text) {
                                            loginpageController.changePassword(
                                                loginpageController
                                                    .passwordResetController
                                                    .text,
                                                email);
                                            loginpageController
                                                .emailResetController
                                                .clear();
                                            loginpageController
                                                .passwordResetController
                                                .clear();
                                          } else {
                                            Get.snackbar(
                                              'Success',
                                              'Kode Otp Salah',
                                              backgroundColor: Colors.red[300],
                                              colorText: putih,
                                              snackPosition: SnackPosition.TOP,
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: Text(
                                            'Verifikasi',
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      });
                    }
                  },
                  child: Center(
                    child: Text(
                      'Verify',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generateOTP(int length) {
    final Random _random = Random();
    const String _chars = '0123456789';

    String otp = '';
    for (int i = 0; i < length; i++) {
      otp += _chars[_random.nextInt(_chars.length)];
    }
    return otp;
  }
}

final LoginpageController controller = Get.put(LoginpageController());

final EmailService emailService = EmailService(
    'Permintaan Reset Password', controller.emailResetController.text);
//email service $subject , $ fullname
//jika kirim email reset password subject = Permintaan Ganti Password
//jika saat aktivasi akun subject = Permintaan aktivasi akun
//jika saat penarikan cashback subject = Konfirmasi Penarikan Cashback
String emailStatus = '';
void sendPasswordResetEmail(String email, String kodeOtp) async {
  String recipientEmail = email;
  String otp = kodeOtp;
  try {
    await emailService.sendPasswordResetEmail(recipientEmail, otp);
    emailStatus = 'Email berhasil dikirim';
  } catch (e) {
    emailStatus = 'Gagal mengirim email: $e';
  }
}

String generateOTP(int length) {
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
      ..html = '''
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
                  </tr>
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
    }
  }
}
