import 'package:flutter/cupertino.dart';

/// Reduce title to give initials.
///
/// @title Title to take initials.
/// @maxlength Length max of the string.
String transformStringInitials({@required String title, int maxlength = 1}) {
  if (title == null || title == '') {
    return '';
  }

  var res = title
      .split(' ')
      .map((e) => e.substring(0, 1))
      .reduce((value, element) => value + element);
  return res.substring(0, res.length >= maxlength ? 2 : 1);
}

/// Delete space and other characters to url
/// @
String transformStringToUrl({@required String text}) {
  return text.replaceAll(RegExp(' '), '+');
}
