#ifndef SERVER_H
#define SERVER_H

#include "client.h"

class Server
{

private:
    QSet <Client *> chatters;

public:
    Server();
    ~Server();
    void addClient(Client *c);
    void dropClient(Client *c);
    void sendText(QString t);
};

#endif // SERVER_H
