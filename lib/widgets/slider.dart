import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hesmar/constants/constants.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _currentPosition = 0;
  final CarouselController _controller = CarouselController();
  List<String> images = [
    'https://i.sozcu.com.tr/wp-content/uploads/2020/02/13/alisveris-yapmak-1.jpg',
    "https://www.teknolojidolabi.com/wp-content/uploads/2019/10/telefondan-konum-nasil-atilir-15.jpg",
    "https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/barcode_scanner.png",
    "https://d2ly9j2wcshstw.cloudfront.net/ProductImages/97802/big/81umldtkzal._sl1500_.jpg",
    "https://www.seekpng.com/png/detail/256-2562079_protect-your-money-money-umbrella-png.png"
  ];
  List<String> imagesDesc = [
    "Hesaplı Alışverişi Cebine Taşı",
    "En Yakınındaki Marketleri Bul",
    "Barkodu Okut, En Ucuzu Kap",
    "Ürünleri Listene Ekle",
    "Bütçeni Koru",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                  height: 230.0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPosition = index;
                    });
                  }),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(images[index]),
                          fit: BoxFit.cover)),
                );
              },
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.appThemeColor.withOpacity(
                              _currentPosition == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Text(
              imagesDesc[_currentPosition],
              style:
                  const TextStyle(color: Constants.appThemeColor, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
