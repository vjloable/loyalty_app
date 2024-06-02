import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons{
  static Widget email = SvgPicture.asset("icons/Icon-Email.svg");
  static Widget password = SvgPicture.asset("icons/Icon-Password.svg");
  static Widget mini_calendar = SvgPicture.asset("icons/Icon-MiniCalendar.svg");

  static Widget home = SvgPicture.asset("icons/Icon_Home.svg", colorFilter: const ColorFilter.mode(Color(0xFF959595), BlendMode.srcIn));
  static Widget wallet = SvgPicture.asset("icons/Icon-Wallet.svg", colorFilter: const ColorFilter.mode(Color(0xFF959595), BlendMode.srcIn));
  static Widget discover = SvgPicture.asset("icons/Icon-Discover.svg", colorFilter: const ColorFilter.mode(Color(0xFF959595), BlendMode.srcIn));
  static Widget profile = SvgPicture.asset("icons/Icon-Profile.svg", colorFilter: const ColorFilter.mode(Color(0xFF959595), BlendMode.srcIn));
  static Widget home_active = SvgPicture.asset("icons/Icon_Home.svg", colorFilter: const ColorFilter.mode(Color(0xFF6590FF), BlendMode.srcIn),);
  static Widget wallet_active = SvgPicture.asset("icons/Icon-Wallet.svg", colorFilter: const ColorFilter.mode(Color(0xFF6590FF), BlendMode.srcIn),);
  static Widget discover_active = SvgPicture.asset("icons/Icon-Discover.svg", colorFilter: const ColorFilter.mode(Color(0xFF6590FF), BlendMode.srcIn),);
  static Widget profile_active = SvgPicture.asset("icons/Icon-Profile.svg", colorFilter: const ColorFilter.mode(Color(0xFF6590FF), BlendMode.srcIn),);

  static Widget user_light = SvgPicture.asset("icons/Icon-DefaultUser.svg", colorFilter: const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),);
  static Widget user_dark = SvgPicture.asset("icons/Icon-DefaultUser.svg", colorFilter: const ColorFilter.mode(Color(0xFF3D3D3D), BlendMode.srcIn),);
  static Widget info = SvgPicture.asset("icons/Icon-Info.svg", colorFilter: const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),);
  static Widget top_icon = SvgPicture.asset("icons/Icon-Loyalty-App-TopBar.svg", colorFilter: const ColorFilter.mode(Color(0xFF6590FF), BlendMode.srcIn),);
  static Widget meter_bar_icon = SvgPicture.asset("icons/Icon-Loyalty-Meter-Bar.svg",);
}