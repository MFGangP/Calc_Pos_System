# Calc_Pos_System

## 첫번째 업로드
	- 메뉴 및 가격 DB 생성
	- py_dracula 디자인 기반 기본 시스템 구현
	- MySQL 연동 및 계산 기능, 합계 구현

<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/2023_05_21.gif?raw=true" width="640">

## 두번째 업로드
	- 수량 추가, 제거, 삭제 클릭 버튼 동적 할당 
	- 버튼 클릭 이벤트 생성, 연결
	- 계산 시스템 완성
	
	TODO:
	- 매출 DB 업로드 기능
	- 제품 기본 가격 변경 기능
	- 매출 조회 기능 등..
	- 디자인 작업

<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/Make_CalcSys_CP.gif?raw=true" width="640">

## 세번째 업로드
	- 매출 DB 업로드 기능 구현
	- 테이블 위젯 목록 전체 삭제 기능 구현

	TODO:
	- 제품 기본 가격 변경 기능
	- 매출 조회 기능 등..
	- 디자인 작업
	
## 네번째 업로드 (2023.06.04)
	- 전체 디자인 작업 및 수정
	- 주문번호에 따른 판매 기록 기능(과거 데이터 조회 기능 추가 필요)
	- 판매 기록 삭제 기능 추가
	- 버튼 사진 추가
	
	TODO:
	- 제품 기본 가격 변경 기능 추가 (DB쿼리는 완성)
	- 과거 시점 매출 조회 기능 추가 필요
	
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/Del_ListWidget.gif?raw=true" width="640">

## 다섯번째 업로드 (2023.06.06)
	- 라즈베리파이 이식 (윈도우와 호환성 문제 및 라즈베리 파이가 pyside6와 python 3.11을 제대로 지원하지않음)
	- 디자인 수정
	
	TODO:
	- 라즈베리파이에서 프로그램 속도가 너무 느림 2초 정도의 딜레이 발생(딜레이 줄이기)
	- 사용하지않는 QT5 디자인 정리
	
## 여섯번째 업로드 (2023.06.07)
	- 라즈베리파이 프로그램 속도가 느린 이유는 해상도가 너무 높았기 때문으로 판명
	- 해상도를 1280x720으로 변경하고 프로그램 전체 수정 (딜레이 1초 미만)
	
	TODO:
	- 일,월,년 매출을 확인 할 수 있는 매출 페이지 제작
	- 당일 삭제된 주문 번호를 조회 할 수 있는 페이지 제작
	
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/2023-06-07_rasberrypi4_ver.gif?raw=true" width="640">

## 일곱번째 업로드 (2023.06.11)
	- 현재까지 제작된 버전(v0.1.0)으로 가게에 가설치 완료
 	- 제품 목록
 		- Rasberry Pi 4 8GB
  		- zeuslap Z16 pro Max
   		- NorthBayou NB F100A 모니터암
     		- Argon ONE V2
	
	TODO:
	- 현장에서 본 결과 추가 주문이 상당히 많은 것을 확인 => 주문 수정 기능이 필요
	- 당일 삭제된 주문 번호를 조회 할 수 있는 페이지 제작
	- 일,월,년 매출을 확인 할 수 있는 매출 페이지 제작

<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/20230611_191844666_01.jpg?raw=true" width="640">
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/20230611_191844666_02.jpg?raw=true" width="640">

## 여덟번째 업로드 (2023.06.15)
	- 일정 기간 내 주문 기록 및 당일 삭제된 주문번호를 확인 하기 위한 페이지 UI 변경
	- 날짜 선택 시 표시 되게 수정
	
	TODO:
	- 주문 수정 기능
	- 조회 페이지 로직 구현
	- 매출 요약 페이지 제작
	
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/select_Date.png?raw=true" width="640">

## 아홉번째 업로드 (2023.06.18)
	 - 조회 페이지 수정 및 로직 구현
	 
	 TODO:
	 - 주문 수정 기능
	 - 매출 요약 페이지 제작
	 
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/using_calendar.gif?raw=true" width="640">

## 10번째 업로드 (2024.04.24)
	- 기능 구현 수정이 필요해서 수정하던 도중 3.5 버전 이상의 python에서는 pyside2가 동작하지 않는 것을 확인
	- 모든 코드를 pyside6에 맞춰서 수정해야할 것으로 보인다.

## 11번째 업로드 (2024.05.16)
    - 가격 및 메뉴명 수정 요정에 따른 DB 업데이트

<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/IMG_3563.jpg?raw=true" width="640">


## 12번째 업로드 (2024.06.22)
    - 추후 개발 프로그램 방향을 flutter로 수정.
    - pupspec.yaml 파일에 https://pub.dev/packages 패키지 버전을 지정해줘야된다. (sqflite: ^2.3.3+1, mysql_client: ^0.0.27)
    - macOS에서는 네트워크에 액세스하려면 특정 권한을 요청해야한다.
        -[macos/Runner/DebugProfile.entitlements를 열고 다음 키-값 쌍을 추가]
```
    <key>com.apple.security.network.client</key>
    <true/>
```

## 13번째 업로드 (2024.07.19)
    - 메뉴 바
    - 버튼
    - 데이터 테이블
    - 페이지 생성

<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/2024_07_19.png?raw=true" width="640">

## 14번째 업로드 (2024.07.22)
    - 데이터 테이블
        - 테이블 타이틀 색상 조건부 변경
        - 테이블 행 버튼 및 데이터 틀 생성
    
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/2024_07_22.png?raw=true" width="640">

## 15번째 업로드 (2024.12.16)
    - 플러터 형식 폴더 변경
    - 메뉴 선택시 DataRow 생성
    
<img src="https://github.com/MFGangP/Calc_Kiosk_System/blob/main/makeimage/2024_12_16.png?raw=true" width="640">

## 16번째 업로드 (2024.1.3)
    - 베타 버전 제작 완료
    - home 화면 제작
    - order 화면 제작
    - setting 화면 제작
    
<img src="https://github.com/MFGangP/Calc_Pos_System/blob/main/makeimage/flutter_V_0_1.gif?raw=true" width="640">
