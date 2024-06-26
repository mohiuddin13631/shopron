import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopScopeWidget extends StatelessWidget {

  final Widget child;
  final VoidCallback? customPop;

  const PopScopeWidget({Key? key,
    required this.child,
    this.customPop
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        onPopInvoked: (didPop) {
          if(didPop){
            return;
          }
          if(customPop != null){
            customPop!();
          }
        },
        child: child
    );
  }
}
