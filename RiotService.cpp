#include <QJsonDocument>
#include <QJsonObject>
#include <QDir>
#include <QNetworkRequest>
#include <QDebug>
#include <QByteArray>
#include <QFile>
#include <QSettings>


#include "RiotService.h"

RiotService::RiotService(QObject *parent) :
    QObject(parent)
{
    urlMap["base"] = "https://na.api.pvp.net/api/lol";
    urlMap["dataDragonPortrait"] = "http://ddragon.leagueoflegends.com/cdn/6.7.1/img/champion/";
    urlMap["staticData"] = "/static-data/na/v1.2/champion";

    connect(&manager,
        SIGNAL(finished(QNetworkReply*)),
        SLOT(parseChampsJson(QNetworkReply*)));
}

void RiotService::getChampions() {
    if (!hasApiKey()) {
        return;
    }

    QString url = urlMap["base"]
            .append(urlMap["staticData"]).append("?")
            .append("champData=image,passive,spells")
            .append("&api_key=").append(apiKey);

    QUrl qurl(url);
    QNetworkRequest request(qurl);
    manager.get(request);
}

void RiotService::parseChampsJson(QNetworkReply *reply) {
    if (reply->error()) {
        qDebug() << "Request failed";
    } else {
        qDebug() << "Request succeeded";

        QByteArray response = reply->readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(response);
        QJsonObject jsonObj = jsonDoc.object();
        QJsonObject jsonData = jsonObj["data"].toObject();

        for (auto d : jsonData) {
            champs.append(d.toObject().toVariantMap());
        }

        emit champsChanged();

        version = jsonObj["version"].toString();
        emit versionChanged();
    }

    reply->deleteLater();
}

bool RiotService::hasApiKey() {
    if (!QFile(QDir::currentPath() + "/settings.ini").exists()) {
        qDebug() << "File does not exist";
        emit noApiKey();
        return false;
    }

    QSettings settings(QDir::currentPath() + "/settings.ini", QSettings::IniFormat);

    apiKey = settings.value("apiKey").toString();

    if (apiKey.isEmpty()) {
        qDebug() << "No API key";
        emit noApiKey();
        return false;
    } else {
        qDebug() << "API key exists";
    }

    return true;
}

void RiotService::saveApiKey(const QString &s) {
    QSettings settings(QDir::currentPath() + "/settings.ini", QSettings::IniFormat);
    settings.setValue("apiKey", s);
}

#include "moc_RiotService.cpp"
