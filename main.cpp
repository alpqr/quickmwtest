#include <QGuiApplication>
#include <QQmlContext>
#include <QQuickView>
#include <QDebug>

static QQuickView *addView(QScreen *screen, int screenIdx)
{
    qDebug("Creating new QQuickView for screen %p", screen);
    QQuickView *v = new QQuickView;
    v->setScreen(screen);
    v->setResizeMode(QQuickView::SizeRootObjectToView);
    v->rootContext()->setContextProperty("screenIdx", screenIdx);
    v->setSource(QUrl("qrc:/screen.qml"));
    return v;
}

int main(int argc, char **argv)
{
    qputenv("QT_LOGGING_RULES", "qt.qpa.*=true");
    qputenv("QSG_INFO", "1");

    QGuiApplication app(argc, argv);

    QList<QScreen *> screens = app.screens();
    qDebug("Application sees %d screens", screens.count());
    qDebug() << screens;

    QVector<QQuickView *> views;
    for (int i = 0; i < screens.count(); ++i) {
        QQuickView *v = addView(screens[i], i);
        views.append(v);
        v->showFullScreen();
    }

    int r = app.exec();

    qDeleteAll(views);
    return r;
}
