import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import 'percentage_indicator.dart';

class StatTabItem extends StatelessWidget {
  const StatTabItem({
    Key? key,
    required this.param,
    required this.value,
  }) : super(key: key);
  final String param;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 48,
      color: const Color(0xfff5f5f5),
      // AppColors.lightGrey,
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(param)),
          Expanded(
            flex: 3,
            child: CustomPercentageIndicator(
              value: value,
            ),
          ),
          const Gap(24),
          Expanded(
            child: Text(
              '$value',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
