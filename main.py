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
curIdx = 0 # 현재 데이터 PK
widgets = None

all_Row = 15
all_Column = 5


class MainWindow(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        # SET AS GLOBAL WIDGETS
        # ///////////////////////////////////////////////////////////////
        self.ui = Ui_MainWindow() # Ui_MainWindow ui_main.py
        self.ui.setupUi(self)
        global widgets # widgets 
        widgets = self.ui

        self.initDB()
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

        # print(rows)
        self.makeTable(rows)
        self.conn.close() # 프로그램 종료할 때
        
    # 테이플 위젯 안에 db내용 추출해서 삽입
    def makeTable(self, rows):
        columnName = ['제품명','개수','가격','추가/빼기','제거']

        table = self.ui.tableWidget
        # header = table.horizontalHeader()
        # twidth = header.width()

        # width = []
        # for column in range(header.count()):
        #     header.setSectionResizeMode(column, QHeaderView.ResizeToContents)
        #     width.append(header.sectionSize(column))

        # wfactor = twidth / sum(width)
        # for column in range(header.count()):
        #     header.setSectionResizeMode(column, QHeaderView.Interactive)
        #     header.resizeSection(column, width[column]*wfactor)

        table.setRowCount(all_Row)
        table.setColumnCount(all_Column)
        
        table.setColumnWidth(0, self.width()*30/100)
        table.setColumnWidth(1, self.width()*1/100)
        table.setColumnWidth(2, self.width()*5/100)
        table.setColumnWidth(3, self.width()*5/100)
        table.setColumnWidth(4, self.width()*1/100) # 600
        
        for i in range(len(columnName)):
            table.setHorizontalHeaderItem(i, QTableWidgetItem(columnName[i]))

        header = table.horizontalHeader()       
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(3, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(4, QHeaderView.ResizeMode.Fixed)

        #'번호' = AI(불필요),'제품명','개수','가격','추가/빼기','제거'
        table.horizontalHeader().cascadingSectionResizes()

        for i, row in enumerate(rows):
            # row[0] = AI  row[1] ~ row[4]
            prdName = row[1]
            prdPrice = row[2]
            
            table.setItem(i, 0, QTableWidgetItem(prdName))
            table.setItem(i, 1, QTableWidgetItem(str(prdPrice)))


if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setWindowIcon(QIcon("icon.ico"))
    window = MainWindow()
    sys.exit(app.exec())
