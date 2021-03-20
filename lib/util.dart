import 'package:flutter/material.dart';

List<Widget> getDates(){
  List<Widget> l = new List<Widget>();
  for(int i=0;i<31;i++){
    if(i%7 == 0){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "S\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
    if(i%7 == 1){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "M\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
    if(i%7 == 2){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "T\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
    if(i%7 == 3){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "W\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
    if(i%7 == 4){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "T\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
    if(i%7 == 5){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "F\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
    if(i%7 == 6){
      l += [Container(
        height: 60,
        child:Tab(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text( "S\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text((i+1).toString(), style:TextStyle(fontSize:16, fontWeight: FontWeight.bold))
          ],
        ),
      ),)];
    }
  }
  return l;
}



class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}