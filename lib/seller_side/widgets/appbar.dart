import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/headtext.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final Function()? onLeadingTap;
  final double appBarHeight;
  final double paddingTop;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leadingIcon,
    this.onLeadingTap,
    this.appBarHeight = kToolbarHeight,
    this.paddingTop = 0.0, // Padding from the top
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight + paddingTop,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1, // No shadow
          leading: leadingIcon != null
              ? IconButton(
                  icon: Icon(leadingIcon, color: AppColors.btncolor),
                  onPressed: onLeadingTap,
                )
              : null,
          title: HeadText(text: title, fontSize: 45, icon: null),
          titleSpacing: 2,
          //centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight + paddingTop);
}






class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPressed;
  final double appBarHeight;
  final double paddingTop;
  const CustomAppBar2({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.appBarHeight = kToolbarHeight,
    this.paddingTop = 0.0,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight + paddingTop,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: AppBar(
      backgroundColor: AppColors.btncolor,
      elevation: 1.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white,
        fontSize: 27),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+paddingTop);
}
//Color(0xFF545D68)