import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myrealty/app/components/ImgPath.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'package:shimmer/shimmer.dart';

class CommonImageView extends StatelessWidget {
  String? url; // network Image
  String? imagePath; //Asset Image
  String? svgPath;
  String? svgUrl;
  File? file;
  double? height;
  double? width;
  double? borderRadius;
  Color? svgColor;
  final BoxFit fit;
  final String placeHolder;
  final Decoration? boxdecoration;
  final bool isShimmerLoadig;

  CommonImageView(
      {this.borderRadius = 20.0,
      this.svgColor,
      this.boxdecoration,
      this.url,
      this.imagePath,
      this.svgPath,
      this.svgUrl,
      this.file,
      this.height,
      this.width,
      this.fit = BoxFit.contain,
      this.placeHolder = 'assets/png/temp.png',
      this.isShimmerLoadig = false});

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgUrl != null && svgUrl!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        decoration: boxdecoration,
        child: CachedNetworkSVGImage(
          svgUrl!,
          height: height,
          width: width,
          fit: fit,
          errorWidget: const Icon(Icons.error, color: Colors.red),
          placeholder: const CircularProgressIndicator(color: Colors.green),
          fadeDuration: const Duration(milliseconds: 500),
        ),
      );
    }
    if (svgPath != null && svgPath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        decoration: boxdecoration,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (url != null && url != "null" && url!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: url!,
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        height: height,
        width: width,
        errorWidget: (context, url, error) => Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) => isShimmerLoadig
            ? ShimmerLoadig(
                height: height!,
                width: width!,
              )
            : SizedBox(height: height, width: width, child: CircularProgressIndicator()),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
            image: DecorationImage(
              image: AssetImage(
                "${imagePath}",
              ),
              fit: fit,
            )),
      );
    }
    return SizedBox();
  }
}

class ShimmerLoadig extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerLoadig({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Center(
            child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: Colors.black12),
            child: Center(
              child: SizedBox(
                  height: 50.kh,
                  width: 50.kw,
                  child: Image.asset(
                    ImgPath.pngLogo,
                    color: Colors.black,
                  )),
            ),
          ),
        )
            //CircularLoader()
            ));
  }
}
