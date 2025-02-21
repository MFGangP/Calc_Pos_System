import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/features/home/pos_home_view.dart';
import 'package:possystem/features/setting/pos_setting_view.dart';
import 'package:possystem/features/order/pos_order_view.dart';
import 'package:possystem/features/chart/pos_chart_view.dart';
import 'package:window_manager/window_manager.dart';

class PosMenuView extends StatefulWidget {
  const PosMenuView({super.key});

  @override
  _PosMenuViewState createState() => _PosMenuViewState();
}

class _PosMenuViewState extends State<PosMenuView> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuBackGroundColor,
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Container(
                    width: 72,
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 47,
                      fit: BoxFit.contain,
                    ),
                  ),
                  _buildMenuIcon(Icons.home, 0),
                  _buildMenuIcon(Icons.format_list_bulleted, 1),
                  _buildMenuIcon(Icons.query_stats, 2),
                  const Spacer(),
                  _buildMenuIcon(Icons.settings, 3),
                  const SizedBox(height: 10)
                ],
              ),
              Expanded(
                child: MenuList().pages[_activeIndex],
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _showExitConfirmationDialog(context); // 알림 대화상자 표시
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, int index) {
    return MenuIcon(
      icon: icon,
      isActive: _activeIndex == index,
      onTap: () {
        setState(() {
          _activeIndex = index;
        });
      },
    );
  }

  // 종료 확인 알림 대화상자 표시 함수
  Future<void> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 사용자가 대화 상자 외부를 탭해도 닫히지 않도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('프로그램 종료'),
          content: const Text('프로그램을 종료하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop(); // 대화 상자 닫기
              },
            ),
            TextButton(
              child: const Text('종료'),
              onPressed: () {
                windowManager.close(); // 프로그램 종료
              },
            ),
          ],
        );
      },
    );
  }
}

class MenuList {
  final List<Widget> pages = [
    const PosHomeView(),
    const PosOrderView(),
    const PosChartView(),
    const PosSettingView(),
  ];
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const MenuIcon({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: IconButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: menuBackGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        icon: Icon(
          icon,
          color: isActive ? iconSelectedColor : iconNonSelectedColor,
          size: 40.0,
        ),
        onPressed: onTap,
      ),
    );
  }
}