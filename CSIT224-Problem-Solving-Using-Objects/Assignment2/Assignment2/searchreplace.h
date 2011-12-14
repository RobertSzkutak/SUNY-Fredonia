#ifndef SEARCHREPLACE_H
#define SEARCHREPLACE_H

#include <QDialog>
#include <QMainWindow>
#include <QLineEdit>
#include <QPushButton>
#include <QString>

#include "assignment2.h"

namespace Ui
{
    class searchreplace;
}

class searchreplace : public QDialog
{
    Q_OBJECT

public:
    explicit searchreplace(QWidget *parent = 0);
    ~searchreplace();
    void setMyMainWindow(Assignment2 *window){ this->window = window; }//Setter method

private slots:
    void enableCheck();//Enables or disables the search button when text is changed
    void findText();//Searches for text in TextEdit of Assignment2 and if found enables the replace function and highlights the text with the cursor
    void replaceTextEdit();//Replaces text in TextEdit of Assignment2

private:
    Ui::searchreplace *ui;
    Assignment2 *window;//Points to the primary Assigmet2 Window
    QPushButton *search, *replace;//Represents the search and replace buttons in the ui form
    QLineEdit *searchText, *replaceText;//Represents the seach and replace line edits in the ui form
};

#endif // SEARCHREPLACE_H
