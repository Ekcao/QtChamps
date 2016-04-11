#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "RiotService.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Eric Cao");
    app.setApplicationName("League Champions");
    QQmlApplicationEngine engine;

    RiotService riot;
    engine.rootContext()->setContextProperty("Riot", &riot);
    engine.load(QUrl("qrc:/main.qml"));

    QObject *item = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(item);
    QObject::connect(&riot, SIGNAL(noApiKey()), window, SLOT(showInputDialog()));

    window->show();
    riot.getChampions();

    return app.exec();
}
