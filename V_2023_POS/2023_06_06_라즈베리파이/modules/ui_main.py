# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'mainWtTLjx.ui'
##
## Created by: Qt User Interface Compiler version 6.4.3
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################
# 개인적으로 추가해서 넣은 함수 정리하는 구역
# MainWindow.setWindowFlag(QtCore.Qt.WindowType.FramelessWindowHint)
#
# qss_file = './themes/py_dracula_dark.qss'  # QSS 파일 경로
# 디자인 파일 읽어서 자동으로 적용
# with open(qss_file, 'r') as f:
#         style_sheet = f.read()
# self.styleSheet.setStyleSheet(style_sheet)
# self.appMargins = QVBoxLayout(self.styleSheet)
#
# 테이블 위젯 내용 수정 금지
# self.tableWidget.setEditTriggers(QAbstractItemView.NoEditTriggers)
################################################################################
from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtWidgets import QTableWidget
from resources_rc import *

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(1920, 1200)
        sizePolicy = QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(MainWindow.sizePolicy().hasHeightForWidth())
        MainWindow.setSizePolicy(sizePolicy)
        MainWindow.setMinimumSize(QSize(1920, 1200))
        MainWindow.setMaximumSize(QSize(1920, 1200))
        MainWindow.setSizeIncrement(QSize(0, 0))
        MainWindow.setBaseSize(QSize(1920, 1200))
        font = QFont()
        font.setFamily(u"\ub098\ub214\uace0\ub515")
        font.setPointSize(10)
        MainWindow.setFont(font)
        MainWindow.setTabletTracking(True)
        MainWindow.setContextMenuPolicy(Qt.NoContextMenu)
        icon = QIcon()
        icon.addFile(u":/images/images/images/bread40.png", QSize(), QIcon.Normal, QIcon.Off)
        MainWindow.setWindowIcon(icon)
        MainWindow.setUnifiedTitleAndToolBarOnMac(True)
        self.styleSheet = QWidget(MainWindow)
        self.styleSheet.setObjectName(u"styleSheet")
        font1 = QFont()
        font1.setFamily(u"NanumGothic")
        font1.setPointSize(10)
        font1.setBold(False)
        font1.setItalic(False)
        self.styleSheet.setFont(font1)

        qss_file = './themes/py_dracula_light.qss'  # QSS 파일 경로

        with open(qss_file, 'r') as f:
                style_sheet = f.read()
        self.styleSheet.setStyleSheet(style_sheet)

        self.appMargins = QVBoxLayout(self.styleSheet)
        self.appMargins.setSpacing(0)
        self.appMargins.setObjectName(u"appMargins")
        self.appMargins.setContentsMargins(10, 10, 10, 10)
        self.bgApp = QFrame(self.styleSheet)
        self.bgApp.setObjectName(u"bgApp")
        self.bgApp.setStyleSheet(u"")
        self.bgApp.setFrameShape(QFrame.NoFrame)
        self.bgApp.setFrameShadow(QFrame.Raised)
        self.appLayout = QHBoxLayout(self.bgApp)
        self.appLayout.setSpacing(0)
        self.appLayout.setObjectName(u"appLayout")
        self.appLayout.setContentsMargins(0, 0, 0, 0)
        self.leftMenuBg = QFrame(self.bgApp)
        self.leftMenuBg.setObjectName(u"leftMenuBg")
        self.leftMenuBg.setMinimumSize(QSize(120, 0))
        self.leftMenuBg.setMaximumSize(QSize(120, 16777215))
        self.leftMenuBg.setFrameShape(QFrame.NoFrame)
        self.leftMenuBg.setFrameShadow(QFrame.Raised)
        self.verticalLayout_3 = QVBoxLayout(self.leftMenuBg)
        self.verticalLayout_3.setSpacing(0)
        self.verticalLayout_3.setObjectName(u"verticalLayout_3")
        self.verticalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.topLogoInfo = QFrame(self.leftMenuBg)
        self.topLogoInfo.setObjectName(u"topLogoInfo")
        self.topLogoInfo.setMinimumSize(QSize(150, 50))
        self.topLogoInfo.setMaximumSize(QSize(16777215, 50))
        self.topLogoInfo.setFrameShape(QFrame.NoFrame)
        self.topLogoInfo.setFrameShadow(QFrame.Raised)
        self.topLogo = QFrame(self.topLogoInfo)
        self.topLogo.setObjectName(u"topLogo")
        self.topLogo.setGeometry(QRect(10, 5, 42, 42))
        self.topLogo.setMinimumSize(QSize(42, 42))
        self.topLogo.setMaximumSize(QSize(42, 42))
        self.topLogo.setFrameShape(QFrame.NoFrame)
        self.topLogo.setFrameShadow(QFrame.Raised)
        self.titleLeftApp = QLabel(self.topLogoInfo)
        self.titleLeftApp.setObjectName(u"titleLeftApp")
        self.titleLeftApp.setGeometry(QRect(70, 8, 160, 20))
        font2 = QFont()
        font2.setFamily(u"NanumGothic")
        font2.setPointSize(12)
        font2.setBold(False)
        font2.setItalic(False)
        self.titleLeftApp.setFont(font2)
        self.titleLeftApp.setAlignment(Qt.AlignLeading|Qt.AlignLeft|Qt.AlignTop)
        self.titleLeftDescription = QLabel(self.topLogoInfo)
        self.titleLeftDescription.setObjectName(u"titleLeftDescription")
        self.titleLeftDescription.setGeometry(QRect(70, 27, 160, 16))
        self.titleLeftDescription.setMaximumSize(QSize(16777215, 16))
        font3 = QFont()
        font3.setFamily(u"NanumGothic")
        font3.setPointSize(8)
        font3.setBold(False)
        font3.setItalic(False)
        self.titleLeftDescription.setFont(font3)
        self.titleLeftDescription.setAlignment(Qt.AlignLeading|Qt.AlignLeft|Qt.AlignTop)

        self.verticalLayout_3.addWidget(self.topLogoInfo)

        self.leftMenuFrame = QFrame(self.leftMenuBg)
        self.leftMenuFrame.setObjectName(u"leftMenuFrame")
        self.leftMenuFrame.setFrameShape(QFrame.NoFrame)
        self.leftMenuFrame.setFrameShadow(QFrame.Raised)
        self.verticalMenuLayout = QVBoxLayout(self.leftMenuFrame)
        self.verticalMenuLayout.setSpacing(0)
        self.verticalMenuLayout.setObjectName(u"verticalMenuLayout")
        self.verticalMenuLayout.setContentsMargins(0, 0, 0, 0)

        sizePolicy1 = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)
        sizePolicy1.setHorizontalStretch(0)
        sizePolicy1.setVerticalStretch(0)

        self.topMenu = QFrame(self.leftMenuFrame)
        self.topMenu.setObjectName(u"topMenu")
        self.topMenu.setFrameShape(QFrame.NoFrame)
        self.topMenu.setFrameShadow(QFrame.Raised)
        self.verticalLayout_8 = QVBoxLayout(self.topMenu)
        self.verticalLayout_8.setSpacing(0)
        self.verticalLayout_8.setObjectName(u"verticalLayout_8")
        self.verticalLayout_8.setContentsMargins(0, 0, 0, 0)
        self.btn_home = QPushButton(self.topMenu)
        self.btn_home.setObjectName(u"btn_home")
        sizePolicy1.setHeightForWidth(self.btn_home.sizePolicy().hasHeightForWidth())
        self.btn_home.setSizePolicy(sizePolicy1)
        self.btn_home.setMinimumSize(QSize(0, 100))
        self.btn_home.setFont(font1)
        self.btn_home.setCursor(QCursor(Qt.PointingHandCursor))
        self.btn_home.setLayoutDirection(Qt.LeftToRight)
        self.btn_home.setStyleSheet(u"background-image: url(:/icon/images/icons/cil-home.png);"
                                     "color: ffffff;"
                                     "font: NanumGothic;"
                                     "font-size: 35px;")

        self.verticalLayout_8.addWidget(self.btn_home)

        self.btn_nowSales = QPushButton(self.topMenu)
        self.btn_nowSales.setObjectName(u"btn_nowSales")
        sizePolicy1.setHeightForWidth(self.btn_nowSales.sizePolicy().hasHeightForWidth())
        self.btn_nowSales.setSizePolicy(sizePolicy1)
        self.btn_nowSales.setMinimumSize(QSize(0, 100))
        self.btn_nowSales.setFont(font1)
        self.btn_nowSales.setCursor(QCursor(Qt.PointingHandCursor))
        self.btn_nowSales.setLayoutDirection(Qt.LeftToRight)
        self.btn_nowSales.setStyleSheet(u"background-image: url(:/icon/images/icons/cil-calendar-check.png);"
                                         "color: ffffff;"
                                         "font: NanumGothic;"
                                         "font-size: 35px;")

        self.verticalLayout_8.addWidget(self.btn_nowSales)

        self.btn_postSales = QPushButton(self.topMenu)
        self.btn_postSales.setObjectName(u"btn_postSales")
        sizePolicy1.setHeightForWidth(self.btn_postSales.sizePolicy().hasHeightForWidth())
        self.btn_postSales.setSizePolicy(sizePolicy1)
        self.btn_postSales.setMinimumSize(QSize(0, 100))
        self.btn_postSales.setFont(font1)
        self.btn_postSales.setCursor(QCursor(Qt.PointingHandCursor))
        self.btn_postSales.setLayoutDirection(Qt.LeftToRight)
        self.btn_postSales.setStyleSheet(u"background-image: url(:/icon/images/icons/cil-chart-line.png);"
                                          "color: ffffff;"
                                          "font: NanumGothic;"
                                          "font-size: 35px;")

        self.verticalLayout_8.addWidget(self.btn_postSales)

        self.btn_exit = QPushButton(self.topMenu)
        self.btn_exit.setObjectName(u"btn_exit")
        sizePolicy1.setHeightForWidth(self.btn_exit.sizePolicy().hasHeightForWidth())
        self.btn_exit.setSizePolicy(sizePolicy1)
        self.btn_exit.setMinimumSize(QSize(0, 100))
        self.btn_exit.setFont(font1)
        self.btn_exit.setCursor(QCursor(Qt.PointingHandCursor))
        self.btn_exit.setLayoutDirection(Qt.LeftToRight)
        self.btn_exit.setStyleSheet(u"background-image: url(:/icon/images/icons/cil-x.png);"
                                     "color: ffffff;"
                                     "font: NanumGothic;"
                                     "font-size: 35px;")

        self.verticalLayout_8.addWidget(self.btn_exit)


        self.verticalMenuLayout.addWidget(self.topMenu, 0, Qt.AlignTop)

        self.bottomMenu = QFrame(self.leftMenuFrame)
        self.bottomMenu.setObjectName(u"bottomMenu")
        self.bottomMenu.setFrameShape(QFrame.NoFrame)
        self.bottomMenu.setFrameShadow(QFrame.Raised)
        self.verticalLayout_9 = QVBoxLayout(self.bottomMenu)
        self.verticalLayout_9.setSpacing(0)
        self.verticalLayout_9.setObjectName(u"verticalLayout_9")
        self.verticalLayout_9.setContentsMargins(0, 0, 0, 0)
        self.toggleLeftBox = QPushButton(self.bottomMenu)
        self.toggleLeftBox.setObjectName(u"toggleLeftBox")
        sizePolicy1.setHeightForWidth(self.toggleLeftBox.sizePolicy().hasHeightForWidth())
        self.toggleLeftBox.setSizePolicy(sizePolicy1)
        self.toggleLeftBox.setMinimumSize(QSize(0, 45))
        self.toggleLeftBox.setFont(font1)
        self.toggleLeftBox.setCursor(QCursor(Qt.PointingHandCursor))
        self.toggleLeftBox.setLayoutDirection(Qt.LeftToRight)
        self.toggleLeftBox.setStyleSheet(u"background-image: url(:/icon/images/icons/icon_settings.png);")

        self.verticalLayout_9.addWidget(self.toggleLeftBox)


        self.verticalMenuLayout.addWidget(self.bottomMenu, 0, Qt.AlignBottom)


        self.verticalLayout_3.addWidget(self.leftMenuFrame)


        self.appLayout.addWidget(self.leftMenuBg)

        self.contentBox = QFrame(self.bgApp)
        self.contentBox.setObjectName(u"contentBox")
        self.contentBox.setFrameShape(QFrame.NoFrame)
        self.contentBox.setFrameShadow(QFrame.Raised)
        self.verticalLayout_2 = QVBoxLayout(self.contentBox)
        self.verticalLayout_2.setSpacing(0)
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.contentTopBg = QFrame(self.contentBox)
        self.contentTopBg.setObjectName(u"contentTopBg")
        self.contentTopBg.setMinimumSize(QSize(0, 50))
        self.contentTopBg.setMaximumSize(QSize(16777215, 50))
        self.contentTopBg.setFrameShape(QFrame.NoFrame)
        self.contentTopBg.setFrameShadow(QFrame.Raised)
        self.horizontalLayout = QHBoxLayout(self.contentTopBg)
        self.horizontalLayout.setSpacing(0)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.horizontalLayout.setContentsMargins(0, 0, 10, 0)
        self.leftBox = QFrame(self.contentTopBg)
        self.leftBox.setObjectName(u"leftBox")
        sizePolicy2 = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        sizePolicy2.setHorizontalStretch(0)
        sizePolicy2.setVerticalStretch(0)
        sizePolicy2.setHeightForWidth(self.leftBox.sizePolicy().hasHeightForWidth())
        self.leftBox.setSizePolicy(sizePolicy2)
        self.leftBox.setFrameShape(QFrame.NoFrame)
        self.leftBox.setFrameShadow(QFrame.Raised)
        self.horizontalLayout_3 = QHBoxLayout(self.leftBox)
        self.horizontalLayout_3.setSpacing(0)
        self.horizontalLayout_3.setObjectName(u"horizontalLayout_3")
        self.horizontalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.titleRightInfo = QLabel(self.leftBox)
        self.titleRightInfo.setObjectName(u"titleRightInfo")
        sizePolicy3 = QSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)
        sizePolicy3.setHorizontalStretch(0)
        sizePolicy3.setVerticalStretch(0)
        sizePolicy3.setHeightForWidth(self.titleRightInfo.sizePolicy().hasHeightForWidth())
        self.titleRightInfo.setSizePolicy(sizePolicy3)
        self.titleRightInfo.setMaximumSize(QSize(16777215, 45))
        self.titleRightInfo.setFont(font1)
        self.titleRightInfo.setAlignment(Qt.AlignLeading|Qt.AlignLeft|Qt.AlignVCenter)

        self.horizontalLayout_3.addWidget(self.titleRightInfo)


        self.horizontalLayout.addWidget(self.leftBox)

        self.rightButtons = QFrame(self.contentTopBg)
        self.rightButtons.setObjectName(u"rightButtons")
        self.rightButtons.setMinimumSize(QSize(0, 28))
        self.rightButtons.setFrameShape(QFrame.NoFrame)
        self.rightButtons.setFrameShadow(QFrame.Raised)
        self.horizontalLayout_2 = QHBoxLayout(self.rightButtons)
        self.horizontalLayout_2.setSpacing(5)
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")
        self.horizontalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.settingsTopBtn = QPushButton(self.rightButtons)
        self.settingsTopBtn.setObjectName(u"settingsTopBtn")
        self.settingsTopBtn.setMinimumSize(QSize(28, 28))
        self.settingsTopBtn.setMaximumSize(QSize(28, 28))
        self.settingsTopBtn.setCursor(QCursor(Qt.PointingHandCursor))
        self.settingsTopBtn.setStyleSheet(u"image:url(:/icon/images/icons/cil-settings.png)")
        icon1 = QIcon()
        icon1.addFile(u":/icons/images/icons/icon_settings.png", QSize(), QIcon.Normal, QIcon.Off)
        self.settingsTopBtn.setIcon(icon1)
        self.settingsTopBtn.setIconSize(QSize(20, 20))

        self.horizontalLayout_2.addWidget(self.settingsTopBtn)

        self.minimizeAppBtn = QPushButton(self.rightButtons)
        self.minimizeAppBtn.setObjectName(u"minimizeAppBtn")
        self.minimizeAppBtn.setMinimumSize(QSize(28, 28))
        self.minimizeAppBtn.setMaximumSize(QSize(28, 28))
        self.minimizeAppBtn.setCursor(QCursor(Qt.PointingHandCursor))
        self.minimizeAppBtn.setStyleSheet(u"image:url(:/icon/images/icons/cil-window-minimize.png)")
        icon2 = QIcon()
        icon2.addFile(u":/icons/images/icons/icon_minimize.png", QSize(), QIcon.Normal, QIcon.Off)
        self.minimizeAppBtn.setIcon(icon2)
        self.minimizeAppBtn.setIconSize(QSize(20, 20))

        self.horizontalLayout_2.addWidget(self.minimizeAppBtn)

        self.maximizeRestoreAppBtn = QPushButton(self.rightButtons)
        self.maximizeRestoreAppBtn.setObjectName(u"maximizeRestoreAppBtn")
        self.maximizeRestoreAppBtn.setMinimumSize(QSize(28, 28))
        self.maximizeRestoreAppBtn.setMaximumSize(QSize(28, 28))
        font4 = QFont()
        font4.setFamily(u"NanumGothic")
        font4.setPointSize(10)
        font4.setBold(False)
        font4.setItalic(False)
        font4.setStyleStrategy(QFont.PreferDefault)
        self.maximizeRestoreAppBtn.setFont(font4)
        self.maximizeRestoreAppBtn.setCursor(QCursor(Qt.PointingHandCursor))
        self.maximizeRestoreAppBtn.setStyleSheet(u"image:url(:/icon/images/icons/cil-window-maximize.png)")
        icon3 = QIcon()
        icon3.addFile(u":/icons/images/icons/icon_maximize.png", QSize(), QIcon.Normal, QIcon.Off)
        self.maximizeRestoreAppBtn.setIcon(icon3)
        self.maximizeRestoreAppBtn.setIconSize(QSize(20, 20))

        self.horizontalLayout_2.addWidget(self.maximizeRestoreAppBtn)

        self.closeAppBtn = QPushButton(self.rightButtons)
        self.closeAppBtn.setObjectName(u"closeAppBtn")
        self.closeAppBtn.setMinimumSize(QSize(28, 28))
        self.closeAppBtn.setMaximumSize(QSize(28, 28))
        self.closeAppBtn.setCursor(QCursor(Qt.PointingHandCursor))
        self.closeAppBtn.setStyleSheet(u"image:url(:/icon/images/icons/cil-x.png)")
        icon4 = QIcon()
        icon4.addFile(u":/icons/images/icons/icon_close.png", QSize(), QIcon.Normal, QIcon.Off)
        self.closeAppBtn.setIcon(icon4)
        self.closeAppBtn.setIconSize(QSize(20, 20))

        self.horizontalLayout_2.addWidget(self.closeAppBtn)


        self.horizontalLayout.addWidget(self.rightButtons, 0, Qt.AlignRight)


        self.verticalLayout_2.addWidget(self.contentTopBg)

        self.contentBottom = QFrame(self.contentBox)
        self.contentBottom.setObjectName(u"contentBottom")
        self.contentBottom.setFrameShape(QFrame.NoFrame)
        self.contentBottom.setFrameShadow(QFrame.Raised)
        self.verticalLayout_6 = QVBoxLayout(self.contentBottom)
        self.verticalLayout_6.setSpacing(0)
        self.verticalLayout_6.setObjectName(u"verticalLayout_6")
        self.verticalLayout_6.setContentsMargins(0, 0, 0, 0)
        self.content = QFrame(self.contentBottom)
        self.content.setObjectName(u"content")
        self.content.setFrameShape(QFrame.NoFrame)
        self.content.setFrameShadow(QFrame.Raised)
        self.horizontalLayout_4 = QHBoxLayout(self.content)
        self.horizontalLayout_4.setSpacing(0)
        self.horizontalLayout_4.setObjectName(u"horizontalLayout_4")
        self.horizontalLayout_4.setContentsMargins(0, 0, 0, 0)
        self.pagesContainer = QFrame(self.content)
        self.pagesContainer.setObjectName(u"pagesContainer")
        self.pagesContainer.setStyleSheet(u"")
        self.pagesContainer.setFrameShape(QFrame.NoFrame)
        self.pagesContainer.setFrameShadow(QFrame.Raised)
        self.verticalLayout_15 = QVBoxLayout(self.pagesContainer)
        self.verticalLayout_15.setSpacing(0)
        self.verticalLayout_15.setObjectName(u"verticalLayout_15")
        self.verticalLayout_15.setContentsMargins(10, 10, 10, 10)
        self.stackedWidget = QStackedWidget(self.pagesContainer)
        self.stackedWidget.setObjectName(u"stackedWidget")
        self.stackedWidget.setStyleSheet(u"background: transparent;")
        self.home = QWidget()
        self.home.setObjectName(u"home")
        self.gridLayout_4 = QGridLayout(self.home)
        self.gridLayout_4.setObjectName(u"gridLayout_4")
        self.horizontalLayout_7 = QHBoxLayout()
        self.horizontalLayout_7.setObjectName(u"horizontalLayout_7")
        self.horizontalLayout_7.setSizeConstraint(QLayout.SetDefaultConstraint)
        self.label = QLabel(self.home)
        self.label.setObjectName(u"label")
        sizePolicy4 = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
        sizePolicy4.setHorizontalStretch(0)
        sizePolicy4.setVerticalStretch(0)
        sizePolicy4.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy4)
        self.label.setMinimumSize(QSize(1000, 150))
        self.label.setMaximumSize(QSize(1000, 150))
        self.label.setBaseSize(QSize(1000, 150))
        font5 = QFont()
        font5.setFamily(u"NanumGothic")
        font5.setBold(False)
        font5.setItalic(False)
        self.label.setFont(font5)

        self.horizontalLayout_7.addWidget(self.label)


        self.gridLayout_4.addLayout(self.horizontalLayout_7, 4, 0, 1, 1)

        self.gridLayout_3 = QGridLayout()
        self.gridLayout_3.setObjectName(u"gridLayout_3")
        self.btn_brezel = QPushButton(self.home)
        self.btn_brezel.setObjectName(u"btn_brezel")
        sizePolicy4.setHeightForWidth(self.btn_brezel.sizePolicy().hasHeightForWidth())
        self.btn_brezel.setSizePolicy(sizePolicy4)
        self.btn_brezel.setMinimumSize(QSize(50, 50))
        self.btn_brezel.setMaximumSize(QSize(300, 300))
        self.btn_brezel.setSizeIncrement(QSize(50, 50))
        self.btn_brezel.setStyleSheet(u"background-color: #D69803; \n"
                                       "image: url(:/images/images/images/\uaf48\ubc30\uae30.jpg);\n"
                                       "image-position: top;\n"
                                       "color: #000000;")
        
        self.gridLayout_3.addWidget(self.btn_brezel, 0, 0, 1, 1)

        self.btn_americano = QPushButton(self.home)
        self.btn_americano.setObjectName(u"btn_americano")
        sizePolicy4.setHeightForWidth(self.btn_americano.sizePolicy().hasHeightForWidth())
        self.btn_americano.setSizePolicy(sizePolicy4)
        self.btn_americano.setMinimumSize(QSize(50, 50))
        self.btn_americano.setMaximumSize(QSize(300, 300))
        self.btn_americano.setSizeIncrement(QSize(50, 50))
        self.btn_americano.setStyleSheet(u"background-color: #D69803;\n"
                                          "image: url(:/images/images/images/\uc544\uc774\uc2a4\uc544\uba54\ub9ac\uce74\ub178.jpg);\n"
                                          "image-position: top;"
                                          "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_americano, 2, 2, 1, 1)

        self.btn_donuts = QPushButton(self.home)
        self.btn_donuts.setObjectName(u"btn_donuts")
        sizePolicy4.setHeightForWidth(self.btn_donuts.sizePolicy().hasHeightForWidth())
        self.btn_donuts.setSizePolicy(sizePolicy4)
        self.btn_donuts.setMinimumSize(QSize(50, 50))
        self.btn_donuts.setMaximumSize(QSize(300, 300))
        self.btn_donuts.setSizeIncrement(QSize(50, 50))
        self.btn_donuts.setStyleSheet(u"background-color: #D69803;\n"
                                        "image: url(:/images/images/images/\ub3c4\ub108\uce20.jpg);\n"  
                                        "image-position: top;"
                                        "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_donuts, 0, 3, 1, 1)

        self.btn_brezel_set = QPushButton(self.home)
        self.btn_brezel_set.setObjectName(u"btn_brezel_set")
        sizePolicy4.setHeightForWidth(self.btn_brezel_set.sizePolicy().hasHeightForWidth())
        self.btn_brezel_set.setSizePolicy(sizePolicy4)
        self.btn_brezel_set.setMinimumSize(QSize(50, 50))
        self.btn_brezel_set.setMaximumSize(QSize(300, 300))
        self.btn_brezel_set.setSizeIncrement(QSize(50, 50))
        self.btn_brezel_set.setStyleSheet(u"background-color: #D69803;\n"
                                        "image: url(:/images/images/images/\uaf48\ubc30\uae303\uac1c.jpg);\n"
                                        "image-position: top;"
                                        "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_brezel_set, 0, 1, 1, 1)

        self.btn_coke = QPushButton(self.home)
        self.btn_coke.setObjectName(u"btn_coke")
        sizePolicy4.setHeightForWidth(self.btn_coke.sizePolicy().hasHeightForWidth())
        self.btn_coke.setSizePolicy(sizePolicy4)
        self.btn_coke.setMinimumSize(QSize(50, 50))
        self.btn_coke.setMaximumSize(QSize(300, 300))
        self.btn_coke.setSizeIncrement(QSize(50, 50))
        self.btn_coke.setStyleSheet(u"background-color: #D69803;\n"
                                     "image: url(:/images/images/images/\ucf5c\ub77c.jpg);\n"
                                     "image-position: top;"
                                     "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_coke, 4, 0, 1, 1)

        self.btn_hotamericano = QPushButton(self.home)
        self.btn_hotamericano.setObjectName(u"btn_hotamericano")
        sizePolicy4.setHeightForWidth(self.btn_hotamericano.sizePolicy().hasHeightForWidth())
        self.btn_hotamericano.setSizePolicy(sizePolicy4)
        self.btn_hotamericano.setMinimumSize(QSize(50, 50))
        self.btn_hotamericano.setMaximumSize(QSize(300, 300))
        self.btn_hotamericano.setSizeIncrement(QSize(50, 50))
        self.btn_hotamericano.setStyleSheet(u"background-color: #D69803;\n"
                                             "image: url(:/images/images/images/\ub530\ub73b\ud55c \uc544\uba54\ub9ac\uce74\ub178.jpg);\n"
                                             "image-position: top;"
                                             "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_hotamericano, 2, 3, 1, 1)

        self.btn_peach = QPushButton(self.home)
        self.btn_peach.setObjectName(u"btn_peach")
        sizePolicy4.setHeightForWidth(self.btn_peach.sizePolicy().hasHeightForWidth())
        self.btn_peach.setSizePolicy(sizePolicy4)
        self.btn_peach.setMinimumSize(QSize(50, 50))
        self.btn_peach.setMaximumSize(QSize(300, 300))
        self.btn_peach.setSizeIncrement(QSize(50, 50))
        self.btn_peach.setAutoFillBackground(False)
        self.btn_peach.setStyleSheet(u"background-color: #D69803;\n"
                                      "image: url(:/images/images/images/\ubcf5\uc22d\uc544.jpg);\n"
                                      "image-position: top;"
                                      "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_peach, 3, 3, 1, 1)

        self.btn_pomegranate = QPushButton(self.home)
        self.btn_pomegranate.setObjectName(u"btn_pomegranate")
        sizePolicy4.setHeightForWidth(self.btn_pomegranate.sizePolicy().hasHeightForWidth())
        self.btn_pomegranate.setSizePolicy(sizePolicy4)
        self.btn_pomegranate.setMinimumSize(QSize(50, 50))
        self.btn_pomegranate.setMaximumSize(QSize(300, 300))
        self.btn_pomegranate.setSizeIncrement(QSize(50, 50))
        self.btn_pomegranate.setStyleSheet(u"background-color: #D69803;\n"
                                            "image: url(:/images/images/images/\uc11d\ub958.jpg);\n"
                                            "image-position: top;"
                                            "color: #000000;")

        self.gridLayout_3.addWidget(self.btn_pomegranate, 3, 0, 1, 1)

        self.btn_cider = QPushButton(self.home)
        self.btn_cider.setObjectName(u"btn_cider")
        sizePolicy4.setHeightForWidth(self.btn_cider.sizePolicy().hasHeightForWidth())
        self.btn_cider.setSizePolicy(sizePolicy4)
        self.btn_cider.setMinimumSize(QSize(50, 50))
        self.btn_cider.setMaximumSize(QSize(300, 300))
        self.btn_cider.setSizeIncrement(QSize(50, 50))
        self.btn_cider.setStyleSheet(u"background-color: #D69803;\n"
                                      "image: url(:/images/images/images/\uc0ac\uc774\ub2e4.jpg);\n"
                                      "image-position: top;"
                                      "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_cider, 4, 1, 1, 1)

        self.btn_cheeseball = QPushButton(self.home)
        self.btn_cheeseball.setObjectName(u"btn_cheeseball")
        sizePolicy4.setHeightForWidth(self.btn_cheeseball.sizePolicy().hasHeightForWidth())
        self.btn_cheeseball.setSizePolicy(sizePolicy4)
        self.btn_cheeseball.setMinimumSize(QSize(50, 50))
        self.btn_cheeseball.setMaximumSize(QSize(300, 300))
        self.btn_cheeseball.setSizeIncrement(QSize(50, 50))
        self.btn_cheeseball.setStyleSheet(u"background-color: #D69803;\n"
                                           "image: url(:/images/images/images/\uce58\uc988\ubcfc.jpg);\n"
                                           "image-position: top;"
                                           "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_cheeseball, 2, 1, 1, 1)

        self.btn_dinoagg = QPushButton(self.home)
        self.btn_dinoagg.setObjectName(u"btn_dinoagg")
        sizePolicy4.setHeightForWidth(self.btn_dinoagg.sizePolicy().hasHeightForWidth())
        self.btn_dinoagg.setSizePolicy(sizePolicy4)
        self.btn_dinoagg.setMinimumSize(QSize(50, 50))
        self.btn_dinoagg.setMaximumSize(QSize(300, 300))
        self.btn_dinoagg.setSizeIncrement(QSize(50, 50))
        self.btn_dinoagg.setStyleSheet(u"background-color: #D69803;\n"
                                        "image: url(:/images/images/images/\uacf5\ub8e1\uc54c.jpg);\n"
                                        "image-position: top;"
                                        "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_dinoagg, 0, 2, 1, 1)

        self.btn_Fanta = QPushButton(self.home)
        self.btn_Fanta.setObjectName(u"btn_Fanta")
        sizePolicy4.setHeightForWidth(self.btn_Fanta.sizePolicy().hasHeightForWidth())
        self.btn_Fanta.setSizePolicy(sizePolicy4)
        self.btn_Fanta.setMinimumSize(QSize(50, 50))
        self.btn_Fanta.setMaximumSize(QSize(300, 300))
        self.btn_Fanta.setSizeIncrement(QSize(50, 50))
        self.btn_Fanta.setFont(font5)
        self.btn_Fanta.setStyleSheet(u"background-color: #D69803;\n"
                                      "image: url(:/images/images/images/\ud658\ud0c0.jpg);\n"
                                      "image-position: top;"
                                      "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_Fanta, 4, 2, 1, 1)

        self.btn_hotdog = QPushButton(self.home)
        self.btn_hotdog.setObjectName(u"btn_hotdog")
        sizePolicy4.setHeightForWidth(self.btn_hotdog.sizePolicy().hasHeightForWidth())
        self.btn_hotdog.setSizePolicy(sizePolicy4)
        self.btn_hotdog.setMinimumSize(QSize(50, 50))
        self.btn_hotdog.setMaximumSize(QSize(300, 300))
        self.btn_hotdog.setSizeIncrement(QSize(50, 50))
        self.btn_hotdog.setStyleSheet(u"background-color: #D69803;\n"
                                        "image: url(:/images/images/images/\ud56b\ub3c4\uadf8.jpg);\n"
                                        "image-position: top;"
                                        "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_hotdog, 2, 0, 1, 1)

        self.btn_blueberries = QPushButton(self.home)
        self.btn_blueberries.setObjectName(u"btn_blueberries")
        sizePolicy4.setHeightForWidth(self.btn_blueberries.sizePolicy().hasHeightForWidth())
        self.btn_blueberries.setSizePolicy(sizePolicy4)
        self.btn_blueberries.setMinimumSize(QSize(50, 50))
        self.btn_blueberries.setMaximumSize(QSize(300, 300))
        self.btn_blueberries.setSizeIncrement(QSize(50, 50))
        self.btn_blueberries.setStyleSheet(u"background-color: #D69803;\n"
                                        "image: url(:/images/images/images/\ube14\ub8e8\ubca0\ub9ac.jpg);\n"
                                        "image-position: top;"
                                        "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_blueberries, 3, 2, 1, 1)

        self.btn_plum = QPushButton(self.home)
        self.btn_plum.setObjectName(u"btn_plum")
        sizePolicy4.setHeightForWidth(self.btn_plum.sizePolicy().hasHeightForWidth())
        self.btn_plum.setSizePolicy(sizePolicy4)
        self.btn_plum.setMinimumSize(QSize(50, 50))
        self.btn_plum.setMaximumSize(QSize(300, 300))
        self.btn_plum.setSizeIncrement(QSize(50, 50))
        self.btn_plum.setStyleSheet(u"background-color: #D69803;\n"
                                     "image: url(:/images/images/images/\ub9e4\uc2e4.jpg);\n"
                                     "image-position: top;"
                                     "color: #000000;")
        self.gridLayout_3.addWidget(self.btn_plum, 3, 1, 1, 1)


        self.gridLayout_4.addLayout(self.gridLayout_3, 2, 0, 1, 1)

        self.horizontalLayout_6 = QHBoxLayout()
        self.horizontalLayout_6.setObjectName(u"horizontalLayout_6")
        self.horizontalLayout_6.setSizeConstraint(QLayout.SetDefaultConstraint)
        self.btn_All_Del = QPushButton(self.home)
        self.btn_All_Del.setObjectName(u"btn_All_Del")
        sizePolicy4.setHeightForWidth(self.btn_All_Del.sizePolicy().hasHeightForWidth())
        self.btn_All_Del.setSizePolicy(sizePolicy4)
        self.btn_All_Del.setMinimumSize(QSize(600, 150))
        self.btn_All_Del.setMaximumSize(QSize(600, 150))
        self.btn_All_Del.setBaseSize(QSize(600, 150))
        self.btn_All_Del.setFont(font5)
        self.btn_All_Del.setStyleSheet(u"background-color: rgb(52, 59, 72);"
                                       "text-align: center;"
                                       "font: bold 70px;"
                                       "color: #FFFFFF")

        self.horizontalLayout_6.addWidget(self.btn_All_Del)

        self.btu_Commit = QPushButton(self.home)
        self.btu_Commit.setObjectName(u"btu_Commit")
        sizePolicy4.setHeightForWidth(self.btu_Commit.sizePolicy().hasHeightForWidth())
        self.btu_Commit.setSizePolicy(sizePolicy4)
        self.btu_Commit.setMinimumSize(QSize(600, 150))
        self.btu_Commit.setMaximumSize(QSize(600, 150))
        self.btu_Commit.setBaseSize(QSize(600, 150))
        self.btu_Commit.setFont(font5)
        self.btu_Commit.setStyleSheet(u"background-color: #D69803;"
                                       "text-align: center;"
                                       "font: bold 70px;"
                                       "color: #FFFFFF")

        self.horizontalLayout_6.addWidget(self.btu_Commit)


        self.gridLayout_4.addLayout(self.horizontalLayout_6, 4, 1, 1, 3)

        self.tableWidget = QTableWidget(self.home)
        if (self.tableWidget.columnCount() < 7):
            self.tableWidget.setColumnCount(7)
        font6 = QFont()
        font6.setStyleStrategy(QFont.PreferDefault)
        __qtablewidgetitem = QTableWidgetItem()
        __qtablewidgetitem.setFont(font6);
        self.tableWidget.setHorizontalHeaderItem(0, __qtablewidgetitem)
        __qtablewidgetitem1 = QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(1, __qtablewidgetitem1)
        __qtablewidgetitem2 = QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(2, __qtablewidgetitem2)
        __qtablewidgetitem3 = QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(3, __qtablewidgetitem3)
        __qtablewidgetitem4 = QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(4, __qtablewidgetitem4)
        __qtablewidgetitem5 = QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(5, __qtablewidgetitem5)
        __qtablewidgetitem6 = QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(6, __qtablewidgetitem6)
        self.tableWidget.setObjectName(u"tableWidget")
        sizePolicy4.setHeightForWidth(self.tableWidget.sizePolicy().hasHeightForWidth())
        self.tableWidget.setSizePolicy(sizePolicy4)
        self.tableWidget.setMinimumSize(QSize(220, 580))
        self.tableWidget.setMaximumSize(QSize(1200, 1220))
        self.tableWidget.setBaseSize(QSize(220, 580))
        self.tableWidget.setSizeAdjustPolicy(QAbstractScrollArea.AdjustToContents)
        self.tableWidget.horizontalHeader().setCascadingSectionResizes(False)

        self.gridLayout_4.addWidget(self.tableWidget, 2, 1, 1, 3)

        self.stackedWidget.addWidget(self.home)
        self.nowSales = QWidget()
        self.nowSales.setObjectName(u"nowSales")
        self.nowSales.setStyleSheet(u"b")
        self.verticalLayout = QVBoxLayout(self.nowSales)
        self.verticalLayout.setSpacing(10)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.verticalLayout.setContentsMargins(10, 10, 10, 10)
        self.horizontalLayout_9 = QHBoxLayout()
        self.horizontalLayout_9.setObjectName(u"horizontalLayout_9")
        self.salesListWidget = QListWidget(self.nowSales)
        self.salesListWidget.setObjectName(u"salesListWidget")
        self.salesListWidget.setMinimumSize(QSize(1200, 1420))
        self.salesListWidget.setMaximumSize(QSize(1200, 1420))
        self.salesListWidget.setStyleSheet(u"")
        self.salesListWidget.setEditTriggers(QAbstractItemView.NoEditTriggers)

        self.horizontalLayout_9.addWidget(self.salesListWidget)

        self.verticalLayout_7 = QVBoxLayout()
        self.verticalLayout_7.setObjectName(u"verticalLayout_7")
        self.salesText = QPlainTextEdit(self.nowSales)
        self.salesText.setObjectName(u"salesText")
        self.salesText.setMinimumSize(QSize(1200, 1320))
        self.salesText.setMaximumSize(QSize(1200, 1320))
        self.salesText.setFont(font1)
        self.salesText.setReadOnly(True)
        self.salesText.setBackgroundVisible(False)
        self.salesText.setCenterOnScroll(False)

        self.verticalLayout_7.addWidget(self.salesText)

        self.del_List_Button = QPushButton(self.nowSales)
        self.del_List_Button.setObjectName(u"del_List_Button")
        sizePolicy5 = QSizePolicy(QSizePolicy.Preferred, QSizePolicy.Preferred)
        sizePolicy5.setHorizontalStretch(0)
        sizePolicy5.setVerticalStretch(0)
        sizePolicy5.setHeightForWidth(self.del_List_Button.sizePolicy().hasHeightForWidth())
        self.del_List_Button.setSizePolicy(sizePolicy5)
        self.del_List_Button.setMinimumSize(QSize(1200, 100))
        self.del_List_Button.setMaximumSize(QSize(1200, 100))
        self.del_List_Button.setStyleSheet(u"background-color: red;\n"
                                            "color: #FFFFFF;\n"
                                            "font-size: 30px;\n"
                                            "text-align: center;")

        self.verticalLayout_7.addWidget(self.del_List_Button)


        self.horizontalLayout_9.addLayout(self.verticalLayout_7)


        self.verticalLayout.addLayout(self.horizontalLayout_9)

        self.stackedWidget.addWidget(self.nowSales)
        self.postSales = QWidget()
        self.postSales.setObjectName(u"postSales")
        self.verticalLayout_20 = QVBoxLayout(self.postSales)
        self.verticalLayout_20.setObjectName(u"verticalLayout_20")
        self.gridLayout = QGridLayout()
        self.gridLayout.setObjectName(u"gridLayout")
        self.horizontalLayout_8 = QHBoxLayout()
        self.horizontalLayout_8.setObjectName(u"horizontalLayout_8")
        self.dateEdit_2 = QDateEdit(self.postSales)
        self.dateEdit_2.setObjectName(u"dateEdit_2")

        self.horizontalLayout_8.addWidget(self.dateEdit_2)

        self.label_2 = QLabel(self.postSales)
        self.label_2.setObjectName(u"label_2")

        self.horizontalLayout_8.addWidget(self.label_2)

        self.dateEdit = QDateEdit(self.postSales)
        self.dateEdit.setObjectName(u"dateEdit")

        self.horizontalLayout_8.addWidget(self.dateEdit)

        self.label_3 = QLabel(self.postSales)
        self.label_3.setObjectName(u"label_3")

        self.horizontalLayout_8.addWidget(self.label_3)

        self.pushButton = QPushButton(self.postSales)
        self.pushButton.setObjectName(u"pushButton")

        self.horizontalLayout_8.addWidget(self.pushButton)


        self.gridLayout.addLayout(self.horizontalLayout_8, 2, 0, 1, 1)

        self.widget = QWidget(self.postSales)
        self.widget.setObjectName(u"widget")

        self.gridLayout.addWidget(self.widget, 4, 3, 1, 1)

        self.widget_3 = QWidget(self.postSales)
        self.widget_3.setObjectName(u"widget_3")

        self.gridLayout.addWidget(self.widget_3, 6, 3, 1, 1)

        self.widget_2 = QWidget(self.postSales)
        self.widget_2.setObjectName(u"widget_2")

        self.gridLayout.addWidget(self.widget_2, 6, 0, 1, 1)

        self.calendarWidget = QCalendarWidget(self.postSales)
        self.calendarWidget.setObjectName(u"calendarWidget")
        self.calendarWidget.setMaximumSize(QSize(400, 400))
        self.calendarWidget.setStyleSheet(u"/* style for top navigation area ###############################################*/ \n"
"\n"
"#qt_calendar_navigationbar {\n"
"    background-color: #fff;\n"
"	border: 2px solid  #B8E2FF;\n"
"	border-bottom: 0px;\n"
"	border-top-left-radius: 5px;\n"
"	border-top-right-radius: 5px;\n"
"}\n"
"\n"
"/* style for month change buttons ############################################ */\n"
"\n"
"#qt_calendar_prevmonth, \n"
"#qt_calendar_nextmonth {\n"
"	/* border delete */\n"
"    border: none;  \n"
"    /* delete default icons */\n"
"	qproperty-icon: none; \n"
"	\n"
"    min-width: 13px;\n"
"    max-width: 13px;\n"
"    min-height: 13px;\n"
"    max-height: 13px;\n"
"\n"
"    border-radius: 5px; \n"
"	/* set background transparent */\n"
"    background-color: transparent; \n"
"	padding: 5px;\n"
"}\n"
"\n"
"/* style for pre month button ############################################ */\n"
"\n"
"#qt_calendar_prevmonth {\n"
"	/* set text for button */\n"
"	/*qproperty-text: &quot;&gt;&quot;;*/\n"
"	margin-left:5px;\n"
"	image"
                        ": url(:/icon/arrow-119-48.ico);\n"
"}\n"
"\n"
"/* style for next month button ########################################### */\n"
"#qt_calendar_nextmonth {\n"
"	margin-right:5px;\n"
"	image: url(:/icon/arrow-19-48.ico);\n"
"    /* qproperty-text: &quot;&gt;&quot;; */\n"
"}\n"
"#qt_calendar_prevmonth:hover, \n"
"#qt_calendar_nextmonth:hover {\n"
"    background-color: #55aaff;\n"
"}\n"
"\n"
"#qt_calendar_prevmonth:pressed, \n"
"#qt_calendar_nextmonth:pressed {\n"
"    background-color: rgba(235, 235, 235, 100);\n"
"}\n"
"\n"
"\n"
"/* Style for month and yeat buttons #################################### */\n"
"\n"
"#qt_calendar_yearbutton {\n"
"    color: #000;\n"
"	margin:5px;\n"
"    border-radius: 5px;\n"
"	font-size: 13px;\n"
"	padding:0px 10px;\n"
"}\n"
"\n"
" #qt_calendar_monthbutton {\n"
"	width: 110px;\n"
"    color: #000;\n"
"	font-size: 13px;\n"
"	margin:5px 0px;\n"
"    border-radius: 5px;\n"
"	padding:0px 2px;\n"
"}\n"
"\n"
"#qt_calendar_yearbutton:hover, \n"
"#qt_calendar_monthbutton:hover {\n"
"    b"
                        "ackground-color: #55aaff;\n"
"}\n"
"\n"
"#qt_calendar_yearbutton:pressed, \n"
"#qt_calendar_monthbutton:pressed {\n"
"    background-color: rgba(235, 235, 235, 100);\n"
"}\n"
"\n"
"/* Style for year input lineEdit ######################################*/\n"
"\n"
"#qt_calendar_yearedit {\n"
"    min-width: 53px;\n"
"    color: #000;\n"
"    background: transparent;\n"
"	font-size: 13px;\n"
"}\n"
"\n"
"/* Style for year change buttons ######################################*/\n"
"\n"
"#qt_calendar_yearedit::up-button { \n"
"	image: url(:/icon/arrow-151-48.ico);\n"
"    subcontrol-position: right;\n"
"}\n"
"\n"
"#qt_calendar_yearedit::down-button { \n"
"	image: url(:/icon/arrow-213-48.ico);\n"
"    subcontrol-position: left; \n"
"}\n"
"\n"
"#qt_calendar_yearedit::down-button, \n"
"#qt_calendar_yearedit::up-button {\n"
"	width:10px;\n"
"	padding: 0px 5px;\n"
"	border-radius:3px;\n"
"}\n"
"\n"
"#qt_calendar_yearedit::down-button:hover, \n"
"#qt_calendar_yearedit::up-button:hover {\n"
"	background-color: #55aaff;\n"
""
                        "}\n"
"\n"
"/* Style for month select menu ##################################### */\n"
"\n"
"#calendarWidget QToolButton QMenu {\n"
"     background-color: white;\n"
"\n"
"}\n"
"#calendarWidget QToolButton QMenu::item {\n"
"	/*padding: 10px;*/\n"
"}\n"
" #calendarWidget QToolButton QMenu::item:selected:enabled {\n"
"    background-color: #55aaff;\n"
"}\n"
"\n"
"#calendarWidget QToolButton::menu-indicator {\n"
"	/* Remove toolButton arrow */\n"
"      /*image: none; */\n"
"	nosubcontrol-origin: margin;\n"
"	subcontrol-position: right center;\n"
"	margin-top: 10px;\n"
"	width:20px;\n"
"}\n"
"\n"
"/* Style for calendar table ########################################## */\n"
"#qt_calendar_calendarview {\n"
"	/* Remove the selected dashed box */\n"
"    outline: 0px;\n"
"\n"
"	border: 2px solid  #B8E2FF;\n"
"	border-top: 0px;\n"
"	border-bottom-left-radius: 5px;\n"
"	border-bottom-right-radius: 5px;\n"
"}\n"
"\n"
"#qt_calendar_calendarview::item:hover {\n"
"   border-radius:5px;\n"
"	background-color:#aaffff;\n"
"}\n"
""
                        "\n"
"#qt_calendar_calendarview::item:selected {\n"
"    background-color: #55aa7f; \n"
"	border-radius:5px;\n"
"}")

        self.gridLayout.addWidget(self.calendarWidget, 4, 0, 1, 1)


        self.verticalLayout_20.addLayout(self.gridLayout)

        self.stackedWidget.addWidget(self.postSales)

        self.verticalLayout_15.addWidget(self.stackedWidget)


        self.horizontalLayout_4.addWidget(self.pagesContainer)


        self.verticalLayout_6.addWidget(self.content)

        self.bottomBar = QFrame(self.contentBottom)
        self.bottomBar.setObjectName(u"bottomBar")
        self.bottomBar.setMinimumSize(QSize(0, 22))
        self.bottomBar.setMaximumSize(QSize(16777215, 22))
        self.bottomBar.setFrameShape(QFrame.NoFrame)
        self.bottomBar.setFrameShadow(QFrame.Raised)
        self.horizontalLayout_5 = QHBoxLayout(self.bottomBar)
        self.horizontalLayout_5.setSpacing(0)
        self.horizontalLayout_5.setObjectName(u"horizontalLayout_5")
        self.horizontalLayout_5.setContentsMargins(0, 0, 0, 0)
        self.creditsLabel = QLabel(self.bottomBar)
        self.creditsLabel.setObjectName(u"creditsLabel")
        self.creditsLabel.setMaximumSize(QSize(16777215, 16))
        self.creditsLabel.setFont(font5)
        self.creditsLabel.setAlignment(Qt.AlignLeading|Qt.AlignLeft|Qt.AlignVCenter)

        self.horizontalLayout_5.addWidget(self.creditsLabel)

        self.version = QLabel(self.bottomBar)
        self.version.setObjectName(u"version")
        self.version.setAlignment(Qt.AlignRight|Qt.AlignTrailing|Qt.AlignVCenter)

        self.horizontalLayout_5.addWidget(self.version)

        self.frame_size_grip = QFrame(self.bottomBar)
        self.frame_size_grip.setObjectName(u"frame_size_grip")
        self.frame_size_grip.setMinimumSize(QSize(20, 0))
        self.frame_size_grip.setMaximumSize(QSize(20, 16777215))
        self.frame_size_grip.setFrameShape(QFrame.NoFrame)
        self.frame_size_grip.setFrameShadow(QFrame.Raised)

        self.horizontalLayout_5.addWidget(self.frame_size_grip)


        self.verticalLayout_6.addWidget(self.bottomBar)


        self.verticalLayout_2.addWidget(self.contentBottom)


        self.appLayout.addWidget(self.contentBox)


        self.appMargins.addWidget(self.bgApp)

        MainWindow.setCentralWidget(self.styleSheet)

        self.retranslateUi(MainWindow)

        self.stackedWidget.setCurrentIndex(0)


        QMetaObject.connectSlotsByName(MainWindow)
    # setupUi

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"\uc800\uad6c\uba85\ud488\uaf48\ubc30\uae30 \uacc4\uc0b0 \ud0a4\uc624\uc2a4\ud06c", None))
        self.titleLeftApp.setText(QCoreApplication.translate("MainWindow", u"", None))
        self.titleLeftDescription.setText("")
        self.btn_home.setText(QCoreApplication.translate("MainWindow", u"\uba54\uc778", None))
        self.btn_nowSales.setText(QCoreApplication.translate("MainWindow", u"\uc8fc\ubb38", None))
        self.btn_postSales.setText(QCoreApplication.translate("MainWindow", u"\ub9e4\ucd9c", None))
        self.btn_exit.setText(QCoreApplication.translate("MainWindow", u"Exit", None))
        self.toggleLeftBox.setText(QCoreApplication.translate("MainWindow", u"Left Box", None))
        self.titleRightInfo.setText(QCoreApplication.translate("MainWindow", u"\uc800\uad6c\uba85\ud488\uaf48\ubc30\uae30 \uacc4\uc0b0 \ud0a4\uc624\uc2a4\ud06c", None))
#if QT_CONFIG(tooltip)
        self.settingsTopBtn.setToolTip(QCoreApplication.translate("MainWindow", u"Settings", None))
#endif // QT_CONFIG(tooltip)
        self.settingsTopBtn.setText("")
#if QT_CONFIG(tooltip)
        self.minimizeAppBtn.setToolTip(QCoreApplication.translate("MainWindow", u"Minimize", None))
#endif // QT_CONFIG(tooltip)
        self.minimizeAppBtn.setText("")
#if QT_CONFIG(tooltip)
        self.maximizeRestoreAppBtn.setToolTip(QCoreApplication.translate("MainWindow", u"Maximize", None))
#endif // QT_CONFIG(tooltip)
        self.maximizeRestoreAppBtn.setText("")
#if QT_CONFIG(tooltip)
        self.closeAppBtn.setToolTip(QCoreApplication.translate("MainWindow", u"Close", None))
#endif // QT_CONFIG(tooltip)
        self.closeAppBtn.setText("")
        self.label.setText(QCoreApplication.translate("MainWindow", u"\ud569\uacc4 : ", None))
        self.btn_brezel.setText(QCoreApplication.translate("MainWindow", u"\uaf48\ubc30\uae30", None))
        self.btn_americano.setText(QCoreApplication.translate("MainWindow", u"\uc544\uc774\uc2a4 \uc544\uba54\ub9ac\uce74\ub178", None))
        self.btn_donuts.setText(QCoreApplication.translate("MainWindow", u"\ub3c4\ub108\uce20", None))
        self.btn_brezel_set.setText(QCoreApplication.translate("MainWindow", u"\uaf48\ubc30\uae30(3\uac1c)", None))
        self.btn_coke.setText(QCoreApplication.translate("MainWindow", u"\ucf5c\ub77c", None))
        self.btn_hotamericano.setText(QCoreApplication.translate("MainWindow", u"\ub530\ub73b\ud55c \uc544\uba54\ub9ac\uce74\ub178", None))
        self.btn_peach.setText(QCoreApplication.translate("MainWindow", u"\ubcf5\uc22d\uc544 \uc544\uc774\uc2a4\ud2f0", None))
        self.btn_pomegranate.setText(QCoreApplication.translate("MainWindow", u"\uc11d\ub958 \uc544\uc774\uc2a4\ud2f0", None))
        self.btn_cider.setText(QCoreApplication.translate("MainWindow", u"\uc0ac\uc774\ub2e4", None))
        self.btn_cheeseball.setText(QCoreApplication.translate("MainWindow", u"\uce58\uc988\ubcfc", None))
        self.btn_dinoagg.setText(QCoreApplication.translate("MainWindow", u"\uacf5\ub8e1\uc54c(4\uac1c)", None))
        self.btn_Fanta.setText(QCoreApplication.translate("MainWindow", u"\ud658\ud0c0", None))
        self.btn_hotdog.setText(QCoreApplication.translate("MainWindow", u"\ud56b\ub3c4\uadf8", None))
        self.btn_blueberries.setText(QCoreApplication.translate("MainWindow", u"\ube14\ub8e8\ubca0\ub9ac \uc544\uc774\uc2a4\ud2f0", None))
        self.btn_plum.setText(QCoreApplication.translate("MainWindow", u"\ub9e4\uc2e4 \uc544\uc774\uc2a4\ud2f0", None))
        self.btn_All_Del.setText(QCoreApplication.translate("MainWindow", u"\uc804\uccb4 \uc0ad\uc81c", None))
        self.btu_Commit.setText(QCoreApplication.translate("MainWindow", u"\uacb0\uc81c", None))
        ___qtablewidgetitem = self.tableWidget.horizontalHeaderItem(0)
        ___qtablewidgetitem.setText(QCoreApplication.translate("MainWindow", u"\uc81c\ud488\uba85", None));
        ___qtablewidgetitem1 = self.tableWidget.horizontalHeaderItem(1)
        ___qtablewidgetitem1.setText(QCoreApplication.translate("MainWindow", u"\uac00\uaca9", None));
        ___qtablewidgetitem2 = self.tableWidget.horizontalHeaderItem(2)
        ___qtablewidgetitem2.setText(QCoreApplication.translate("MainWindow", u"\uac1c\uc218", None));
        ___qtablewidgetitem3 = self.tableWidget.horizontalHeaderItem(3)
        ___qtablewidgetitem3.setText(QCoreApplication.translate("MainWindow", u"\ucd1d \uac00\uaca9", None));
        ___qtablewidgetitem4 = self.tableWidget.horizontalHeaderItem(4)
        ___qtablewidgetitem4.setText(QCoreApplication.translate("MainWindow", u"\uc218\ub7c9 \ucd94\uac00", None));
        ___qtablewidgetitem5 = self.tableWidget.horizontalHeaderItem(5)
        ___qtablewidgetitem5.setText(QCoreApplication.translate("MainWindow", u"\uc218\ub7c9 \uc81c\uac70", None));
        ___qtablewidgetitem6 = self.tableWidget.horizontalHeaderItem(6)
        ___qtablewidgetitem6.setText(QCoreApplication.translate("MainWindow", u"\uc0ad\uc81c", None));
        self.del_List_Button.setText(QCoreApplication.translate("MainWindow", u"\uc8fc\ubb38\uc11c\u0020\uc0ad\uc81c", None))
        self.label_2.setText(QCoreApplication.translate("MainWindow", u"\ubd80\ud130", None))
        self.label_3.setText(QCoreApplication.translate("MainWindow", u"\uae4c\uc9c0", None))
        self.pushButton.setText(QCoreApplication.translate("MainWindow", u"\uac80\uc0c9", None))
        self.creditsLabel.setText(QCoreApplication.translate("MainWindow", u"By: ParkSeongHyeon", None))
        self.version.setText(QCoreApplication.translate("MainWindow", u"v0.0.1", None))
    # retranslateUi