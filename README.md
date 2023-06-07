# Calc_Kiosk_System

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