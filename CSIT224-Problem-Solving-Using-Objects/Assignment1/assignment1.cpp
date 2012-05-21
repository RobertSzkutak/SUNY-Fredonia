#include "assignment1.h"

Assignment1::Assignment1()
{
        lineEdit = new QLineEdit();
        quit = new QPushButton();
        quit->setText("Quit");
        textArea = new QTextEdit();
        textArea->setReadOnly(true);
        QObject::connect(quit, SIGNAL(clicked()), qApp, SLOT(quit()));
        hLayout = new QHBoxLayout();
        hLayout->addWidget(lineEdit);
        hLayout->addWidget(quit);
        vLayout = new QVBoxLayout();
        vLayout->addWidget(textArea);
        vLayout->addLayout(hLayout);
        window = new QWidget();
        window->setBaseSize(640, 480);
        window->setLayout(vLayout);
        QObject::connect(lineEdit, SIGNAL(returnPressed()), this, SLOT(slotFunction()));

}

Assignment1::~Assignment1(){}

void Assignment1::slotFunction()
{
        textArea->append(lineEdit->text());
        lineEdit->clear();
}

void Assignment1::ShowObject()
{
        window->show();
}
