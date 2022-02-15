# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import random

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine , QmlElement
from PySide6.QtCore import QObject, Slot


QML_IMPORT_NAME = "cal"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement


class Bridge(QObject):
    @Slot(str, result=str)
    def nume(self,n):
        engine = QQmlApplicationEngine()
        engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
        f = engine.rootObjects()[0].property("formula")
        return f+n
    @Slot(str, result=str)
    def back(self,f):
        return f[:-1]
    @Slot(str, result=str)
    def up(self,f):
        if(f != ""):
            try:
              return str(eval(str(f)))
            except:
                return

        else:
            self.ans = "0"


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))

    grad = [["#667eea" , "#764ba2"] , ["#ff8177" , "#b12a5b"],["#FDFCFB","#ffc391"],["#C2E9FB","#A1C4FD"],["#93A5CF","#E4EfE9"],["#92EFFD","#4E65FF"],["#A9F1DF","#FFBBBB"],["#BFF098","#6FD6FF"],["#EE9CA7","#FFDDE1"],["#EA8D8D","#A890FE"]]
    num = random.randint(0,len(grad)-1)
#    print(num)
    engine.rootObjects()[0].setProperty('c1', grad[num][0])
    engine.rootObjects()[0].setProperty('c2', grad[num][1])

    if not engine.rootObjects():
            sys.exit(-1)
    sys.exit(app.exec())



