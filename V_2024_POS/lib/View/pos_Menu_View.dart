import 'package:flutter/material.dart';
import 'package:possystem/ViewModel/menu_List.dart';

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
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildMenuIcon(Icons.home, 0),
              _buildMenuIcon(Icons.format_list_bulleted, 1),
              _buildMenuIcon(Icons.query_stats, 2),
              const Spacer(),
              _buildMenuIcon(Icons.settings, 3),
            ],
          ),
          Expanded(
            child: MenuList().pages[_activeIndex],
          ),
        ],
      ),
    );
  }
  // 반복되는 위젯 그리기 작업을 줄이기 위해서 _buildMenuIcon 메서드를 사용하여 MenuIcon 위젯을 생성
  // 이 메서드는 icon과 index를 받아서 MenuIcon을 구성.
  Widget _buildMenuIcon(IconData icon, int index) {
    return MenuIcon(
      icon: icon,
      // 선택이 됐는지 안됐는지 확인하기 위한 Bool 값
      isActive: _activeIndex == index,
      onTap: () {
        setState(() {
          // 페이지를 가리키기 위한 인덱스
          _activeIndex = index;
        });
      },
    );
  }
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const MenuIcon({
    Key? key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: IconButton(
        alignment: Alignment.center,
        icon: Icon(
          icon,
          color: isActive ? Colors.orange : Colors.grey,
          size: 40.0,
        ),
        onPressed: onTap,
      ),
    );
  }
}