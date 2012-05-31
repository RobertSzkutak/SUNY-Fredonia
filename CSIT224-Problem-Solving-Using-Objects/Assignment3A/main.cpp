#include <QtGui/QApplication>

#include "server.h"
#include "client.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    Server *serve = new Server();

    Client *client1 = new Client(0);
    Client *client2 = new Client(0);
    Client *client3 = new Client(0);

    client1->Setup("Joeseph", serve);
    serve->addClient(client1);
    client2->Setup("Samantha", serve);
    serve->addClient(client2);
    client3->Setup("Dennis", serve);
    serve->addClient(client3);

    client1->show();
    client2->show();
    client3->show();

    return a.exec();
}
