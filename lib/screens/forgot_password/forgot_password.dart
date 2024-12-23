import 'package:flutter/material.dart';
import '../../utilities/constants.dart';
import 'forget_password_btn_widget.dart';
import 'forgot_password_phone.dart';
import 'forget_password_mail.dart';

class ForgetPasswordScreen{
    static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          builder: (context) => Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tForgetPasswordTitle, style:  Theme.of(context).textTheme.displayMedium,),
                Text(tForgetPasswordSubTitle, style:  Theme.of(context).textTheme.bodyMedium,),
                const SizedBox(height: 30),
                ForgetPasswordBtnWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordMail()),
                    );
                  },
                  btnIcon: Icons.email,
                  title:tEmail,
                  subTitle: tRestViaEMail,
                ),
                const SizedBox(height: 20),
                
                ForgetPasswordBtnWidget(
                  btnIcon: Icons.phone_rounded,
                  title:tPhoneNo,
                  subTitle: tRestViaPhone,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPhone()),
                    );
                  },
                ),
                ],
              ),
          ),
        );
  }
}