import 'package:flutter/material.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/view/account_page/components/account_text_field.dart';
import 'package:serene_track/view/account_page/components/edit_account_button.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});
  static String get routeName => 'edit_account';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(title: 'アカウントを編集'),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: const BoxDecoration(
            color: backGroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 64,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              AccountTextField(
                caption: userName,
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                maxLength: 50,
                // this.validator,
                // this.onSaved,
              ),
              const SizedBox(height: 4),
              AccountTextField(
                caption: shortGorlTx,
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                maxLength: 100,
                // this.validator,
                // this.onSaved,
              ),
              const SizedBox(height: 4),
              AccountTextField(
                caption: longGorlTx,
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                maxLength: 100,
                // this.validator,
                // this.onSaved,
              ),
              const SizedBox(height: 16),
              EditAccountButton(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
