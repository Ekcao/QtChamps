#include <QGuiApplication>
#include <QQuickItem>
#include <QQuickView>
#include <QQmlContext>
#include <QSettings>

#include "RiotService.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Eric Cao");
    app.setApplicationName("League Champs");
    QQuickView view;
    view.setTitle(app.applicationName());

    RiotService riot;
    view.rootContext()->setContextProperty("Riot", &riot);
    view.setSource(QUrl("qrc:/main.qml"));

    QObject *item = view.rootObject();
    QObject::connect(&riot, SIGNAL(noApiKey()), item, SLOT(showInputDialog()));
    riot.getChampions();

    view.show();

    return app.exec();
}
