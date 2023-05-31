# -*- coding: utf-8 -*-
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

# MAIN FILE
# ///////////////////////////////////////////////////////////////
from main import *

# WITH ACCESS TO MAIN WINDOW WIDGETS
# ///////////////////////////////////////////////////////////////
class AppFunctions(MainWindow):
    def setThemeHack(self):
        Settings.BTN_LEFT_BOX_COLOR = "background-color: #FFC777;"
        Settings.BTN_RIGHT_BOX_COLOR = "background-color: #FFC777;"
        Settings.MENU_SELECTED_STYLESHEET = MENU_SELECTED_STYLESHEET = """
        border-left: 22px solid qlineargradient(spread:pad, x1:0.034, y1:0, x2:0.216, y2:0, stop:0.499 rgba(255, 121, 198, 255), stop:0.5 rgba(85, 170, 255, 0));
        background-color: #E39500;
        """
        Settings.BTN_TABLEWIDGET_BUTTON_COLOR = u'''QPushButton{
                                                        color: #f8f8f2;
                                                        background-color: #FFC777;
                                                        border: 2px solid rgb(255, 190, 11);
                                                        border-radius: 5px;
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
                                                    }'''
