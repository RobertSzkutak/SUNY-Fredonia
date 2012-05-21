#include "searchreplace.h"
#include "ui_searchreplace.h"

searchreplace::searchreplace(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::searchreplace)
{
    ui->setupUi(this);
    search = ui->pushButton;
    replace = ui->pushButton_2;
    searchText = ui->lineEdit;
    replaceText = ui->lineEdit_2;
    connect(ui->lineEdit, SIGNAL(textChanged(QString)), this, SLOT(enableCheck()));
    connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(findText()));
    connect(ui->pushButton_2, SIGNAL(clicked()), this, SLOT(replaceTextEdit()));
}

searchreplace::~searchreplace()
{
    delete ui;
}

void searchreplace::enableCheck()
{
    replace->setDisabled(true);
    if(!searchText->text().isEmpty())
        search->setEnabled(true);
    else
        search->setDisabled(true);
}

void searchreplace::findText()
{
    QString qs = window->te->toPlainText();
    QString qtext = searchText->text();
    if(qs.contains(searchText->text()))//Search to see if the text exists in the TextArea
    {
        replace->setEnabled(true);//Enable the replace button
        replaceText->setText("");
        int posStart, posEnd;
        posStart = qs.indexOf(searchText->text(), 0, Qt::CaseSensitive);//Find the starting point of the text searched for
        posEnd = posStart + qtext.length();//Find the end point of the text searched for
        QTextCursor *cursor = &window->te->textCursor();//Point to the textcursor in the main Assignment2 window
        cursor->setPosition(posStart, QTextCursor::MoveAnchor);//Move the cursor to the beginning point of text searched for and drop the anchor
        cursor->setPosition(posEnd, QTextCursor::KeepAnchor);//Move the cursor to the end point of the text we searched for
        window->activateWindow();//By activiating the Assignment2 window we can view the cursor
        this->activateWindow();//We reactivate the search and replace Dialog since we are still using it
    }
    else
    {
        replace->setDisabled(true);
        replaceText->setText("Search unsuccessful");
    }
}

void searchreplace::replaceTextEdit()
{
    QString qs = window->te->toPlainText();
    qs.replace(searchText->text(), replaceText->text());
    window->te->setText(qs);
    replaceText->setText("");
    replace->setDisabled(true);//Deactivate the replace function, it must be searched to be activated again
}
