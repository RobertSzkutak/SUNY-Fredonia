#include "client.h"
#include "ui_client.h"
#include "server.h"

//Constructor
Client::Client(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Client)
{
    ui->setupUi(this);
    te = ui->textEdit;
    le = ui->lineEdit;
    connect(this, SIGNAL(finished(int)), this, SLOT(exitSlot()));
    connect(le, SIGNAL(returnPressed()), this, SLOT(returnPressedSlot()));
}

//Destructor
Client::~Client()
{
    cout << "INSIDE DESTRCUTOR!!!\n";
    delete serv;
    delete te;
    delete le;
    delete ui;
}

//Appends text to the EditText
void Client::rcvText(QString t)
{
    te->append(t);
}

//Sends text to the Server
void Client::Talk(QString t)
{
    serv->sendText("<" + name + "> " + t);
}

//Sets default settings in the client
void Client::Setup(QString n, Server *s)
{
    name = n;
    serv = s;
    this->setWindowTitle(n);
    te->append("Welcome to the chat " + this->name + "!");
    serv->sendText(this->name + " joined the chat");
}

//Called when the Dialog is closed
void Client::exitSlot()
{
    serv->dropClient(this);
}

//Called when the return key is pressed
void Client::returnPressedSlot()
{
    this->Talk(le->text());
    le->clear();
}
