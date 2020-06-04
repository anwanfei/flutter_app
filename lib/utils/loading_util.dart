import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingUtil {
 static Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    );
  }
}
