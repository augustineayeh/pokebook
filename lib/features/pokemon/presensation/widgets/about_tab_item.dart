import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class AboutTabItem extends StatelessWidget {
  const AboutTabItem({
    Key? key,
    required this.param,
    required this.value,
  }) : super(key: key);
  final String param;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff5f5f5),
      // AppColors.lightGrey,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(param),
          const Gap(16),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
