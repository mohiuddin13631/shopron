import 'package:flutter/material.dart';
class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;
  final double swipeContentWidth;

  const SlideMenu({Key? key,
    required this.child, required this.menuItems,
    this.swipeContentWidth = 0.2
  }) : super(key: key);

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation =
    Tween(begin: const Offset(0.0, 0.0),
        end: Offset(-widget.swipeContentWidth, 0.0))
        .animate(CurveTween(curve: Curves.decelerate).animate(_controller));

    return GestureDetector(
        onHorizontalDragUpdate: (data) {
          setState(() {
            _controller.value -= (data.primaryDelta! / (context.size!.width*0.1));
          });
        },
        onHorizontalDragEnd: (data) {
          if (data.primaryVelocity! > 1500) {
            _controller.animateTo(.0);
          } else if (_controller.value >= .5 || data.primaryVelocity! < -1500) {
            _controller.animateTo(1.0);
          } else {
            _controller.animateTo(.0);
          }
        },
        child: LayoutBuilder(builder: (context, constraint) {
          return Stack(
            children: [
              SlideTransition(
                position: animation,
                child: widget.child,
              ),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Positioned(
                      right: .0,
                      top: .0,
                      bottom: .0,
                      width: constraint.maxWidth * animation.value.dx * -1,
                      // width: 104,
                      child: Row(
                        children: widget.menuItems.map((child) {
                          return Expanded(
                            child: child,
                          );
                        }).toList(),
                      ),
                    );
                  })
            ],
          );
        })
    );
  }
}