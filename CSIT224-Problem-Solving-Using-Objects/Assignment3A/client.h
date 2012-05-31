#ifndef CLIENT_H
#define CLIENT_H

#include <QtCore>
#include <QDialog>
#include <QTextEdit>
#include <QLineEdit>

#include <iostream>
using namespace std;

class Server;

namespace Ui
{
    class Client;
}

class Client : public QDialog
{
    Q_OBJECT

public:
    explicit Client(QWidget *parent = 0);
    ~Client();
    void rcvText(QString t);
    void Talk(QString t);
    void Setup(QString,Server *);
    QString getName(){ return name; }

private slots:
    void exitSlot();
    void returnPressedSlot();

private:
    Ui::Client *ui;
    QString name;//Name of the user
    Server *serv;//Server connected to the client
    QTextEdit *te;//Text edit displays chat
    QLineEdit *le;//Line edit displays text to send to chat by pressing return key
};

#endif // CLIENT_H
