import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../status/click_counter.dart';
import '../shop/upgrade_item.dart';
import '../Transition/transition.dart';

class ClickButton extends StatefulWidget {
  const ClickButton({Key? key}) : super(key: key);

  @override
  State<ClickButton> createState() => _ClickButton();
}

// クリック機構
class _ClickButton extends State<ClickButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isTextVisible = false;
  Timer? _timer;

  void _showText() {
    setState(() {
      _isTextVisible = true;
      _animationController.reset();
      _animationController.forward();
    });

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _isTextVisible = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MochiClicker mochiCount = context.watch<MochiClicker>();
    final UpgradeItems upgradeItems = context.read<UpgradeItems>();

    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: context.height * 0.32 * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              if (upgradeItems.upgradeData[0].upgradeFlag == 0) {
                mochiCount.incrementCounter();
                _showText();
              } else {
                mochiCount.clickData.count += mochiCount.clickData.mps *
                    upgradeItems.upgradeData[0].effectRate;
                mochiCount.clickData.totalCount += mochiCount.clickData.mps *
                    upgradeItems.upgradeData[0].effectRate;

                _showText();
                mochiCount.incrementCounter();
              }
            },
            child: Image.asset('assets/images/syougatsu2_mochi.png'),
          ),
        ),
        if (_isTextVisible)
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Positioned(
                bottom: _animation.value * (context.height * 0.32 * 0.8),
                width: context.width,
                child: Transform.scale(
                  scale: 1 - _animation.value,
                  child: child,
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                upgradeItems.upgradeData[0].upgradeFlag == 0
                    ? '1'
                    : NumberFormat.compact().format(
                        mochiCount.clickData.mps *
                                upgradeItems.upgradeData[0].effectRate +
                            1,
                      ),
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Corporate Logo Medium'),
              ),
            ),
          ),
      ],
    );
  }
}
