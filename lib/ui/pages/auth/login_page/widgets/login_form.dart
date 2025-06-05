import 'package:flutter/material.dart';
import 'package:flutter_blog/data/gvm/session_gvm.dart';
import 'package:flutter_blog/ui/widgets/custom_auth_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../../_core/constants/size.dart' show mediumGap, largeGap;
import '../login_fm.dart';

class LoginForm extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoginFM fm = ref.read(loginProvider.notifier);
    LoginModel model = ref.watch(loginProvider);

    Logger().d(model);

    return Form(child: Column(
      children: [
        CustomAuthTextFormField(
          title: "Username",
          errorText: model.usernameError,
          onChanged: (value) {
            fm.username(value);
          },
        ),
        const SizedBox(height: mediumGap),
        CustomAuthTextFormField(
          title: "Password",
          errorText: model.passwordError,
          onChanged: (value) {
            fm.password(value);
          },
          obscureText: true,
        ),
        const SizedBox(height: largeGap),
        CustomElevatedButton(
          text: "로그인",
          click: () {
            ref.read(sessionProvider.notifier).login(model.username, model.password);
            //Navigator.popAndPushNamed(context, "/post/list");
          },
        ),
        CustomTextButton(
          text: "회원가입 페이지로 이동",
          click: () {
            Navigator.pushNamed(context, "/join");
          },
        ),
      ],
    ));
  }
}