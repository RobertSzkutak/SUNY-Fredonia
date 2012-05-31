#include "server.h"

Server::Server(){}

Server::~Server(){}

//Adds a client to the list of clients connected to the server
void Server::addClient(Client *c)
{
    chatters.insert(c);
}

//Removes a client from the list of clients connected to the server
void Server::dropClient(Client *c)
{
    QString temp = c->getName();
    chatters.remove(c);
    sendText(temp + " has left the chat!");

    if(chatters.size() == 0)
        delete this;//Close the server program properly
}

//Sends text to all connected clients
void Server::sendText(QString t)
{
  QSetIterator <Client *> i(chatters);
  while (i.hasNext()) i.next()->rcvText(t);
}
