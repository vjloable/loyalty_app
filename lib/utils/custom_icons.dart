import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons{
  static Widget email = SvgPicture.asset("icons/Icon-Email.svg");
  static Widget password = SvgPicture.asset("icons/Icon-Password.svg");
  static Widget mini_calendar = SvgPicture.asset("icons/Icon-MiniCalendar.svg");

  static Widget home(Color color) => SvgPicture.asset("icons/Icon-Home.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget wallet(Color color) =>  SvgPicture.asset("icons/Icon-Wallet.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget discover(Color color) =>  SvgPicture.asset("icons/Icon-Discover.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget profile(Color color) =>  SvgPicture.asset("icons/Icon-Profile.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  static Widget user_light = SvgPicture.asset("icons/Icon-DefaultUser.svg", colorFilter: const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),);
  static Widget user_dark = SvgPicture.asset("icons/Icon-DefaultUser.svg", colorFilter: const ColorFilter.mode(Color(0xFF3D3D3D), BlendMode.srcIn),);
  static Widget info = SvgPicture.asset("icons/Icon-Info.svg", colorFilter: const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),);
  static Widget top_icon = SvgPicture.asset("icons/Icon-Loyalty-App-TopBar.svg", colorFilter: const ColorFilter.mode(Color(0xFF6590FF), BlendMode.srcIn),);
  static Widget meter_bar_icon = SvgPicture.asset("icons/Icon-Loyalty-Meter-Bar.svg",);

  static Widget dark_mode(Color color) =>  SvgPicture.asset("icons/Icon-DarkMode.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget user_profile(Color color) =>  SvgPicture.asset("icons/Icon-UserProfile.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget security(Color color) =>  SvgPicture.asset("icons/Icon-Security.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget link_to_socials(Color color) =>  SvgPicture.asset("icons/Icon-LinkToSocials.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget authorized_access(Color color) =>  SvgPicture.asset("icons/Icon-AuthorizedAccess.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  static Widget back_arrow(Color color) => SvgPicture.asset("icons/Icon-BackArrow.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn),);

  static Widget mini_location(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Location.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget mini_time(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Time.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget mini_date(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Date.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget mini_check(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Check.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
}