import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel',
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      images: [
        NetworkImage('https://img.freepik.com/vector-gratis/conjunto-logotipo-servicio-lavado-coches-espacio-texto-su-lema_1447-1419.jpg?size=338&ext=jpg'),
        NetworkImage('https://image.freepik.com/vector-gratis/coleccion-logos-planos-lavado-coches_23-2148163828.jpg'),
        NetworkImage('https://image.freepik.com/vector-gratis/conjunto-plantillas-diseno-logotipo-lavado-coches_9583-94.jpg'),
        NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTyPRdl-EaVnWU1xhqB_I1bbRQvpN1edAcnoVwi4yGBUtueBs8a'),
        NetworkImage('https://imagenes.milenio.com/XeBEQilC3uyB93fP7fmlNWFaI7c=/958x596/https://www.milenio.com/uploads/media/2019/02/24/blue-side-nombre-negocio-tampiqueno_0_42_640_398.jpg'),
        NetworkImage('https://image.shutterstock.com/image-photo/service-car-washing-sexual-woman-260nw-1569469726.jpg'),
        ExactAssetImage('assets/images/img_01.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
      showIndicator: false,
      borderRadius: false,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      overlayShadow: true,
      overlayShadowColors: Colors.white,
      overlayShadowSize: 0.7,
    );

    Widget logo = new Container(
      child: SizedBox(
        height: screenHeight / 5,
        width: screenHeight / 5,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS7niuSCOcZBG8DyQRcnMW4WYRLY0khdCAjcknusArpY1iBf8v_')
          ]
        )
      )
    );

    Widget banner = new Padding(padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
            color: Colors.amber.withOpacity(0.5),
          ),
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            'Banner on top of carousel',
            style: TextStyle(
              fontFamily: 'fira',
              fontSize: animation.value,//18.0,
              //color: Colors.white,
            ),
          ),
        ),
      // ),
    //  ),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: new Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: screenHeight,
          child: new Column(
            children:<Widget>[
              logo,
              Expanded (
                child: Stack(
                  children: <Widget>[
                    carousel,
                  ],
                )
              ),
              Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
              child:ClipPath(
                
                clipper: ClippingClass(),
              child: Container(
                
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 320.0,
                child: RaisedButton(
                  child: Text('data', style: TextStyle(color: Colors.blue)),
                  color: Colors.blue,
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)
                  ),
                  padding: const EdgeInsets.all(40.0),
                  onPressed: (){},
                ),
              ),
            ),
          ),


            ],
          )
        ),
      ),
      
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 50);

    var firstControlPoint = Offset(size.width / 4, 10.0);
    var firstEndPoint = Offset(size.width / 2.05, 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 4.0), 80);
    var secondEndPoint = Offset(size.width, 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}