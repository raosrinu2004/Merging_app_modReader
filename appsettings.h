#ifndef APPSETTINGS_H
#define APPSETTINGS_H

#include <QSettings>
#include <QObject>

#include "ModReader/forms/tachuswidget.h"

class AppSettings : public QObject
{
    Q_OBJECT

public:
    AppSettings(QString fileName);
    void setTachusWidget(TachusWidget* widget);
    Q_INVOKABLE bool getAppMode();
    Q_INVOKABLE QString getBrandName();
    Q_INVOKABLE void saveMatch();

    Q_INVOKABLE void setUsername(QString name);
    Q_INVOKABLE QString getUserName() {
        return user_name;
    }
    Q_INVOKABLE void setGameMode(int mode);
    Q_INVOKABLE int getGameMode() {
        return game_mode;
    }
    Q_INVOKABLE void setGameEvent(int event);
    Q_INVOKABLE int getGameEvent() {
        return game_event;
    }

    Q_INVOKABLE void uploadGame();
    Q_INVOKABLE int getLoadedGameShotCount();
    Q_INVOKABLE double getLoadedGameX(int index);
    Q_INVOKABLE double getLoadedGameY(int index);

    Q_INVOKABLE void clearLoadedData();
    Q_INVOKABLE int getTimeCount(int shootCount);

private:
    bool m_appMode = false; // true for demo, false for live
    QString m_brandName = "tachus";
    QSettings* m_settings = NULL;
    QString user_name = "";
    int game_mode = 0;
    int game_event = 0;
    double motor_movement_time = 2.5;
    TachusWidget* tachusWidget = NULL;
    QList<double> x_valueList;
    QList<double>y_valueList;
    QMap<int, int> shootCountAndTimeMap;
};

#endif // APPSETTINGS_H
