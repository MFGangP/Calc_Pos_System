import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';
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
      backgroundColor: menuBackGroundColor,
    // 가로 축
      body: Row(
        children: <Widget>[
          // 세로 축
          Column(
            children: <Widget>[
             const SizedBox(height: 10),
            // 메뉴 버튼 생성
             Container(
               width: 72,
               // Image 크기 조절을 위한 Padding 추가
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
            ],
          ),
          // Expanded는 child 요소를 렌더링 영역의 최대 사이즈까지 확장시켜 주는 위젯.
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

// 아이콘을 일정한 크기로 뽑기 위해 재사용을 하려고 만들 클래스
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
        style: ElevatedButton.styleFrom(
          backgroundColor: menuBackGroundColor, // 이미 menuBackGroundColor는 Color 객체
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // 사각형 버튼
          ),
        ),  //
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
