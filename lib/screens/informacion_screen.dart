import 'package:flutter/material.dart';
import 'package:tourist_app/screens/detalles_info_screen.dart';

import '../models/reglas_model.dart';

class InformacionScreen extends StatefulWidget {
  const InformacionScreen({Key? key}) : super(key: key);

  @override
  State<InformacionScreen> createState() => _InformacionScreenState();
}

class _InformacionScreenState extends State<InformacionScreen> {

  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        children: [
          const Center(
            child: Text(
              "Reglas de Visita del",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 25),
            ),
          ),
          const Center(
            child: Text(
              "Parque Nacional",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 25),
            ),
          ),
          const SizedBox(height: 30,),
          AspectRatio(
            aspectRatio: 0.85,
            child: PageView.builder(
              itemCount: dataList.length,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget carouselView(int index){
    return AnimatedBuilder(
      animation: _pageController, 
      builder: (context, child) {
        double value = 0.0;
        if(_pageController.position.haveDimensions){
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.1416 * value,
          child: carouselCard(dataList[index])
        );
      }
    );
  }

  Widget carouselCard(ReglasModel data){
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesInfoScreen(data: data)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(data.imageName,), 
                      fit: BoxFit.fill
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26
                      )
                    ]
                  ),
                ),
              ),
            ),
          ),
        ),
        /*Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            data.descripcion,
            style: const TextStyle(
              color: Colors.black45, 
              fontSize: 20, 
              fontWeight: FontWeight.bold
            )
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.all(0.8),
          child: Text(
            data.title,
            style: const TextStyle(
              color: Colors.black87, 
              fontSize: 16, 
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ],
    );
  }

}