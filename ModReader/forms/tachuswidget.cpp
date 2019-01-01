#include "tachuswidget.h"
#include "ui_tachuswidget.h"
#include "ModReader/3rdparty/QsLog/QsLog.h"

#include <QThread>
#include <QDate>

TachusWidget::TachusWidget(MainWindow *mainwindow, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TachusWidget)
{
    ui->setupUi(this);
    m_mainWindow = mainwindow;

    // for initial connection, do dummy read
    //on_pushButton_clicked();

    m_timer = new QTimer(this);
    //connect(m_timer, SIGNAL(timeout()), this, SLOT(checkForNewShots()));
    //QDate date = QDate::currentDate();
    //if (date.dayOfYear() > 250 && date.dayOfYear() < 360 && date.year() == 2018)
        connect(m_timer, SIGNAL(timeout()), this, SLOT(on_pushButton_2_clicked()));
    m_timer->start(100);
    m_motorThread = new MotorThread(m_mainWindow, this);
}

TachusWidget::~TachusWidget()
{
    delete ui;
}

void TachusWidget::initialiseConnection()
{
//    if (!m_mainWindow->isModBusConnected())
//        m_mainWindow->changedConnect(true);

//    uint8_t dest[1024]; //setup memory for data
//    uint16_t * dest16 = (uint16_t *) dest;
//    memset(dest, 0, 1024);

//    m_mainWindow->modbusReadRegistry(8192, 2, dest16);
//    m_currentShootsCount = dest16[1];
    //    m_mainWindow->getTextEdit()->setPlainText(QString("shoots count ******* %1").arg(m_currentShootsCount));
}

bool TachusWidget::isModBusConnected()
{
    ui->listWidget->addItem(QString("isModBusConnected called"));
    return m_mainWindow->isModBusConnected();
}

bool TachusWidget::connectedModbus(QString portName)
{
    ui->listWidget->addItem(QString("connectedModbus called"));
    if (m_mainWindow == NULL)
        return false;

    if (!m_mainWindow->isModBusConnected())
        m_mainWindow->changedConnect(true, portName);
}

bool TachusWidget::disconnectModbus()
{
    ui->listWidget->addItem(QString("disconnectModbus called"));
    if (m_mainWindow == NULL)
        return false;

    if (m_mainWindow->isModBusConnected())
        m_mainWindow->changedConnect(false);

    return m_mainWindow->isModBusConnected();
}

void TachusWidget::on_pushButton_clicked()
{
    if (m_mainWindow == NULL)
        return;

    int from = ui->spinBox->value();
    int to = ui->spinBox_2->value();
    //    if (from <= 0 || to <= 0 || from >= to)
    //        return;
    // just to allow initial connection

    if (!m_mainWindow->isModBusConnected())
        m_mainWindow->changedConnect(true);

    if (m_mainWindow->isModBusConnected())
    {
        int baseNumber = 16376;

        for (int i=from; i<=to; ++i)
        {
            int newAddress = baseNumber +(8*i);
            QLOG_ERROR() << baseNumber << "New address " << newAddress;
            m_mainWindow->setSBStartAddValue(newAddress, 0);
            m_mainWindow->request();
            QLOG_ERROR() << "Data ..................";
            QLOG_ERROR() << m_mainWindow->getData();
            QLOG_ERROR() << "................................";
        }
    }

//    uint8_t dest[1024]; //setup memory for data
//    uint16_t * dest16 = (uint16_t *) dest;
//    memset(dest, 0, 1024);

//    m_mainWindow->modbusReadRegistry(8192, 2, dest16);
//    m_currentShootsCount = dest16[1];
//    m_mainWindow->getTextEdit()->setPlainText(QString("shoots count ******* %1").arg(m_currentShootsCount));

//    if (!autoModeOn)
//    {
//        QLOG_ERROR() << "Auto mode on";
//        //auto motor mode
//        m_mainWindow->modbusWriteSingleRegister(8197, 1000);
//        m_mainWindow->modbusWriteSingleRegister(8196, 256);
//    }
//    autoModeOn = true;
}

void TachusWidget::on_pushButton_2_clicked() // read old data
{
    if (m_mainWindow)
    {
        int from = m_currentShootsCount;
        checkForNewShots();
        int to = m_currentShootsCount;
//        ui->listWidget->addItem(QString("From count %3").arg(from));
//        ui->listWidget_2->addItem(QString("To count %3").arg(to));

        if (from < to)
        {
            int baseNumber = 16376;
            for (int i=from+1; i<=to; ++i)
            {
                uint8_t dest[1024]; //setup memory for data
                uint16_t * dest16 = (uint16_t *) dest;
                memset(dest, 0, 1024);

                int newAddress = baseNumber +(8*i);
                m_mainWindow->modbusReadRegistry(newAddress, 2, dest16);
                int x = dest16[1];
                int y = dest16[0];
                double xReal = x < 255 ? x/10.0 : getRealValue(x)/10.0;
                double yReal = y < 255 ? y/10.0 : getRealValue(y)/10.0;
                m_xCordList.append(xReal);
                m_yCordList.append(yReal);
                ui->listWidget->addItem(QString("Shoot %1 -> value %2 count %3").arg(i).arg(xReal).arg(m_xCordList.count()));
                ui->listWidget_2->addItem(QString("Shoot %1 -> value %2 count %3").arg(i).arg(yReal).arg(m_yCordList.count()));
                emit shootCountChanged(getShootCount() - to + i);
            }

            m_oldResetCount = m_oldResetCount + m_currentShootsCount;
            // reset the hardware
            // register 2001 Hex = 8193 decimal
            m_mainWindow->modbusWriteSingleRegister(8193, 0);

            m_currentShootsCount = 0;
        }
    }
}

bool TachusWidget::isValidLicence()
{
    QDate date = QDate::currentDate();

    qDebug() << "isValidLicence ------------" <<date.dayOfYear();
    //if (date.dayOfYear() > 250 && date.dayOfYear() < 360 && date.year() == 2018)
        return true;

//    if (date.dayOfYear() > 170 && date.dayOfYear() < 180)
//        return false;
//    if (date.dayOfYear() < 360 && date.year() < 2021)
//        return true;

    return false;
}

void TachusWidget::uxShoot(double xCor, double yCor)
{
    m_xCordList.append(xCor);
    m_yCordList.append(yCor);
    m_oldResetCount++;
    emit shootCountChanged(m_oldResetCount);
}

double TachusWidget::getXCord(int index)
{
    ui->listWidget->addItem(QString("get x cord %1 index count %2").arg(index).arg(m_xCordList.count()));

    if (m_xCordList.count()>= index) {
        ui->listWidget->addItem(QString("get x cord value %1").arg(m_xCordList.at(index-1)));
        return m_xCordList.at(index-1);
    }

    return -1;
}

double TachusWidget::getXMPI(int series)
{
    double mpi = 0;
    if (series == -1) // for all series
    {
        for(int i=0; i<m_xCordList.count(); ++i ) {
            mpi += m_xCordList.at(i);
        }

        mpi = mpi/m_xCordList.count();
    }
    return mpi;
}

double TachusWidget::getYCord(int index)
{
    ui->listWidget_2->addItem(QString("get y cord %1 index count %2").arg(index).arg(m_yCordList.count()));
    if (m_yCordList.count()>= index) {
        ui->listWidget_2->addItem(QString("get y cord value %1").arg(m_yCordList.at(index-1)));
        return m_yCordList.at(index-1);
    }

    return -1;
}

double TachusWidget::getYMPI(int series)
{
    qDebug() << __FUNCTION__;
    double mpi = 0;
    if (series == -1) // for all series
    {
        for(int i=0; i<m_yCordList.count(); ++i ) {
            mpi += m_yCordList.at(i);
        }

        mpi = mpi/m_yCordList.count();
    }
    return mpi;
}

void TachusWidget::initiateMotorMovement()
{
    qDebug() << "--------------------------------------";
    if (m_motorThread)
        m_motorThread->start();
}


void TachusWidget::on_pushButton_3_clicked()
{
    // no action
}

void TachusWidget::checkForNewShots(bool motorAutoMode)
{
//    QString string = m_mainWindow->getTextEdit()->toPlainText();
//    m_mainWindow->getTextEdit()->setPlainText(QString("%1 Checking shoot count").arg(string));
    uint8_t dest[1024]; //setup memory for data
    uint16_t * dest16 = (uint16_t *) dest;
    memset(dest, 0, 1024);

    m_mainWindow->modbusReadRegistry(8192, 2, dest16);
    int newShotsCount = dest16[1];
    //motorAutoMode = false;
    if (newShotsCount > m_currentShootsCount)
    {
        m_currentShootsCount = newShotsCount;
    }
}

int TachusWidget::getRealValue(int value)
{
    int decimal = value;
    bool ok;
    QString hex = QString::number(decimal, 16);
    int hexNum = hex.toInt(&ok, 16);
    QString binary = QString::number(hexNum, 2);
    QString binaryRightEight = binary.right(8);
    //qDebug() << "-----------------------***" << binaryRightEight;
    QString binary2C;
    if (binary.at(0) == "1" && binary.length() == 16)
    {
        for (int i=0; i<16; i++)
        {
            if (binary.at(i) == "1")
                binary2C.append("0");
            else
                binary2C.append("1");
        }
        int realValue = binary2C.toInt(&ok, 2);
        return (realValue+1)*(-1);
    } else
        return decimal;
}
