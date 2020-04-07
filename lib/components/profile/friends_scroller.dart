import 'package:flutter/material.dart';
import 'package:project_fomo/components/profile/profile_card.dart';
import 'package:project_fomo/pages/friends_list_page.dart';
import 'package:project_fomo/style.dart';

class FriendsScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: AppFontSize.size22,
                    fontFamily: AppFontFamily.family,
                    fontWeight: AppFontWeight.bold,
                    color: AppTextColor.title,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FriendsListPage.pageRoute);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      "View All",
                      style: TextStyle(
                        color: AppTextColor.mediumEmphasis,
                        fontSize: AppFontSize.size14,
                        fontFamily: AppFontFamily.family,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: AppFontSize.size14,
                        color: AppTextColor.mediumEmphasis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => SizedBox(
              width: 15.0,
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 110,
              child: ProfileCard(),
            ),
          ),
        ),
        SizedBox(height: 10),
        Divider(color: Colors.grey),
      ],
    );
  }
}
