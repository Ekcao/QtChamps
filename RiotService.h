#ifndef RIOTSERVICE_H
#define RIOTSERVICE_H

#include <QObject>
#include <QUrl>
#include <QString>
#include <QStringList>
#include <QMap>
#include <QVariantList>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class RiotService : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString version MEMBER version NOTIFY versionChanged)
    Q_PROPERTY(QString dataDragonPortrait READ dataDragonPortrait CONSTANT)
    Q_PROPERTY(QString dataDragonSpell READ dataDragonSpell CONSTANT)
    Q_PROPERTY(QVariantList champs MEMBER champs NOTIFY champsChanged)

private:
    QNetworkAccessManager manager;
    QMap<QString, QString> urlMap;
    QString apiKey;
    QString staticDataURL;
    QString version;
    QVariantList champs;
    QStringList champNames;

public:
    RiotService(QObject *parent = 0);

    QString dataDragonPortrait() const {
        return urlMap["dataDragonPortrait"];
    }

    QString dataDragonSpell() const {
        return urlMap["dataDragonSpell"];
    }

public slots:
    void getChampions();
    void parseChampsJson(QNetworkReply *reply);
    bool hasApiKey();
    void saveApiKey(const QString &s);

signals:
    void versionChanged();
    void dataDragonURLChanged();
    void champsChanged();
    void noApiKey();
};

#endif // RIOTSERVICE_H


