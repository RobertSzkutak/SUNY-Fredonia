#ifndef ASSIGNMENT2_H
#define ASSIGNMENT2_H

#include <QMainWindow>
#include <QTextEdit>

namespace Ui
{
    class Assignment2;
}

class Assignment2 : public QMainWindow
{
    Q_OBJECT

public:
    explicit Assignment2(QWidget *parent = 0);
    ~Assignment2();
    QTextEdit *te;//Represents the main TextEdit Box

public slots:
    void openNewWindow();//This opens the Dialog window when the search and replace action is chosen

private:
    Ui::Assignment2 *ui;
};

#endif // ASSIGNMENT2_H
