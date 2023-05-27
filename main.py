# -*- coding: UTF-8 -*-
# ///////////////////////////////////////////////////////////////
#
# BY: WANDERSON M.PIMENTA
# PROJECT MADE WITH: Qt Designer and PySide6
# V: 1.0.0
#
# This project can be used freely for all uses, as long as they maintain the
# respective credits only in the Python scripts, any information in the visual
# interface (GUI) can be modified without any implication.
#
# There are limitations on Qt licenses if you want to use your products
# commercially, I recommend reading them on the official website:
# https://doc.qt.io/qtforpython/licenses.html
#
# ///////////////////////////////////////////////////////////////
import sys
import os
import platform
import pymysql
# IMPORT / GUI AND MODULES AND WIDGETS
# ///////////////////////////////////////////////////////////////
from modules import *
from widgets import *

os.environ["QT_FONT_DPI"] = "96" # FIX Problem for High DPI and Scale above 100%

# SET AS GLOBAL WIDGETS
# ///////////////////////////////////////////////////////////////
conn = None
widgets = None
global rows
all_Row = 15
all_Column = 7


class MainWindow(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        # SET AS GLOBAL WIDGETS
        # ///////////////////////////////////////////////////////////////
        self.ui = Ui_MainWindow() # Ui_MainWindow ui_main.py
        self.ui.setupUi(self)
        global widgets # widgets 
        global rows
        widgets = self.ui

        # USE CUSTOM TITLE BAR | USE AS "False" FOR MAC OR LINUX
        # ��������̷� ����Ŵϱ� false�� ����
        # ///////////////////////////////////////////////////////////////
        Settings.ENABLE_CUSTOM_TITLE_BAR = False

        # APP NAME
        # ///////////////////////////////////////////////////////////////
        title = "저구명품꽈베기 키오스크 시스템"
        description = "저구명품꽈베기 키오스크 시스템"
        # APPLY TEXTS
        self.setWindowTitle(title)
        widgets.titleRightInfo.setText(description)

        # TOGGLE MENU
        # UIFunctions
        # ///////////////////////////////////////////////////////////////
        widgets.toggleButton.clicked.connect(lambda: UIFunctions.toggleMenu(self, True))
        
        # SET UI DEFINITIONS
        # ///////////////////////////////////////////////////////////////
        UIFunctions.uiDefinitions(self)

        # QtableView_2 PARAMETERS
        # ///////////////////////////////////////////////////////////////
        widgets.tableView.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)

        # BUTTONS CLICK
        # ///////////////////////////////////////////////////////////////

        # LEFT MENUS
        widgets.btn_home.clicked.connect(self.buttonClick)
        widgets.btn_calender.clicked.connect(self.buttonClick)
        widgets.btn_chart.clicked.connect(self.buttonClick)
        widgets.btn_save.clicked.connect(self.buttonClick)


        widgets.btn_brezel.clicked.connect(self.menu_Clicked)
        widgets.btn_brezel_set.clicked.connect(self.menu_Clicked)
        widgets.btn_dinoagg.clicked.connect(self.menu_Clicked)
        widgets.btn_donuts.clicked.connect(self.menu_Clicked)
        widgets.btn_hotdog.clicked.connect(self.menu_Clicked)
        widgets.btn_cheeseball.clicked.connect(self.menu_Clicked)
        widgets.btn_americano.clicked.connect(self.menu_Clicked)
        widgets.btn_hotamericano.clicked.connect(self.menu_Clicked)
        widgets.btn_blueberries.clicked.connect(self.menu_Clicked)
        widgets.btn_peach.clicked.connect(self.menu_Clicked)
        widgets.btn_plum.clicked.connect(self.menu_Clicked)
        widgets.btn_pomegranate.clicked.connect(self.menu_Clicked)
        widgets.btn_coke.clicked.connect(self.menu_Clicked)
        widgets.btn_cider.clicked.connect(self.menu_Clicked)
        widgets.btn_Fanta.clicked.connect(self.menu_Clicked)

        # SHOW APP
        # ///////////////////////////////////////////////////////////////
        self.show()

        # SET CUSTOM THEME
        # ///////////////////////////////////////////////////////////////
        useCustomTheme = True
        themeFile = "themes\py_dracula_light.qss"

        # SET THEME AND HACKS
        if useCustomTheme:
            # LOAD AND APPLY STYLE
            UIFunctions.theme(self, themeFile, True)

            # SET HACKS
            AppFunctions.setThemeHack(self)

        # SET HOME PAGE AND SELECT MENU
        # ///////////////////////////////////////////////////////////////
        widgets.stackedWidget.setCurrentWidget(widgets.home)
        widgets.btn_home.setStyleSheet(UIFunctions.selectMenu(widgets.btn_home.styleSheet()))
  
        # DB 접속
        rows = self.initDB()

    # BUTTONS CLICK
    # Post here your functions for clicked buttons
    # ///////////////////////////////////////////////////////////////
    def buttonClick(self):
        # GET BUTTON CLICKED
        btn = self.sender()
        btnName = btn.objectName()

        # SHOW HOME PAGE 
        if btnName == "btn_home":
            widgets.stackedWidget.setCurrentWidget(widgets.home)
            UIFunctions.resetStyle(self, btnName)
            btn.setStyleSheet(UIFunctions.selectMenu(btn.styleSheet()))

        # SHOW CALENDER PAGE 
        if btnName == "btn_calender":
            widgets.stackedWidget.setCurrentWidget(widgets.widgets)
            UIFunctions.resetStyle(self, btnName)
            btn.setStyleSheet(UIFunctions.selectMenu(btn.styleSheet()))

        # SHOW CHART PAGE �Ǹ� ��� �׷��� Ȯ�ο� ������
        if btnName == "btn_chart":
            widgets.stackedWidget.setCurrentWidget(widgets.new_page) # SET PAGE
            UIFunctions.resetStyle(self, btnName) # RESET ANOTHERS BUTTONS SELECTED
            btn.setStyleSheet(UIFunctions.selectMenu(btn.styleSheet())) # SELECT MENU

        if btnName == "btn_save":
            print("Save BTN clicked!")

        # PRINT BTN NAME
        print(f'Button "{btnName}" pressed!')

    # 메뉴 버튼 클릭 이벤트
    def menu_Clicked(self):
        btnName = self.sender().objectName()

        button_row = 0 # 메뉴 버튼 row
        rowPlaceNum = 0 # 테이블 위젯이 받을 row 값
        colPlaceNum = 0 # 테이블 위젯이 받을 col 값
        prdCount = 0 # 제품 개수
        sum_Result = 0 # 합계

        # DB rows에서 버튼 이름 내 행과 같은 값 찾기
        for i in range(len(rows)):
            if self.sender().text() != ((rows[i])[1]):
                i+=1
            elif self.sender().text() == ((rows[i])[1]):
                button_row = ((rows[i])[0] - 1)
                break
            else:
                 pass
        # (rowPlaceNum, colPlaceNum)에 해당하는 셀이 비어있지않다면      
        if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) != None:
            # 제품 개수 만큼 반복
            for _ in range(len(rows)):
                # 만약 (rowPlaceNum, colPlaceNum) 셀이 비어있다면
                if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) == None:
                    self.ui.tableWidget.setRowCount(rowPlaceNum + 1)
                    prdCount += 1 # 제품 개수 1 증가
                    prdTotalPrice = prdCount * int((rows[i])[2]) # 총 가격
                    # 1열 제품명
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem((rows[button_row])[1]))
                    colPlaceNum += 1
                    # 2열 제품 가격
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str((rows[button_row])[2])))
                    colPlaceNum += 1
                    # 3열 제품 개수
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdCount)))
                    colPlaceNum += 1
                    # 4열 제품 총 가격
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdTotalPrice)))
                    # 5열 갯수 추가/제거 버튼 추가
                    colPlaceNum += 1
                    self.ui.tableWidget.setCellWidget(rowPlaceNum, colPlaceNum, self.make_Add_Button(rowPlaceNum, colPlaceNum))
                    # 6열 개수 제거 버튼 추가
                    colPlaceNum += 1
                    self.ui.tableWidget.setCellWidget(rowPlaceNum, colPlaceNum, self.make_Sub_Button(rowPlaceNum, colPlaceNum))
                    # 7열 행 제거 버튼 추가
                    colPlaceNum += 1
                    self.ui.tableWidget.setCellWidget(rowPlaceNum, colPlaceNum, self.make_Del_Button(rowPlaceNum, colPlaceNum))
                    break
                # 만약 제품명 셀의 텍스트가 row 값의 제품 명과 같을 때 - Add_Button과 동일
                elif self.ui.tableWidget.item(rowPlaceNum, colPlaceNum).text() == str((rows[button_row])[1]):
                    # 초기화된 개수 갱신
                    prdCount = int(self.ui.tableWidget.item(rowPlaceNum, colPlaceNum + 2).text()) + 1
                    # 초기화된 총 가격 갱신
                    prdTotalPrice = str(int(prdCount) * int((rows[i])[2]))
                    # 3열 제품 개수 갱신
                    colPlaceNum = 2
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdCount)))
                    colPlaceNum = 3
                    # 4열 제품 총 가격 갱신
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdTotalPrice)))

                    rowPlaceNum = 0 # 행
                    colPlaceNum = 0 # 열
                    prdCount = 0 # 제품 개수
                    break
                # 셀이 비어있지 않은 경우 다음 셀 탐색        
                elif self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) != None:
                    rowPlaceNum += 1
                else:
                    break
        # (rowPlaceNum, colPlaceNum)에 해당하는 셀이 비어있지않다면 - 백지 상태
        else:
            if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) == None:
                self.ui.tableWidget.setRowCount(rowPlaceNum + 1)
                prdCount += 1 # 제품 개수 1 증가
                prdTotalPrice = prdCount * int(((rows[i]))[2]) # 총 가격
                # 1열 제품명
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem((rows[button_row])[1]))
                colPlaceNum += 1
                # 2열 제품 가격
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str((rows[button_row])[2])))
                colPlaceNum += 1
                # 3열 제품 개수
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdCount)))
                colPlaceNum += 1
                # 4열 제품 총 가격
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdTotalPrice)))
                # 5열 개수 추가 버튼 추가
                colPlaceNum += 1
                self.ui.tableWidget.setCellWidget(rowPlaceNum, colPlaceNum, self.make_Add_Button(rowPlaceNum, colPlaceNum))                # 5열 갯수 추가/제거 버튼 추가
                # 6열 개수 제거 버튼 추가
                colPlaceNum += 1
                self.ui.tableWidget.setCellWidget(rowPlaceNum, colPlaceNum, self.make_Sub_Button(rowPlaceNum, colPlaceNum))
                # 7열 행 제거 버튼 추가
                colPlaceNum += 1
                self.ui.tableWidget.setCellWidget(rowPlaceNum, colPlaceNum, self.make_Del_Button(rowPlaceNum, colPlaceNum))

        print (f"Save {btnName} clicked!")
        # 제품 개수만큼 돌면서 합계 구하기
        for i in range(len(rows)):
            if self.ui.tableWidget.item(i, 3)!= None:
                sum_Result += int(self.ui.tableWidget.item(i, 3).text())
            else:
                break

        self.ui.label.setText('합계 : ' + str(sum_Result))     
        
    def row_Button_Click(self):
        # 현재 버튼 값 
        button = self.sender()
        # 로우 값을 split을 통해 추출
        rowPlaceNum = int(button.objectName().split('_')[1])
        # 합계 값 변경을 위해 split을 통해 추출
        sum_Result = int(self.ui.label.text().split(" : ")[1])
        # 현재 누른 버튼이
        if button:
            # 삭제 버튼이라면 
            if (button.objectName() == f"btn_{rowPlaceNum}_6_Del"):
                # 전체 합계 재설정 = 현재 합계 - 단품 전체 가격
                self.ui.label.setText('합계 : ' + str(sum_Result - int(self.ui.tableWidget.item(rowPlaceNum, 3).text())))
                # 해당 Row행 자체 삭제
                self.ui.tableWidget.removeRow(rowPlaceNum)
                # 테이블 위젯 내의 버튼 이름을 찾아오는 방법을 찾기 힘든 관계로 동적 할당을 새로 한다.
                for i in range(rowPlaceNum, self.ui.tableWidget.rowCount() + 1):
                    # 수량 추가 버튼 재할당
                    # print(f"buttonName : ", self.ui.tableWidget.cellWidget(i, 4))
                    self.ui.tableWidget.setCellWidget(i, 4, self.make_Add_Button(rowPlaceNum, 4))
                    # print(f"Reset_buttonName : " , self.ui.tableWidget.cellWidget(i, 4))
                    # print(f"buttonName : " , self.ui.tableWidget.cellWidget(i, 5))
                    # 수량 삭제 버튼 추가
                    self.ui.tableWidget.setCellWidget(i, 5, self.make_Sub_Button(rowPlaceNum, 5))
                    # print(f"Reset_buttonName : " , self.ui.tableWidget.cellWidget(i, 5))
                    # print(f"buttonName : " , self.ui.tableWidget.cellWidget(i, 6))
                    # 해당 행 삭제 버튼 추가
                    self.ui.tableWidget.setCellWidget(i, 6, self.make_Del_Button(rowPlaceNum, 6))
                    # print(f"Reset_buttonName : " , self.ui.tableWidget.cellWidget(i, 6))
                    self.ui.tableWidget.setFocus()
                    # 다음 행으로 넘어가면서 삭제된 행부터 끝까지 재할당.
                    rowPlaceNum += 1
            # 수량 추가 버튼이라면   
            elif (button.objectName() == f"btn_{rowPlaceNum}_4_Add"):
                # 초기화된 개수 갱신
                prdCount = int(self.ui.tableWidget.item(rowPlaceNum, 2).text()) + 1
                # 초기화된 총 가격 갱신
                prdTotalPrice = str(int(prdCount) * int((self.ui.tableWidget.item(rowPlaceNum, 1).text())))
                # 3열 제품 개수 갱신
                self.ui.tableWidget.setItem(rowPlaceNum, 2, QTableWidgetItem(str(prdCount)))
                # 4열 제품 총 가격 갱신
                self.ui.tableWidget.setItem(rowPlaceNum, 3, QTableWidgetItem(str(prdTotalPrice)))
                # 전체 합계 재설정 현재 합계 + 단품 가격
                self.ui.label.setText('합계 : ' + str(sum_Result + int(self.ui.tableWidget.item(rowPlaceNum, 1).text())))
                # 행
            # 수량 제거 버튼이라면
            elif (button.objectName() == f"btn_{rowPlaceNum}_5_Sub"):
                # 제품 개수가 1개일 때는 감소가 일어나지않아야 함.
                if int(self.ui.tableWidget.item(rowPlaceNum, 2).text()) == 1:
                    return
                # 초기화된 개수 갱신
                prdCount = int(self.ui.tableWidget.item(rowPlaceNum, 2).text()) - 1
                # 초기화된 총 가격 갱신
                prdTotalPrice = str(int(self.ui.tableWidget.item(rowPlaceNum, 3).text()) - int(self.ui.tableWidget.item(rowPlaceNum, 1).text()))
                # 3열 제품 개수 갱신
                self.ui.tableWidget.setItem(rowPlaceNum, 2, QTableWidgetItem(str(prdCount)))
                # 4열 제품 총 가격 갱신6
                self.ui.tableWidget.setItem(rowPlaceNum, 3, QTableWidgetItem(str(prdTotalPrice)))
                # 전체 합계 재설정 현재 합계 - 단품 가격
                self.ui.label.setText('합계 : ' + str(sum_Result - int(self.ui.tableWidget.item(rowPlaceNum, 1).text())))
            # 행 초기화
            rowPlaceNum = 0
            # 제품 개수 초기화
            prdCount = 0
            
        print(f"{button} clicked!")

    # 수량 추가 버튼 생성 이벤트
    def make_Add_Button(self, rowPlaceNum, colPlaceNum):
        # 추가/삭제 레이아웃 
        # horizental box를 담을 위젯 생성
        cellWidget = QWidget()
        # 버튼을 담을 horizental box 생성
        layout = QHBoxLayout(cellWidget)
        # 버튼 생성
        btn_Add = QPushButton()
        # # 새로 만든 버튼 오브젝트 네임 설정
        btn_Add .setObjectName(f"btn_{rowPlaceNum}_{colPlaceNum}_Add")
        # 버튼 사이즈 조절 부분
        btn_Add.setMinimumSize(QSize(70, 26))
        btn_Add.setMaximumSize(QSize(70, 26))
        # 버튼 내 텍스트 변경 부분
        btn_Add.setText('추가')
        btn_Add.clicked.connect(self.row_Button_Click)
        # 레이아웃에 버튼 삽입
        layout.addWidget(btn_Add)
        # 버튼 가운데로 세팅 하기 위해 마진 설정
        layout.setContentsMargins(0, 0, 0, 0)
        # 위젯에 레이아웃 담기
        cellWidget.setLayout(layout)
        # 만들어진 위젯을 리턴
        # print(f'Make Button "{btn_Add}"!')
        return cellWidget
    # 수량 제거 버튼 생성 이벤트    
    def make_Sub_Button(self, rowPlaceNum, colPlaceNum):
        # 추가/삭제 레이아웃 
        # horizental box를 담을 위젯 생성
        cellWidget = QWidget()
        # 버튼을 담을 horizental box 생성
        layout = QHBoxLayout(cellWidget)
        # 버튼 생성
        btn_Sub = QPushButton()
        # 새로 만든 버튼 오브젝트 네임 설정
        btn_Sub.setObjectName(f"btn_{rowPlaceNum}_{colPlaceNum}_Sub")
        # 버튼 사이즈 조절 부분
        btn_Sub.setMinimumSize(QSize(70, 26))
        btn_Sub.setMaximumSize(QSize(70, 26))
        # 버튼 내 텍스트 변경 부분
        btn_Sub.setText('제거')
        btn_Sub.clicked.connect(self.row_Button_Click)
        # 레이아웃에 버튼 삽입
        layout.addWidget(btn_Sub)
        # 버튼 가운데로 세팅 하기 위해 마진 설정
        layout.setContentsMargins(0, 0, 0, 0)
        # 위젯에 레이아웃 담기
        cellWidget.setLayout(layout)
        # 만들어진 위젯을 리턴
        # print(f'Make Button "{btn_Sub}"!')
        return cellWidget
    # 해당 행 삭제 버튼 생성 이벤트    
    def make_Del_Button(self, rowPlaceNum, colPlaceNum):
        # 추가/삭제 레이아웃 
        # horizental box를 담을 위젯 생성
        cellWidget = QWidget()
        # 버튼을 담을 horizental box 생성
        layout = QHBoxLayout(cellWidget)
        # 버튼 생성
        btn_Del = QPushButton()
        # 새로 만든 버튼 오브젝트 네임 설정
        btn_Del.setObjectName(f"btn_{rowPlaceNum}_{colPlaceNum}_Del")
        # 버튼 사이즈 조절 부분
        btn_Del.setMinimumSize(QSize(30, 26))
        btn_Del.setMaximumSize(QSize(30, 26))
        # 버튼 내 텍스트 변경 부분
        btn_Del.setText('X')
        btn_Del.clicked.connect(self.row_Button_Click)
        # 레이아웃에 버튼 삽입
        layout.addWidget(btn_Del)
        # 버튼 가운데로 세팅 하기 위해 마진 설정
        layout.setContentsMargins(0, 0, 0, 0)
        # 위젯에 레이아웃 담기
        cellWidget.setLayout(layout)
        # 만들어진 위젯을 리턴
        # print(f'Make Button "{btn_Del}"!')
        return cellWidget
    
    # RESIZE EVENTS
    # ///////////////////////////////////////////////////////////////
    def resizeEvent(self, event):
        # Update Size Grips
        UIFunctions.resize_grips(self)

    # MOUSE CLICK EVENTS
    # ///////////////////////////////////////////////////////////////
    def mousePressEvent(self, event):
        # SET DRAG POS WINDOW
        self.dragPos = event.globalPos()

        # PRINT MOUSE EVENTS
        if event.buttons() == Qt.LeftButton:
            print('Mouse click: LEFT CLICK')
        if event.buttons() == Qt.RightButton:
            print('Mouse click: RIGHT CLICK')

    def initDB(self):
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk', charset='utf8')
        cur = self.conn.cursor()
        # calckiosk.products db 접속 해서 가격 가져오기
        query = '''SELECT Idx
                        , prdName
                        , prdPrice
                    FROM products;'''
        cur.execute(query)
        rows = cur.fetchall()

        # columnName = ['제품명','개수','가격','수량 추가',' 수량 제거','삭제']
        table = self.ui.tableWidget
        # 컬럼 갯수 조절
        table.setColumnCount(all_Column)
        # 테이블 위젯 컬럼 크기 조절
        table.setColumnWidth(0, self.width()*13/100)
        table.setColumnWidth(1, self.width()*4/100)
        table.setColumnWidth(2, self.width()*3/100)
        table.setColumnWidth(3, self.width()*5/100)
        table.setColumnWidth(4, self.width()*7/100) # 600
        table.setColumnWidth(5, self.width()*7/100)
        table.setColumnWidth(6, self.width()*2/100)

        #'번호' = AI(불필요),'제품명','개수','가격','수량 추가',' 수량 제거','삭제'
        header = table.horizontalHeader()       
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(3, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(4, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(5, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(6, QHeaderView.ResizeMode.Fixed)

        header.cascadingSectionResizes()
        
        self.conn.close() # 프로그램 종료할 때

        return rows

if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setWindowIcon(QIcon("bread.png"))
    window = MainWindow()
    sys.exit(app.exec())
 