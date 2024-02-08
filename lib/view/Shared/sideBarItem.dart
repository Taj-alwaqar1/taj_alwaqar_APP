// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 

class SideBarItem extends StatelessWidget {
  String itemTitle;
  String itemIcon;
  SideBarItem({super.key, required this.itemTitle, required this.itemIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Row(
        children: [
          ImageIcon(
            AssetImage(itemIcon),
            color: goldenColor,
            size: 30,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            itemTitle,
            style: TextStyle(color: yallowTextColor, fontSize: 28),
          ),
        ],
      ),
    );
  }
}
