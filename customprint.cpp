#include "customprint.h"
#include <QFileDialog>
#include <QPainter>
#include <QImage>
#include <QtPrintSupport/QPrinter>
#include <QtPrintSupport/QPrintDialog>
#include <QPdfWriter>
#include <QVariant>
#include <QDebug>
#include <QDateTime>

CustomPrint::CustomPrint(QObject *parent) : QObject(parent)
{

}

void CustomPrint::printPNG(QVariant data)
{
//    QString fileName = QFileDialog::getSaveFileName(0, tr("Save File"),
//                                                    "untitled.png",
//                                                    tr("Images (*.png *.xpm *.jpg)"));
    QString fileName = QString("test_pdf_%1.png").arg(QDateTime::currentDateTime().toString("ddMMyyyy-hhmmss"));
    QImage img = qvariant_cast<QImage>(data);
    if(img.isNull())
    {
        qDebug() << "In valid image" << endl;
    }
    img.save(fileName);
    emit saveComplete();
}

void CustomPrint::printTest()
{
    //    const QString fileName("test1.pdf");
    //    QPdfWriter pdfWriter(fileName);
    //    pdfWriter.setPageSize(QPageSize(QPageSize::A4));
    //    QPainter painter(&pdfWriter);

    //    painter.drawPixmap(QRect(0,0,pdfWriter.logicalDpiX()*8.3,pdfWriter.logicalDpiY()*11.7), QPixmap("test.png"));

    QPdfWriter pdfWriter("mytest.pdf");
    QPainter painter(&pdfWriter);
    quint32 iYPos = 10;

    QPixmap pxPic;
    pxPic.load("test.png", "PNG");
    //painter.drawPixmap(0, iYPos, pxPic.width(), pxPic.height(), pxPic);
    //iYPos += pxPic.height() + 250;

    quint32 iWidth = pdfWriter.width();
    quint32 iHeight = pdfWriter.height();
    qDebug() << "************************************************* pdf resolution" <<pdfWriter.resolution();
    QSize s(iWidth, iHeight);
    QPixmap pxScaledPic = pxPic.scaled(s, Qt::KeepAspectRatio, Qt::FastTransformation);
    painter.drawPixmap(0, iYPos, pxScaledPic.width(), pxScaledPic.height(), pxScaledPic);
    iYPos += pxScaledPic.height() + 250;

    pdfWriter.setResolution(2400);
    qDebug() << "************************************************* 2 pdf resolution" <<pdfWriter.resolution();
    painter.drawPixmap(0, iYPos, pxScaledPic.width(), pxScaledPic.height(), pxScaledPic);
    iYPos += pxScaledPic.height() + 250;

    pdfWriter.setResolution(600);
    qDebug() << "************************************************* 3 pdf resolution" <<pdfWriter.resolution();
    painter.drawPixmap(0, iYPos, pxScaledPic.width(), pxScaledPic.height(), pxScaledPic);
    iYPos += pxScaledPic.height() + 250;
}

void CustomPrint::clearImagesList()
{
    m_images.clear();
}

void CustomPrint::addImage(QVariant data)
{
    QImage img = qvariant_cast<QImage>(data);
    if(!img.isNull())
    {
        m_images.append(img);
    }
    printPNG(data);
}

void CustomPrint::createPdf()
{
    QString fileName = QFileDialog::getSaveFileName(0, tr("Save File"),
                                                    "untitled.pdf",
                                                    tr("*.pdf"));
    QPdfWriter pdfWriter(fileName);
    pdfWriter.setPageSize(QPagedPaintDevice::A4);
    pdfWriter.setPageMargins(QMargins(30, 30, 30, 30));
    QPainter painter(&pdfWriter);
    quint32 iWidth = pdfWriter.width();
    quint32 iHeight = pdfWriter.height();
    QSize s(iWidth, iHeight);
    quint32 iYPos = 10;

    for (int i=0; i<m_images.count(); ++i)
    {
        if (i >= 1) {
            qDebug() << "new page added " <<pdfWriter.newPage();
        }

        QImage img = m_images.at(i);
        if(!img.isNull())
        {
            img = img.scaledToWidth(iWidth);
            painter.drawImage(QRectF(0, 0, img.width(), img.height()), img, img.rect());
            iYPos += img.height() + 250;
        }
    }
    painter.end();
    emit saveComplete();

}

void CustomPrint::print(QVariant data)
{
    QString fileName = QFileDialog::getSaveFileName(0, tr("Save File"),
                                                    "untitled.pdf",
                                                    tr("*.pdf"));
    QPdfWriter pdfWriter(fileName);
    pdfWriter.setPageSize(QPagedPaintDevice::A4);
    pdfWriter.setPageMargins(QMargins(30, 30, 30, 30));
    QPainter painter(&pdfWriter);
    quint32 iWidth = pdfWriter.width();
    quint32 iHeight = pdfWriter.height();
    QSize s(iWidth, iHeight);
    quint32 iYPos = 10;

    qDebug() <<iWidth << " height " << iHeight<< "************************************************* print pdf resolution" <<pdfWriter.resolution();
    QImage img = qvariant_cast<QImage>(data);
    qDebug() <<img.width() << " height " << img.height()<< "************************************************* ";
    if(!img.isNull())
    {
        img.scaled(s, Qt::KeepAspectRatio, Qt::FastTransformation);
        qDebug() <<img.width() << " height " << img.height()<< "************************************************* after";
        painter.drawImage(QRectF(0, iYPos, iWidth, iHeight), img, img.rect());
        iYPos += img.height() + 250;
        painter.end();
    }
    emit saveComplete();
}
