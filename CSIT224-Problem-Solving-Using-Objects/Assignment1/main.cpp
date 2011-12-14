#include <QApplication>
#include <QtGui>

#include "assignment1.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    Assignment1 *assignment1 = new Assignment1();
    assignment1->ShowObject();

    return app.exec();
}
