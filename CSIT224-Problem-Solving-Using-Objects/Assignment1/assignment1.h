#ifndef ASSIGNMENT1_H
#define ASSIGNMENT1_H

#include <QApplication>
#include <QtGui>

class Assignment1 : public QDialog
{
    Q_OBJECT
        private:
                QTextEdit* textArea;
                QLineEdit* lineEdit;
                QPushButton* quit;
                QHBoxLayout* hLayout;
                QVBoxLayout* vLayout;
                QWidget* window;
        private slots:
                void slotFunction();
        public:
                Assignment1();
                ~Assignment1();
                void ShowObject();
};
#endif
