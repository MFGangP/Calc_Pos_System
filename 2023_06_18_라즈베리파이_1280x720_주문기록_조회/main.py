import sys
import os
import pymysql
from datetime import datetime
# IMPORT / GUI AND MODULES AND WIDGETS
# ///////////////////////////////////////////////////////////////
from modules import *
from widgets import *

# from matplotlib.backends.backend_qt6agg import FigureCanvasQTAgg as FigureCanvas
# from matplotlib.figure import Figure

os.environ["QT_FONT_DPI"] = "96" # FIX Problem for High DPI and Scale above 100%

# SET AS GLOBAL WIDGETS
# ///////////////////////////////////////////////////////////////
conn = None
widgets = None

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
        widgets = self.ui

        global products
        # global orderitems
        global orders

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
       
        # SET UI DEFINITIONS
        # ///////////////////////////////////////////////////////////////
        UIFunctions.uiDefinitions(self)

        # # QtableView_2 PARAMETERS
        # # ///////////////////////////////////////////////////////////////
        # widgets.tableView.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)

        # columnName = ['제품명', '개수', '가격', '총가격', '수량 추가', ' 수량 제거', '삭제']
        table = self.ui.tableWidget
        # 컬럼 갯수 조절
        table.setColumnCount(all_Column)
        # 테이블 위젯 컬럼 크기 조절
        table.setColumnWidth(0, self.width()*4.1/30)
        table.setColumnWidth(1, self.width()*1.6/30)
        table.setColumnWidth(2, self.width()*1/30)
        table.setColumnWidth(3, self.width()*2.3/30)
        table.setColumnWidth(4, self.width()*1.6/30) # 600
        table.setColumnWidth(5, self.width()*1.6/30)
        table.setColumnWidth(6, self.width()*1/30)

        table.verticalHeader().setDefaultSectionSize(30)

        #'번호' = AI(불필요),'제품명','개수','가격','수량 추가',' 수량 제거','삭제'
        v_Header = table.verticalHeader()
        v_Header.setFixedWidth(30)
        
        header = table.horizontalHeader()       
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(3, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(4, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(5, QHeaderView.ResizeMode.Fixed)
        header.setSectionResizeMode(6, QHeaderView.ResizeMode.Fixed)
        header.setFixedHeight(30)
        header.cascadingSectionResizes()

        # BUTTONS CLICK
        # ///////////////////////////////////////////////////////////////

        # LEFT MENUS
        widgets.btn_home.clicked.connect(self.buttonClick)
        widgets.btn_nowSales.clicked.connect(self.buttonClick)
        widgets.btn_postSales.clicked.connect(self.buttonClick)
        widgets.toggleLeftBox.clicked.connect(self.buttonClick)
        # 메뉴 생성 버튼
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
        # 전체 삭제 버튼
        widgets.btn_All_Del.clicked.connect(self.all_Del_Button)
        widgets.btu_Commit.clicked.connect(self.commit_Button)
        # 리스트 위젯 시그널
        widgets.salesListWidget.itemClicked.connect(self.salesListWidget_ItemClicked)
        # 리스트 위젯 결제건 삭제 시그널
        widgets.del_List_Button.clicked.connect(self.del_List_Button_Clicked)
        # 캘린더 위젯 날짜 선택 시그널
        widgets.cal_daily_sales.clicked.connect(self.select_Date_Calendar)
        # 캘린더 위젯 날짜 초기화 시그널
        widgets.btn_cal_Reset.clicked.connect(self.reset_Order_Using_Calendar)
        # 캘린더 위젯 검색 클릭 시그널
        widgets.btn_cal_priod.clicked.connect(self.make_OrderNum_Listwidget_Button)
        # 캘린더 페이지 리스트 위젯 시그널
        widgets.lsw_daily_sales.itemClicked.connect(self.search_OrderRecord_Using_Calendar)

        # SHOW APP
        # ///////////////////////////////////////////////////////////////\

        # self.showFullScreen()
        self.showNormal()
        # # SET CUSTOM THEME
        # # ///////////////////////////////////////////////////////////////
        # useCustomTheme = False
        # themeFile = "./themes/py_dracula_light.qss"

        # # SET THEME AND HACKS
        # if useCustomTheme:
        #     # LOAD AND APPLY STYLE
        #     UIFunctions.theme(self, themeFile, True)

        #     # SET HACKS
        #     AppFunctions.setThemeHack(self)

        # SET HOME PAGE AND SELECT MENU
        # ///////////////////////////////////////////////////////////////
        widgets.stackedWidget.setCurrentWidget(widgets.home)
        widgets.btn_home.setStyleSheet(UIFunctions.selectMenu(widgets.btn_home.styleSheet()))
  
        # DB 접속
        products = self.products_initDB()
        orderitems = self.orderitems_initDB()
        orders = self.orders_initDB()

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
        if btnName == "btn_nowSales":
            widgets.stackedWidget.setCurrentWidget(widgets.nowSales)
            UIFunctions.resetStyle(self, btnName)
            btn.setStyleSheet(UIFunctions.selectMenu(btn.styleSheet()))

        # SHOW CHART PAGE �Ǹ� ��� �׷��� Ȯ�ο� ������
        if btnName == "btn_postSales":
            widgets.stackedWidget.setCurrentWidget(widgets.postSales) # SET PAGE
            UIFunctions.resetStyle(self, btnName) # RESET ANOTHERS BUTTONS SELECTED
            btn.setStyleSheet(UIFunctions.selectMenu(btn.styleSheet())) # SELECT MENU

        if btnName == "toggleLeftBox":
            widgets.stackedWidget.setCurrentWidget(widgets.change_Sales) 
            UIFunctions.resetStyle(self, btnName)
            btn.setStyleSheet(UIFunctions.selectMenu(btn.styleSheet()))

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

        # DB products에서 버튼 이름 내 행과 같은 값 찾기
        for i in range(len(products)):
            if self.sender().text() != ((products[i])[1]):
                i+=1
            elif self.sender().text() == ((products[i])[1]):
                button_row = ((products[i])[0] - 1)
                break
            else:
                 pass
        # (rowPlaceNum, colPlaceNum)에 해당하는 셀이 비어있지않다면      
        if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) is not None:
            # 제품 개수 만큼 반복
            for _ in range(len(products)):
                # 만약 (rowPlaceNum, colPlaceNum) 셀이 비어있다면
                if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) is None:
                    self.ui.tableWidget.setRowCount(rowPlaceNum + 1)
                    prdCount += 1 # 제품 개수 1 증가
                    prdTotalPrice = prdCount * int((products[i])[2]) # 총 가격
                    # 1열 제품명
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem((products[button_row])[1]))
                    colPlaceNum += 1
                    # 2열 제품 가격
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str((products[button_row])[2])))
                    colPlaceNum += 1
                    # 3열 제품 개수
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdCount)))
                    colPlaceNum += 1
                    # 4열 제품 총 가격
                    self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(format(prdTotalPrice, ','))))
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
                elif self.ui.tableWidget.item(rowPlaceNum, colPlaceNum).text() == str((products[button_row])[1]):
                    # 초기화된 개수 갱신
                    prdCount = int(self.ui.tableWidget.item(rowPlaceNum, colPlaceNum + 2).text()) + 1
                    # 초기화된 총 가격 갱신
                    prdTotalPrice = str(format(int(prdCount) * int((products[i])[2]), ','))
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
                elif self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) is not None:
                    rowPlaceNum += 1
                else:
                    break
        # (rowPlaceNum, colPlaceNum)에 해당하는 셀이 비어있지않다면 - 백지 상태
        else:
            if self.ui.tableWidget.item(rowPlaceNum, colPlaceNum) is None:
                self.ui.tableWidget.setRowCount(rowPlaceNum + 1)
                prdCount += 1 # 제품 개수 1 증가
                prdTotalPrice = prdCount * int(((products[i]))[2]) # 총 가격
                # 1열 제품명
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem((products[button_row])[1]))
                colPlaceNum += 1
                # 2열 제품 가격
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str((products[button_row])[2])))
                colPlaceNum += 1
                # 3열 제품 개수
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(prdCount)))
                colPlaceNum += 1
                # 4열 제품 총 가격
                self.ui.tableWidget.setItem(rowPlaceNum, colPlaceNum, QTableWidgetItem(str(format(prdTotalPrice, ','))))
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
        for i in range(len(products)):
            if self.ui.tableWidget.item(i, 3) is not None:
                sum_Result += int(self.ui.tableWidget.item(i, 3).text().replace(',', ''))
            else:
                break

        self.ui.label.setText('합계 : ' + str(format(sum_Result,',')))     

###############################################################################################    
    # 테이블 위젯 메뉴 표시 이벤트     
    def row_Button_Click(self):
        # 현재 버튼 값 
        button = self.sender()
        # 로우 값을 split을 통해 추출
        rowPlaceNum = int(button.objectName().split('_')[1])
        # 합계 값 변경을 위해 split을 통해 추출
        sum_Result = int((self.ui.label.text().split(" : ")[1]).replace(',', ''))
        # 현재 누른 버튼이
        if button:
            # 삭제 버튼이라면 
            if (button.objectName() == f"btn_{rowPlaceNum}_6_Del"):
                # 전체 합계 재설정 = 현재 합계 - 단품 전체 가격
                self.ui.label.setText('합계 : ' + str(format(sum_Result - int(self.ui.tableWidget.item(rowPlaceNum, 3).text().replace(',', '')), ',')))
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
                prdTotalPrice = str(format(int(prdCount) * int((self.ui.tableWidget.item(rowPlaceNum, 1).text())), ','))
                # 3열 제품 개수 갱신
                self.ui.tableWidget.setItem(rowPlaceNum, 2, QTableWidgetItem(str(prdCount)))
                # 4열 제품 총 가격 갱신
                self.ui.tableWidget.setItem(rowPlaceNum, 3, QTableWidgetItem(str(prdTotalPrice)))
                # 전체 합계 재설정 현재 합계 + 단품 가격
                self.ui.label.setText('합계 : ' + str(format(sum_Result + int(self.ui.tableWidget.item(rowPlaceNum, 1).text()), ',')))
                # 행

            # 수량 제거 버튼이라면
            elif (button.objectName() == f"btn_{rowPlaceNum}_5_Sub"):
                # 제품 개수가 1개일 때는 감소가 일어나지않아야 함.
                if int(self.ui.tableWidget.item(rowPlaceNum, 2).text()) == 1:
                    return
                # 초기화된 개수 갱신
                prdCount = int(self.ui.tableWidget.item(rowPlaceNum, 2).text()) - 1
                # 초기화된 총 가격 갱신
                prdTotalPrice = str(format(int(self.ui.tableWidget.item(rowPlaceNum, 3).text().replace(',', '')) - int(self.ui.tableWidget.item(rowPlaceNum, 1).text().replace(',', '')), ','))
                # 3열 제품 개수 갱신
                self.ui.tableWidget.setItem(rowPlaceNum, 2, QTableWidgetItem(str(prdCount)))
                # 4열 제품 총 가격 갱신6
                self.ui.tableWidget.setItem(rowPlaceNum, 3, QTableWidgetItem(str(prdTotalPrice)))
                # 전체 합계 재설정 현재 합계 - 단품 가격
                self.ui.label.setText('합계 : ' + str(format(sum_Result - int(self.ui.tableWidget.item(rowPlaceNum, 1).text()), ',')))

            # 행 초기화
            rowPlaceNum = 0
            # 제품 개수 초기화
            prdCount = 0
            
    # 전체 삭제 버튼 클릭 이벤트        
    def all_Del_Button(self):
        button = self.sender()
        print(f'Button "{button.objectName()}" pressed!')
        sum_Result = 0
        if self.ui.tableWidget.rowCount() == 0:
            self.ui.label.setText("삭제할 데이터가 없습니다")
            return
        else:
            for i in range (self.ui.tableWidget.rowCount()):
                self.ui.tableWidget.removeRow(0)
                # print(f"Delete_'{i}'_Row")
            self.ui.label.setText('합계 : ' + str(sum_Result))
      
    # 리스트 위젯에서 선택한 주문 상세내역 보여주는 이벤트
    def salesListWidget_ItemClicked(self):
        # 주문 번호
        # print(self.ui.salesListWidget.currentItem().text())
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()
        # orders - ord_idx(주문번호 - AI), 
        # prd.prdName(제품명), prd.prdPrice(제품가격)
        # oim.quantity(제품 개수), oim.total_price(제품 총액), 
        # order_price(주문 총액), order_dt(주문날짜)
        salesListWidget_Select_query = f'''SELECT oim.ord_idx
                                                , prd.prdName
                                                , prd.prdPrice
                                                , oim.quantity
                                                , oim.total_price
                                                , ods.order_price
                                                , ods.order_dt
                                             FROM orderitems as oim
                                            INNER JOIN orders as ods
                                               ON oim.ord_idx = ods.ord_idx
                                            INNER JOIN products as prd
                                               ON prd.prd_idx = oim.prd_idx
                                            WHERE oim.ord_idx = {self.ui.salesListWidget.currentItem().text().split(' ')[3]}'''
        cur.execute(salesListWidget_Select_query)
        receipt_value = cur.fetchall()
        # QTextCharFormat 객체 생성
        form = QTextCharFormat() 
        # 폰트 사이즈 변경
        form.setFontPointSize(20)
        # 폰트 적용
        self.ui.salesText.setCurrentCharFormat(form)
        # 상단 타이틀 표시
        self.ui.salesText.setPlainText(f'주문 번호 : {receipt_value[0][0]}\n\n상품명\t\t단가\t수량\t금액\n')
        # 폰트 적용
        form.setFontPointSize(15)
        # 폰트 적용
        self.ui.salesText.setCurrentCharFormat(form)
        # 글자 수 별로 탭 횟수 차등 
        for item in range(len(receipt_value)):
            if len(receipt_value[item][1]) <= 2:
                self.ui.salesText.appendPlainText(f'''{receipt_value[item][1]}\t\t{format((receipt_value[item][2]), ',')}\t{format((receipt_value[item][3]), ',')}\t{format((receipt_value[item][4]), ',')}\n''')
            elif len(receipt_value[item][1]) == 3:
                self.ui.salesText.appendPlainText(f'''{receipt_value[item][1]}\t\t{format((receipt_value[item][2]), ',')}\t{format((receipt_value[item][3]), ',')}\t{format((receipt_value[item][4]), ',')}\n''')
            elif len(receipt_value[item][1]) > 3:
                self.ui.salesText.appendPlainText(f'''{receipt_value[item][1]}\t{format((receipt_value[item][2]), ',')}\t{format((receipt_value[item][3]), ',')}\t{format((receipt_value[item][4]), ',')}\n''')
        # 하단 총액 폰트 사이즈 변경            
        form.setFontPointSize(20)
        self.ui.salesText.setCurrentCharFormat(form)
        # 총액 표시
        self.ui.salesText.appendPlainText(f'''총액 : {format((receipt_value[item][5]), ',')}원''')
        # 주문번호, 제품 이름, 제품 개수, 주문 시각, 단품 총 가격, 총합 가격
        # SELECT oim.ord_idx
        #      , prd.prdName
        #      , oim.quantity
        #      , ods.order_dt
        #      , oim.total_price
        #      , ods.order_price
        #   FROM orderitems as oim
        #  INNER JOIN orders as ods
        #     ON oim.ord_idx = ods.ord_idx
        #  INNER JOIN products as prd
        #     ON prd.prd_idx = oim.prd_idx
        #  WHERE oim.ord_idx = {self.ui.salesListWidget.currentItem().text()}

    # 판매 기록 저장 
    def commit_Button(self):
        button = self.sender()
        print(f'Button "{button.objectName()}" pressed!')
        if self.ui.tableWidget.rowCount() == 0:
            self.ui.label.setText("제품을 선택해주세요")
            return
        else:
            self.insert_DB()
            sum_Result = 0
            for i in range (self.ui.tableWidget.rowCount()):
                self.ui.tableWidget.removeRow(0)
                # print(f"Delete_'{i}'_Row")
            self.ui.label.setText('합계 : ' + str(sum_Result))
            # 데이터 갱신해서 받아오기
            # orderitems = self.orderitems_initDB()
            orders = self.orders_initDB()
            # 최근 주문 번호를 불러온다음 리스트 위젯에 추가 f"{orders[-1][0]}"
            self.ui.salesListWidget.addItem(f"\n주문 번호 : {orders[-1][0]} \n시간 : {orders[-1][1]}\n")
  
    # 리스트 위젯 주문 완료건 삭제 이벤트
    def del_List_Button_Clicked(self):
        # 현재 선택되어있는 Row에 해당하는 Item 삭제
        self.ui.salesListWidget.takeItem(self.ui.salesListWidget.currentRow())
        # print(f"delete : {self.ui.salesListWidget.currentRow()}/row Item")
        # 제품 영수증 목록 삭제
        self.ui.salesText.setPlainText(None)
        # print(f"delete salesText content")

##############################################################################################
    # 캘린더 위젯 날짜 선택 이벤트
    def select_Date_Calendar(self):
        # 조회 기록 라벨 초기화
        self.ui.Lbl_All_OrdersNum.clear()
        # 캘린더를 선택 했을 때 날짜 범위(2개)를 선택 할 수 있어야 되고
        # 라벨에 기록이 남아야 된다.
        now_Select_Date = self.ui.cal_daily_sales.selectedDate().toString(f'yyyy년 M월 d일')
        cal_Daily_Sales_Select_Date = QDate(int(now_Select_Date.split(' ')[0].replace('년', '')),
                                            int(now_Select_Date.split(' ')[1].replace('월', '')),
                                            int(now_Select_Date.split(' ')[2].replace('일', '')))
        # Lbl_To 라벨이 빈칸이 아닐 경우
        if self.ui.Lbl_To.text() is not '':
            # Lbl_To QDate 형변환
            Lbl_To_Text_Date = QDate(int(self.ui.Lbl_To.text().split(' ')[0].replace('년', '')),
                                     int(self.ui.Lbl_To.text().split(' ')[1].replace('월', '')),
                                     int(self.ui.Lbl_To.text().split(' ')[2].replace('일', '')))
            Lbl_From_Text_Date = QDate(int(self.ui.Lbl_From.text().split(' ')[0].replace('년', '')),
                                       int(self.ui.Lbl_From.text().split(' ')[1].replace('월', '')),
                                       int(self.ui.Lbl_From.text().split(' ')[2].replace('일', '')))
            # 기존의 Lbl_To 달력에서 선택된 날짜보다 미래라면
            if  Lbl_To_Text_Date > cal_Daily_Sales_Select_Date:
                # Lbl_To 라벨 값과 비교 :
                # 선택된 날짜가 Lbl_From보다 과거라면  
                # 기존의 Lbl_From의 날짜 데이터를 선택된 날짜로 변경
                if Lbl_From_Text_Date > cal_Daily_Sales_Select_Date:
                    self.ui.Lbl_From.setText(now_Select_Date + ' 부터')
                # 선택된 날짜가 Lbl_From보다 크면
                # Lbl_From, Lbl_To 값 사이의 날짜이기 때문에 패스
                elif Lbl_From_Text_Date <= cal_Daily_Sales_Select_Date:
                    pass
            # 기존의 Lbl_To 달력에서 선택된 날짜보다 과거라면
            elif Lbl_To_Text_Date < cal_Daily_Sales_Select_Date:
                self.ui.Lbl_To.setText(now_Select_Date + ' 까지')
        # Lbl_From 라벨이 빈칸일 경우
        elif self.ui.Lbl_From.text() is '':
            # 텍스트를 날짜 형식으로 채운다.
            self.ui.Lbl_From.setText(now_Select_Date + ' 조회')
        # Lbl_From 라벨이 빈칸이 아닐 경우
        elif self.ui.Lbl_From.text() is not '':
            Lbl_From_Text_Date = QDate(int(self.ui.Lbl_From.text().split(' ')[0].replace('년', '')),
                                     int(self.ui.Lbl_From.text().split(' ')[1].replace('월', '')),
                                     int(self.ui.Lbl_From.text().split(' ')[2].replace('일', '')))
            # Lbl_To 라벨이 비어있는 경우
            if self.ui.Lbl_To.text() is '':
                # cal_Daily_Sales 캘린더에서 선택된 날짜가 Lbl_From 라벨 날짜 보다 미래일 경우
                if cal_Daily_Sales_Select_Date > Lbl_From_Text_Date:
                    # 조회 단어 교체
                    self.ui.Lbl_From.setText(self.ui.Lbl_From.text().replace('조회', '부터'))
                    # Lbl_To 라벨에 cal_Daily_Sales 캘린더에서 선택된 날짜 대입
                    self.ui.Lbl_To.setText(now_Select_Date + ' 까지')
                elif cal_Daily_Sales_Select_Date < Lbl_From_Text_Date:
                    # 조회 단어 교체
                    self.ui.Lbl_To.setText(self.ui.Lbl_From.text().replace(' 조회', ' 까지'))
                    # Lbl_To 라벨에 기존의 날짜를 옮겨 적고 Lbl_From에 선택된 날짜를 대입.
                    self.ui.Lbl_From.setText(now_Select_Date + ' 부터')
                # 기존의 Lbl_From 라벨 값보다 날짜가 클 경우
                # cal_Daily_Sales 캘린더에서 선택된 날짜가 Lbl_From 라벨 날짜과 같을 경우
                else:
                    # Lbl_To 라벨에 cal_Daily_Sales 캘린더에서 선택된 날짜 대입
                    self.ui.Lbl_To.setText(now_Select_Date + ' 까지')

    # 날짜 선택 초기화 이벤트
    def reset_Order_Using_Calendar(self):
        # 라벨 텍스트 초기화
        self.ui.Lbl_From.setText('')
        self.ui.Lbl_To.setText('')
        self.ui.Lbl_All_OrdersNum.setText('')
        # 리스트 초기화
        self.ui.lsw_daily_sales.clear()
        # 텍스트 에디터 초기화
        self.ui.pte_daily_sales.clear()

    # 주문번호 리스트 위젯 갱신 이벤트
    def make_OrderNum_Listwidget_Button(self):
        button = self.sender()
        print(f'Button "{button.objectName()}" pressed!')
        if self.ui.Lbl_From.text() == '' and self.ui.Lbl_To.text() == '':
            return
        # 폰트 사이즈 변경
        self.ui.lsw_daily_sales.setStyleSheet(u'''#pagesContainer QListWidget {
                                                    background-color: transparent;;
                                                    border-radius: 7px;
                                                    border: 1px solid gray; 
                                                    color: black;
                                                    selection-color: rgb(0, 0, 0);
                                                    font: NanumGothic;
                                                    font-size: 15px;
                                                }
                                                #pagesContainer QListView::item:selected { 
                                                    background-color: #E39500; 
                                                    border-radius: 7px;
                                                    border: 2px solid black;
                                                }
                                                #pagesContainer QListView::item:hover { 
                                                    background-color: #FFC777; 
                                                    border-radius: 7px;
                                                    border: 2px solid black;
                                                }''')
        # 주문 번호 받아오기
        order_Numbers = self.search_OrderNum_Using_Calendar()
        for orders in order_Numbers:
            # 최근 주문 번호를 불러온다음 리스트 위젯에 추가 f"{orders[-1][0]}"
            self.ui.lsw_daily_sales.addItem(f"\n주문 번호 : {orders[0]} \n시간 : {orders[1]}\n")
        # 조회 건수 출력
        self.ui.Lbl_All_OrdersNum.setText(f"{len(order_Numbers)}건 조회 완료")
    
    # 일정 기간 내 주문 번호 출력 이벤트
    def search_OrderNum_Using_Calendar(self):

        self.ui.lsw_daily_sales.clear()        
        # db 위치 확인 바람
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()
        # 라벨에 날짜가 두 개 다 채워져있을 때
        if self.ui.Lbl_From.text() != '' and self.ui.Lbl_To.text() != '':                  
            search_Order_Number_Query = f'''SELECT ods.ord_idx
                                                     , ods.order_dt
                                                  FROM orders as ods
                                                 WHERE STR_TO_DATE(ods.order_dt, '%Y년 %m월 %d일') BETWEEN STR_TO_DATE('{self.ui.Lbl_From.text()}', '%Y년 %m월 %d일') AND STR_TO_DATE('{self.ui.Lbl_To.text()}', '%Y년 %m월 %d일')
                                                 ORDER BY ods.ord_idx DESC'''
        # 라벨에 날짜가 한 개만 채워져있을 때
        elif self.ui.Lbl_From.text() != '' or self.ui.Lbl_To.text() != '':                          
            search_Order_Number_Query = f'''SELECT ods.ord_idx
                                                     , ods.order_dt
                                                  FROM orders as ods
                                                 WHERE STR_TO_DATE(ods.order_dt, '%Y년 %m월 %d일') = STR_TO_DATE('{self.ui.Lbl_From.text()}', '%Y년 %m월 %d일')
                                                 ORDER BY ods.ord_idx DESC'''
        # 주문 번호 가져오기
        cur.execute(search_Order_Number_Query)
        order_Numbers = cur.fetchall()
        
        self.conn.close()
        return order_Numbers
    
    #  기간 내 주문 기록 불러오기
    def search_OrderRecord_Using_Calendar(self):
        self.ui.pte_daily_sales.clear()
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()
         # 기간 내 주문 기록 불러오기 - 단일 날짜
        search_Order_Using_Calendar_Single_Query = f'''SELECT oim.ord_idx
                                                            , prd.prdName
                                                            , prd.prdPrice
                                                            , oim.quantity
                                                            , oim.total_price
                                                            , ods.order_price
                                                            , ods.order_dt
                                                        FROM orderitems as oim
                                                        INNER JOIN orders as ods
                                                            ON oim.ord_idx = ods.ord_idx
                                                        INNER JOIN products as prd
                                                            ON prd.prd_idx = oim.prd_idx
                                                        WHERE STR_TO_DATE(ods.order_dt, '%Y년 %m월 %d일') = STR_TO_DATE('{' '.join(self.ui.lsw_daily_sales.currentItem().text().split(' ')[6:9])}', '%Y년 %m월 %d일')
                                                            AND ods.ord_idx = {self.ui.lsw_daily_sales.currentItem().text().split(' ')[3]}'''
        # 주문번호 중복 없이 정해진 기간 내 출력하는 쿼리문
        cur.execute(search_Order_Using_Calendar_Single_Query)
        order_List = cur.fetchall()        

        if order_List is None:
            print('출력 할 결과가 없습니다.')
        else:
            # QTextCharFormat 객체 생성
            form = QTextCharFormat() 
            # 폰트 사이즈 변경
            form.setFontPointSize(20)
            # 폰트 적용
            self.ui.pte_daily_sales.setCurrentCharFormat(form)
            # 상단 타이틀 표시
            self.ui.pte_daily_sales.setPlainText(f'주문 번호 : {order_List[0][0]}\n\n상품명\t\t  단가\t  수량\t   금액\n')
            # 폰트 적용
            form.setFontPointSize(15)
            # 폰트 적용
            self.ui.pte_daily_sales.setCurrentCharFormat(form)
            # 글자 수 별로 탭 횟수 차등 
            for item in range(len(order_List)):
                if len(order_List[item][1]) <= 2:
                    self.ui.pte_daily_sales.appendPlainText(f'''{order_List[item][1]}\t\t  {format((order_List[item][2]), ',')}\t  {format((order_List[item][3]), ',')}\t   {format((order_List[item][4]), ',')}\n''')
                elif len(order_List[item][1]) == 3:
                    self.ui.pte_daily_sales.appendPlainText(f'''{order_List[item][1]}\t\t  {format((order_List[item][2]), ',')}\t  {format((order_List[item][3]), ',')}\t   {format((order_List[item][4]), ',')}\n''')
                elif len(order_List[item][1]) > 3:
                    self.ui.pte_daily_sales.appendPlainText(f'''{order_List[item][1]}\t  {format((order_List[item][2]), ',')}\t  {format((order_List[item][3]), ',')}\t   {format((order_List[item][4]), ',')}\n''')
            
            # 하단 총액 폰트 사이즈 변경            
            form.setFontPointSize(20)
            self.ui.pte_daily_sales.setCurrentCharFormat(form)
            # 총액 표시
            self.ui.pte_daily_sales.appendPlainText(f'''총액 : {format((order_List[item][5]), ',')}원''')
#############################################################################################

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
        btn_Add.setMinimumSize(QSize(60, 27))
        btn_Add.setMaximumSize(QSize(60, 27))
        btn_Add.setStyleSheet(u'''QPushButton{
                                    color: #f8f8f2;
                                    background-color: #FFC777;
                                    border: 2px solid rgb(255, 190, 11);
                                    border-radius: 5px;
                                    padding: 5px;
                                }
                                QPushButton:Hover{
                                    color: rgb(255, 255, 255);
                                    background-color: #D69803;
                                    border: 2px solid #D69803;
                                    border-radius: 5px;
                                }
                                QPushButton:Pressed{
                                    color: rgb(255, 255, 255);
                                    background-color: #FFC777;
                                    border: 2px solid rgb(255, 190, 11);
                                    border-radius: 5px;
                                }''')
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
        # print(f'Make Button "{btn_Add.objectName()}"!')
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
        btn_Sub.setMinimumSize(QSize(60, 27))
        btn_Sub.setMaximumSize(QSize(60, 27))
        # 버튼 내 텍스트 변경 부분
        btn_Sub.setText('제거')
        btn_Sub.setStyleSheet(u'''QPushButton{
                                    color: #f8f8f2;
                                    background-color: #FFC777;
                                    border: 2px solid rgb(255, 190, 11);
                                    border-radius: 5px;
                                    padding: 5px;
                                }
                                QPushButton:Hover{
                                    color: rgb(255, 255, 255);
                                    background-color: #D69803;
                                    border: 2px solid #D69803;
                                    border-radius: 5px;
                                }
                                QPushButton:Pressed{
                                    color: rgb(255, 255, 255);
                                    background-color: #FFC777;
                                    border: 2px solid rgb(255, 190, 11);
                                    border-radius: 5px;
                                }''')
        btn_Sub.clicked.connect(self.row_Button_Click)
        # 레이아웃에 버튼 삽입
        layout.addWidget(btn_Sub)
        # 버튼 가운데로 세팅 하기 위해 마진 설정
        layout.setContentsMargins(0, 0, 0, 0)
        # 위젯에 레이아웃 담기
        cellWidget.setLayout(layout)
        # 만들어진 위젯을 리턴
        # print(f'Make Button "{btn_Sub.objectName()}"!')
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
        btn_Del.setMinimumSize(QSize(30, 27))
        btn_Del.setMaximumSize(QSize(30, 27))
        # 버튼 내 텍스트 변경 부분
        btn_Del.setText('X')
        btn_Del.setStyleSheet(u'''QPushButton{
                                    color: #f8f8f2;
                                    background-color: #FFC777;
                                    border: 2px solid rgb(255, 190, 11);
                                    border-radius: 5px;
                                    padding: 5px;
                                }
                                QPushButton:Hover{
                                    color: rgb(255, 255, 255);
                                    background-color: #D69803;
                                    border: 2px solid #D69803;
                                    border-radius: 5px;
                                }
                                QPushButton:Pressed{
                                    color: rgb(255, 255, 255);
                                    background-color: #FFC777;
                                    border: 2px solid rgb(255, 190, 11);
                                    border-radius: 5px;
                                }''')
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



    # DB 접속 및 products 초기화
    def products_initDB(self):
        # db 위치 확인 바람
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()
        # 제품 가격 불러와서 설정하기

        # calckiosk_new.products db 접속 해서 가격 가져오기 
        # 2023.06.01 데이터 베이스 수정으로 테이블 변경
        # 제품 번호, 제품 이름, 단품 가격
        products_SELECT_Query = '''SELECT prd_idx
                                        , prdName
                                        , prdPrice
                                        FROM products;'''
        cur.execute(products_SELECT_Query)
        products = cur.fetchall()

        self.conn.close() # 프로그램 종료할 때
        return products
    
    # 제품 가격 정보 받기 위한 DB 쿼리문
    def orderitems_initDB(self):
        # db 위치 확인 바람
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()
        # 제품 가격 불러와서 설정하기
        # orderitems (단품 전체 가격)
        # idx, 제품 번호, 주문 번호, 개수, 총가격
        # oim_idx, prd_idx, ord_idx, quantity, total_price
        orderitems_SELECT_Query =''' SELECT oim_idx
                                          , prd_idx
                                          , ord_idx
                                          , quantity
                                          , total_price
                                       FROM orderitems;'''
        cur.execute(orderitems_SELECT_Query)
        products = cur.fetchall()
        
        self.conn.close() # 프로그램 종료할 때
        return products
    
    # 주문 번호 받기 위한 DB 쿼리문
    def orders_initDB(self):
        # db 위치 확인 바람
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()

        # orders (주문번호처리)
        # idx, 주문 날짜, 주문 가격
        # ord_idx, order_dt, order_price
        orders_SELECT_Query = ''' SELECT ord_idx
                                       , order_dt
                                       , order_price
                                    FROM orders;'''
        
        cur.execute(orders_SELECT_Query)
        ord_row = cur.fetchall()

        self.conn.close() # 프로그램 종료할 때
        return ord_row

    # 제품 가격 업데이트를 위한 쿼리문은 완성 변수 설정 필요
    def update_DB(self):
        # db 위치 확인 바람
        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        cur = self.conn.cursor()
        update_query = '''UPDATE calckiosk.products
                             SET prdName = %s
                               , prdPrice = %s
                           WHERE prd_idx = %s;'''
            
        menu_index = None;
        update_query_value = ((products[menu_index])[1], int(products[menu_index])[2], int(products[menu_index])[0])
        cur.execute(update_query, update_query_value)
        products = cur.fetchall()            
        self.conn.commit()
        self.conn.close() # 프로그램 종료할 때
        return products

    # DB에 INSERT 완성 2023-06-03
    def insert_DB(self):
        insert_Orders_DB = []
        insert_Orderitems_DB = []
        # python 3.7 특징 - https://github.com/sphinx-doc/sphinx/issues/2102
        today = datetime.now().strftime(f'%Y년 %m월 %d일 %H시 %M분 %S초'.encode('unicode-escape').decode()).encode().decode('unicode-escape')

        self.conn = pymysql.connect(host='localhost', user='root', password='12345',
                                        db='calckiosk_new', charset='utf8')
        # orders - ord_idx(주문번호 - AI), order_dt(주문날짜), order_price(주문총액)
        orders_query = f'''INSERT INTO orders 
                                ( order_dt
                                , order_price)
                           VALUES
                                ( %s
                                , %s)'''
        # orderitems - oim_idx(아이템 테이블 primary KEY - AI), prd_idx(제품 번호 - table = products), 
        # ord_idx(주문 번호 - table = orders), quantity(제품 주문 개수 - 해당 제품), total_price(해당 제품 총액)
        orderitems_Insert_Query = f'''INSERT INTO orderitems
                                      SELECT 0
                                           , (SELECT prd_idx
                                                FROM products
                                               WHERE prdName = %s)
                                           , (SELECT ord_idx
                                                FROM orders
                                               ORDER BY ord_idx DESC LIMIT 1)
                                           , %s
                                           , %s '''
        cur = self.conn.cursor()
        # 주문 번호 선 기입 - Orders
        # 리스트 insert_Orders_DB에 값 넣기
        insert_Orders_DB.append((today, self.ui.label.text().split(" : ")[1].replace(',' ,'')))
        # 쿼리문 실행
        cur.execute(orders_query, insert_Orders_DB[0])
        # 데이터 값 변경이 있을 때 commit 해줘야한다.
        self.conn.commit()
        # 제품 개수 및 개별 가격 주문 번호랑 함께 기입 - Orderitems
        # 테이블 위젯안에 있는 row 개수만큼 반복
        cur = self.conn.cursor()
        for i in range(self.ui.tableWidget.rowCount()):
            # 제품 판매 가격이 비어있다면
            if self.ui.tableWidget.item(i, 3) is not None:
                # 리스트 insert_Orderitems_DB에 값 넣기
                insert_Orderitems_DB.append((self.ui.tableWidget.item(i, 0).text(), self.ui.tableWidget.item(i, 2).text(), self.ui.tableWidget.item(i, 3).text().replace(',' ,'')))
                print(f"Insert {i+1}_row  : Complete!")
                # 쿼리문 실행
                cur.execute(orderitems_Insert_Query, insert_Orderitems_DB[i])
            else:
                break
        # 데이터 값 변경이 있을 때 commit 해줘야한다.
        self.conn.commit()    
        self.conn.close() # 프로그램 종료할 때

if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setWindowIcon(QIcon("bread.png"))
    window = MainWindow()
    sys.exit(app.exec_()) 