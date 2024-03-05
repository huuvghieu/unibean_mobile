import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class NavItem {
  Widget icon;
  Widget icon2;
  String title;

  NavItem(this.icon, this.icon2, this.title);

  static List<NavItem> navItems = [
    NavItem(
        SvgPicture.asset(
          'assets/icons/campaign-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
        ),
        SvgPicture.asset(
          'assets/icons/campaign-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
        ),
        "Chiến Dịch"),
    NavItem(
        SvgPicture.asset(
          'assets/icons/voucher-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
        ),
        SvgPicture.asset(
          'assets/icons/voucher-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
        ),
        "Ưu Đãi"),
    NavItem(
        SvgPicture.asset(
          'assets/icons/reward-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
        ),
        SvgPicture.asset(
          'assets/icons/reward-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
        ),
        "Thành Tựu"),
    NavItem(
        SvgPicture.asset(
          'assets/icons/profile-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
        ),
        SvgPicture.asset(
          'assets/icons/profile-navbar-icon.svg',
          colorFilter: ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
        ),
        "Cá nhân"),
  ];
}
