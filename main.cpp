#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include "customprint.h"


//mode reader modification
#include <QApplication>
#include <stdio.h>
#include <stdlib.h>
#include <QDir>
#include <QTranslator>
#include <QScreen>

#include "ModReader/3rdparty/QsLog/QsLog.h"
#include "ModReader/3rdparty/QsLog/QsLogDest.h"
#include "ModReader/src/mainwindow.h"
#include "ModReader/src/modbusadapter.h"
#include "ModReader/src/modbuscommsettings.h"
#include "ModReader/forms/tachuswidget.h"

#include "appsettings.h"

//
QTranslator *Translator;
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    AppSettings *appsettings = new AppSettings("config.ini");
    QScreen *srn = QApplication::screens().at(0);
    qreal dotsPerInch = (qreal)srn->logicalDotsPerInch();

    qDebug() <<"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&" << dotsPerInch;
    ///-------------------------------------------------
    //Modbus Adapter
    ModbusAdapter modbus_adapt(NULL);
    //Program settings
    ModbusCommSettings settings("qModMaster.ini");

    //show main window
    mainWin = new MainWindow(NULL, &modbus_adapt, &settings);
    //connect signals - slots
    QObject::connect(&modbus_adapt, SIGNAL(refreshView()), mainWin, SLOT(refreshView()));
    QObject::connect(mainWin, SIGNAL(resetCounters()), &modbus_adapt, SLOT(resetCounters()));
    //mainWin->show();

    TachusWidget* widget = new TachusWidget(mainWin);
    appsettings->setTachusWidget(widget);
    //widget->show();
    ///-----------------------------------------------------------

    QQmlApplicationEngine engine;
    //For QML
    CustomPrint  printComponent;
//    printComponent.printTest();
    engine.rootContext()->setContextProperty("CUSTOMPRINT", &printComponent);
    engine.rootContext()->setContextProperty("MODREADER", widget);
    engine.rootContext()->setContextProperty("APPSETTINGS", appsettings);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
