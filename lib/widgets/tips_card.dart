import 'package:cozy/models/tips.dart';
import 'package:flutter/material.dart';
import '../theme.dart';



class TipsCard extends StatelessWidget {

  final Tips tips;

  const TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl,
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.name,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Updated on ${tips.updatedOn}',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}