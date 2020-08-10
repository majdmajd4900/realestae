import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';

class EstateImageSlider extends StatelessWidget {
  List<NetworkImage> sliderImages=[];
EstateImageSlider(List<dynamic> images){
for (var x =0 ; x<images.length;++x){
  sliderImages.add(NetworkImage(images[x]));
}
}

 // List<dynamic> images;
  @override
  Widget build(BuildContext context) {
    return Container(child:
      SizedBox(
  height: 150.0,
  width: 300.0,
  child: Carousel(
    images: sliderImages 
  )
),
      
    );
  }
}