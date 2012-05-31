#include <QtGui/QApplication>
#include "assignment2.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Assignment2 w;
    w.show();

    return a.exec();
}
