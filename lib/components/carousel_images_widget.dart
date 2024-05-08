import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'carousel_images_model.dart';
export 'carousel_images_model.dart';

class CarouselImagesWidget extends StatefulWidget {
  const CarouselImagesWidget({
    super.key,
    this.prmImages,
  });

  final List<String>? prmImages;

  @override
  State<CarouselImagesWidget> createState() => _CarouselImagesWidgetState();
}

class _CarouselImagesWidgetState extends State<CarouselImagesWidget> {
  late CarouselImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarouselImagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final lvImagesPath = widget.prmImages?.toList() ?? [];
        return SizedBox(
          width: double.infinity,
          height: 130.0,
          child: CarouselSlider.builder(
            itemCount: lvImagesPath.length,
            itemBuilder: (context, lvImagesPathIndex, _) {
              final lvImagesPathItem = lvImagesPath[lvImagesPathIndex];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  valueOrDefault<String>(
                    lvImagesPathItem,
                    '-',
                  ),
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              );
            },
            carouselController: _model.carouselController ??=
                CarouselController(),
            options: CarouselOptions(
              initialPage: min(1, lvImagesPath.length - 1),
              viewportFraction: 0.5,
              disableCenter: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayInterval: const Duration(milliseconds: (800 + 4000)),
              autoPlayCurve: Curves.linear,
              pauseAutoPlayInFiniteScroll: true,
              onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
            ),
          ),
        );
      },
    );
  }
}
