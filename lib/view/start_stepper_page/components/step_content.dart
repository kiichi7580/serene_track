import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/start_stepper_page/provider/start_stepper_page_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

class StepContent extends StatelessWidget {
  const StepContent({
    super.key,
    required this.text,
    required this.urlString,
    required this.index,
  });

  final String text;
  final String urlString;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: linkBlue,
                textStyle: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              child: Text(text),
              onPressed: () async {
                final url = Uri.parse(urlString);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'リンクが開けません: $url';
                }
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final checkedList = ref.watch(startStepperPageProvider
                    .select((value) => value.checkedList));
                return Checkbox(
                  checkColor: backGroundColor,
                  activeColor: linkBlue,
                  value: checkedList[index],
                  onChanged: (value) {
                    ref
                        .read(startStepperPageProvider.notifier)
                        .changeCheckedList(index, value!);
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
