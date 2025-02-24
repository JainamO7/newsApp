import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          leading: Container(width: 50, height: 50, color: Colors.white),
          title: Container(width: double.infinity, height: 10, color: Colors.white),
          subtitle: Container(width: double.infinity, height: 10, color: Colors.white),
        ),
      ),
    );
  }
}