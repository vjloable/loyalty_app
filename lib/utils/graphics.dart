import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Illustration {
  static Widget authorized_access_hero = SvgPicture.asset("graphics/illustrations/AuthorizedAccessHero.svg", fit: BoxFit.fitWidth);
  static Widget no_available_deals = SvgPicture.asset("graphics/illustrations/NoAvailableDeals.svg", fit: BoxFit.fitWidth);
  static Widget no_owned_deals = SvgPicture.asset("graphics/illustrations/NoOwnedDeals.svg", fit: BoxFit.fitWidth);
}

class Cards{
  static Widget white = SvgPicture.asset("graphics/cards/Cards_White.svg");
}