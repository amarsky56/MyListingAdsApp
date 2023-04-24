
import 'package:flutter/material.dart';

import '../services/textstyles.dart';

class NotFound extends StatelessWidget {
  String title;

  NotFound({ this.title="No product found!"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(title,style: TextStyleUtil.plusJakartaSansStyleS28W700(),)),
    );
  }
}
