import '../models/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';

// ignore: must_be_immutable
class FavoriteItemWidget extends StatelessWidget {
  FavoriteItemWidget(
    this.favoriteItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FavoriteItemModel favoriteItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        height: 100.v,
        width: 360.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(              
              alignment: Alignment.center,
              child: Container(
                height: 79.v,
                width: 344.h,
                decoration: BoxDecoration(
                  color: appTheme.gray100,
                  borderRadius: BorderRadius.circular(
                    12.h,
                  ),
                  border: Border.all(
                    color: appTheme.gray400,
                    width: 1.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 17.v),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteItemModelObj.header!,
                              style: theme.textTheme.titleMedium,
                            ),
                            SizedBox(height: 7.v),
                            Text(
                              favoriteItemModelObj.subhead!,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: favoriteItemModelObj.onepiece,
                        height: 79.v,
                        width: 80.h,
                        radius: BorderRadius.circular(12.h),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
