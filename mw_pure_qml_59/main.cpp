#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char **argv)
{
    qputenv("QT_LOGGING_RULES", "qt.qpa.*=true");
    qputenv("QSG_INFO", "1");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine(":/main.qml");

    return app.exec();
}
