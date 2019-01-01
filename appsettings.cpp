#include "appsettings.h"

#include <QDebug>
#include <QFile>
#include <QDateTime>
#include <QXmlStreamWriter>
#include <QFileDialog>
#include <QDomDocument>

AppSettings::AppSettings(QString fileName)
{
    // for only exe
    //    m_appMode = true;
    //    m_brandName = "seta";
    //    return;

    //with ini file
    m_settings = new QSettings( fileName, QSettings::IniFormat );
    m_settings->beginGroup("App_Settings");
    //m_settings->setValue("app_mode", "Demo");
    //m_settings->setValue("brand_name", "tachus");
    m_appMode = m_settings->value("app_mode", "Live").toString() == "Live" ? true : false;
    m_brandName = m_settings->value("brand_name", "seta").toString();
    motor_movement_time = m_settings->value("motor_movement_time", 2.5).toDouble();
    m_settings->endGroup();

    m_settings->beginGroup("shot_count_and_timer");
    shootCountAndTimeMap[10] = m_settings->value("ten_shoot", "90").toInt();
    shootCountAndTimeMap[20] = m_settings->value("twenty_shoot", "90").toInt();
    shootCountAndTimeMap[30] = m_settings->value("thirty_shoot", "90").toInt();
    shootCountAndTimeMap[40] = m_settings->value("forty_shoot", "90").toInt();
    shootCountAndTimeMap[60] = m_settings->value("sixty_shoot", "90").toInt();
    shootCountAndTimeMap[-1] = m_settings->value("default", "90").toInt(); // -1 for free practise
    m_settings->endGroup();
}

void AppSettings::setTachusWidget(TachusWidget *widget)
{
    tachusWidget = widget;
    tachusWidget->setMotorMovementTime(motor_movement_time);
}

bool AppSettings::getAppMode()
{
    return m_appMode;
}

QString AppSettings::getBrandName()
{
    return m_brandName;
}

void AppSettings::saveMatch()
{
    QFile file(QString("test_match%1.tch").arg(QDateTime::currentDateTime().toString("ddMMyyyy-hhmmss")));
    if (file.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        QXmlStreamWriter xmlWriter(&file);
        xmlWriter.setAutoFormatting(true);
        xmlWriter.writeStartDocument();

        xmlWriter.writeStartElement("root");
        xmlWriter.writeStartElement("Game_information");
        xmlWriter.writeTextElement("user_name", user_name );
        xmlWriter.writeTextElement("game_mode", QString::number(game_mode));
        xmlWriter.writeTextElement("game_event", QString::number(game_event));
        xmlWriter.writeEndElement();

        xmlWriter.writeStartElement("GameData");
        if (tachusWidget != NULL)
        {
            for (int i=0; i<tachusWidget->getShootCount(); ++i)
            {
                xmlWriter.writeStartElement(QString("data_%1").arg(i));
                xmlWriter.writeTextElement("x_data", QString::number(tachusWidget->getXCord(i+1)));
                xmlWriter.writeTextElement("y_data", QString::number(tachusWidget->getYCord(i+1)));
                xmlWriter.writeEndElement();
            }
        }

        xmlWriter.writeEndElement();

        xmlWriter.writeEndDocument();
        xmlWriter.writeEndDocument();
        file.close();
    }
}

void AppSettings::setUsername(QString name)
{
    if (!name.isEmpty())
        user_name = name;
}

void AppSettings::setGameMode(int mode)
{
    game_mode = mode;
}

void AppSettings::setGameEvent(int event)
{
    game_event = event;
}

void AppSettings::uploadGame()
{
    QString fileName = QFileDialog::getOpenFileName(tachusWidget, tr("Open File"),
                                                    "/home",
                                                    tr("File (*.tch)"));
    if (fileName.isEmpty())
        return;

    QDomDocument xmlDocument;
    QFile f(fileName);
    if(!f.open(QIODevice::ReadOnly))
    {
        qDebug("Error While Reading the File");
    }

    xmlDocument.setContent(&f);
    f.close();
    qDebug("File was closed Successfully");

//    <root>
//    <Game_information>
//        <user_name>SSBED</user_name>
//        <game_mode>Pistol</game_mode>
//        <game_event>20 Shots Match</game_event>
//    </Game_information>
//    <GameData>
//        <data_0>
//            <x_data>2.54639e-313</x_data>
//            <y_data>2.54639e-313</y_data>
//        </data_0>
//    </GameData>
//    </root>

    QDomElement root = xmlDocument.documentElement();
    QDomElement gameInfoEle = root.firstChild().toElement();
    QString startTag = gameInfoEle.tagName();
    qDebug()<<"The ROOT tag is"<<startTag;

    // Get root names and attributes
    QDomElement userEle = gameInfoEle.firstChild().toElement();
    QString useData = userEle.firstChild().toText().data();
    QDomElement gameModeEle = userEle.nextSibling().toElement();
    QString gameModeData = gameModeEle.firstChild().toText().data();
    QDomElement gameEventEle = gameModeEle.nextSibling().toElement();
    QString gameEventData = gameEventEle.firstChild().toText().data();
    qDebug() << "user name "<< useData << " gamemode " << gameModeData << " gamevent " << gameEventData;

    user_name = useData;
    game_mode = gameModeData.toInt();
    game_event = gameEventData.toInt();

    QDomElement gameDataEle = gameInfoEle.nextSibling().toElement();
    if(!gameDataEle.isNull())
    {
        x_valueList.clear();
        y_valueList.clear();

        if(gameDataEle.tagName()=="GameData")
        {
            QDomElement Component = gameDataEle.firstChild().toElement();

            while(!Component.isNull())
            {
                QString cmp = Component.tagName();
                //qDebug("Inside the Component WHILE Loop");
                if(Component.tagName().contains("data_"))
                {
                    QDomElement xEle = Component.firstChild().toElement();
                    QString xData = xEle.firstChild().toText().data();
                    x_valueList.append(xData.toDouble());
                    QDomElement yEle = xEle.nextSibling().toElement();
                    QString yData = yEle.firstChild().toText().data();
                    y_valueList.append(yData.toDouble());
                    qDebug()<<"The data - "<<cmp << " x value " << xData << " y value " <<yData;
                }

                Component =Component.nextSibling().toElement();
            }
        }
    }
}

int AppSettings::getLoadedGameShotCount()
{
    if (x_valueList.count() == y_valueList.count())
        return x_valueList.count();

    return 0;
}

double AppSettings::getLoadedGameX(int index)
{
    if (x_valueList.count() > index)
        return x_valueList.at(index);

    return -1;
}

double AppSettings::getLoadedGameY(int index)
{
    if (y_valueList.count() > index)
        return y_valueList.at(index);

    return -1;
}

void AppSettings::clearLoadedData()
{
    x_valueList.clear();
    y_valueList.clear();
}

int AppSettings::getTimeCount(int shootCount)
{
    if (shootCountAndTimeMap.contains(shootCount))
    {
        return shootCountAndTimeMap[shootCount]*60;
    }

    return 90;
}
