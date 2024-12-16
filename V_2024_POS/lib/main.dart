import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'package:possystem/shared/widgets/pos_Menu_View.dart';

List product = [];

// main스레드는 runApp을 실행시키고 종료.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1280, 720),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  // 비동기로 실행됨(이벤트 루프에 등록된다)
  runApp(const MyApp());
}

//StatelessWidget은 변화가 필요없는 화면을 구성할 때 사용하는 위젯 클래스이며, 그렇기 때문에 build 메서드는 한 번만 호출된다.
class MyApp extends StatelessWidget {
  // Dart에서 super 키워드는 부모 클래스의 생성자를 호출하는 데 사용, StatefulWidget의 생성자를 호출하며, key 매개변수를 전달
  // key는 위젯을 고유하게 식별하는 데 사용되며, Flutter 프레임워크가 위젯 트리에서 위젯을 효율적으로 재구성하고 관리하는 데 도움을 줌.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      home: const PosMenuView(), // posMenuView를 호출합니다
    ); // Maximum size
  }
}
