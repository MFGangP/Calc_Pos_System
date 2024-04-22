# pyqt6, ptside6 사용해서 재 제작

import sys
import os
import pymysql
from datetime import datetime

os.environ["QT_FONT_DPI"] = "96" # FIX Problem for High DPI and Scale above 100%

# 행 열 갯수 정의
conn = None
widgets = None

all_Row = 15
all_Column = 7

