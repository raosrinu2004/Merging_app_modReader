#ifndef CUSTOMPRINT_H
#define CUSTOMPRINT_H

#include <QObject>
#include <QVariant>

class CustomPrint : public QObject
{
    Q_OBJECT
public:
    explicit CustomPrint(QObject *parent = nullptr);

    Q_INVOKABLE void print(QVariant data);
    Q_INVOKABLE void printPNG(QVariant data);
    void printTest();
    Q_INVOKABLE void clearImagesList();
    Q_INVOKABLE void addImage(QVariant data);
    Q_INVOKABLE void createPdf();

signals:
    void saveComplete();

public slots:
private:
    QList <QImage> m_images;
};

#endif // CUSTOMPRINT_H
