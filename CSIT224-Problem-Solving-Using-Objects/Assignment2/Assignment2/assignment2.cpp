#include "assignment2.h"
#include "ui_assignment2.h"
#include "searchreplace.h"

Assignment2::Assignment2(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Assignment2)
{
    ui->setupUi(this);
    te = ui->textEdit;
    connect(ui->actionSearch_and_Replace, SIGNAL(activated()), this, SLOT(openNewWindow()));
}

Assignment2::~Assignment2()
{
    delete ui;
}

void Assignment2::openNewWindow()
{
    searchreplace *s = new searchreplace();
    s->setMyMainWindow(this);//Point to the instance of this Assignment2 class from the dialog so they can interact
    s->exec();
}
