#ifndef TACHUSWIDGET_H
#define TACHUSWIDGET_H

#include <QWidget>
#include <QTimer>
#include <QThread>
#include <QDebug>

#include "../src/mainwindow.h"

namespace Ui {
class TachusWidget;
}

class MotorThread : public QThread
{
public:
    explicit MotorThread(MainWindow* mainWindow, QObject* parent = 0)
        : m_mainWindow(mainWindow), QThread(parent)
    {

    }
    ~MotorThread() {

    }
    void setMotorMovementTime(double time) {
        motor_movement_time = time;
    }

protected:
    void run() override {
        qDebug() << "    motor_movement_time " << motor_movement_time;
        //start motor
        m_mainWindow->modbusWriteSingleRegister(8196, 32768);
//        QThread::msleep(100);
//        m_mainWindow->modbusWriteSingleRegister(8196, 32768);
        QThread::msleep(motor_movement_time*1000);
        // stop motor
//        m_mainWindow->modbusWriteSingleRegister(8196, 0);
//        QThread::msleep(100);
//        m_mainWindow->modbusWriteSingleRegister(8196, 0);
//        QThread::msleep(100);
        m_mainWindow->modbusWriteSingleRegister(8196, 0);
    }

private:
    MainWindow* m_mainWindow;
    double motor_movement_time = 0;
};

class TachusWidget : public QWidget
{
    Q_OBJECT

public:
    explicit TachusWidget(MainWindow* mainwindow, QWidget *parent = 0);
    ~TachusWidget();
    void initialiseConnection();
    void setMotorMovementTime(double time) {
        if (m_motorThread)
            m_motorThread->setMotorMovementTime(time);
    }

public slots:
    bool isModBusConnected();
    bool connectedModbus(QString portName = QString());
    bool disconnectModbus();
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();
    bool isValidLicence();
    void uxShoot(double xCor, double yCor);
    int getShootCount() {
        return m_oldResetCount + m_currentShootsCount;
    }

    double getXCord(int index);
    double getXMPI(int series = -1);
    double getYCord(int index);
    double getYMPI(int series = -1);
    void initiateMotorMovement();
    void resetShootinCount() {
        m_currentShootsCount = 0;
        m_oldResetCount = 0;
        m_mainWindow->modbusWriteSingleRegister(8193, 0);
    }
private slots:
    void on_pushButton_3_clicked();
    void checkForNewShots(bool motorAutoMode = true);
    int getRealValue(int value);

signals:
    void shootCountChanged(int count);

private:
    Ui::TachusWidget *ui;
    MainWindow* m_mainWindow;
    int m_currentShootsCount = 0;
    int m_oldResetCount = 0;
    QTimer* m_timer = NULL;
    bool autoModeOn = false;
    QList<double> m_xCordList;
    QList<double> m_yCordList;
    MotorThread* m_motorThread = nullptr;
};

#endif // TACHUSWIDGET_H
