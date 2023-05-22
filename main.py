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
all_Column = 6


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
        useCustomTheme = False
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

    def menu_Clicked(self):
        btnName = self.sender().objectName()
        button_row = 0
        rowPlaceNum = 0
        colPlaceNum = 0
        prdCount = 0
        sum_Result = 0

        for i in range(len(rows)):
            if self.sender().text() != ((rows[i])[1]):
                i+=1
            elif self.sender().text() == ((rows[i])[1]):
                button_row = ((rows[i])[0] - 1)
                break
            else:
                 pass

        if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) != None:
            for _ in range(len(rows)):
                if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) == None:
                        prdCount += 1 # 제품 개수 1 증가
                        prdTotalPrice = prdCount * int((rows[rowPlaceNum])[2]) # 총 가격
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
                        break
                elif self.ui.tableWidget.item(rowPlaceNum, colPlaceNum).text() == str((rows[button_row])[1]):
                        # 초기화된 개수 갱신
                        prdCount = int(self.ui.tableWidget.item(rowPlaceNum, colPlaceNum + 2).text()) + 1
                        # 초기화된 총 가격 갱신
                        prdTotalPrice = str(int(prdCount) * int((rows[rowPlaceNum])[2]))
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
                elif self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) != None:
                        rowPlaceNum += 1
                else:
                        break
        else:
            if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) == None:
                prdCount += 1 # 제품 개수 1 증가
                prdTotalPrice = prdCount * int((rows[rowPlaceNum])[2]) # 총 가격
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

        print (f"Save {btnName} clicked!")
        for i in range(len(rows)):
            if self.ui.tableWidget.item(i, 3)!= None:
                sum_Result += int(self.ui.tableWidget.item(i, 3).text())
            else:
                break
        self.ui.label.setText('합계 : ' + str(sum_Result))     
        
        
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

        # columnName = ['제품명','개수','가격','추가/빼기','제거']
        table = self.ui.tableWidget

        table.setRowCount(all_Row)
        table.setColumnCount(all_Column)
        
        table.setColumnWidth(0, self.width()*25/100)
        table.setColumnWidth(1, self.width()*3/100)
        table.setColumnWidth(2, self.width()*2/100)
        table.setColumnWidth(3, self.width()*5/100)
        table.setColumnWidth(5, self.width()*3/100)
        table.setColumnWidth(4, self.width()*3/100) # 600

        #'번호' = AI(불필요),'제품명','개수','가격','추가/빼기','제거'
        header = table.horizontalHeader()       
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(3, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(4, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(5, QHeaderView.ResizeMode.Fixed)

        header.cascadingSectionResizes()
        
        self.conn.close() # 프로그램 종료할 때

        return rows

if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setWindowIcon(QIcon("bread.png"))
    window = MainWindow()
    sys.exit(app.exec())
 