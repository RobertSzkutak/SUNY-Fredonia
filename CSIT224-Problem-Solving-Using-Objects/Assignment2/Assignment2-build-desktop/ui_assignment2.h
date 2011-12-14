/********************************************************************************
** Form generated from reading UI file 'assignment2.ui'
**
** Created: Thu Oct 20 11:41:08 2011
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ASSIGNMENT2_H
#define UI_ASSIGNMENT2_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QGridLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QMainWindow>
#include <QtGui/QMenu>
#include <QtGui/QMenuBar>
#include <QtGui/QStatusBar>
#include <QtGui/QTextEdit>
#include <QtGui/QToolBar>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Assignment2
{
public:
    QAction *actionFile;
    QAction *actionSearch_and_Replace;
    QAction *actionQuit;
    QWidget *centralWidget;
    QGridLayout *gridLayout;
    QTextEdit *textEdit;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;
    QMenuBar *menuBar;
    QMenu *menuText_Editor;
    QMenu *menuEdit;

    void setupUi(QMainWindow *Assignment2)
    {
        if (Assignment2->objectName().isEmpty())
            Assignment2->setObjectName(QString::fromUtf8("Assignment2"));
        Assignment2->resize(652, 313);
        actionFile = new QAction(Assignment2);
        actionFile->setObjectName(QString::fromUtf8("actionFile"));
        actionSearch_and_Replace = new QAction(Assignment2);
        actionSearch_and_Replace->setObjectName(QString::fromUtf8("actionSearch_and_Replace"));
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/search/search.png"), QSize(), QIcon::Normal, QIcon::Off);
        actionSearch_and_Replace->setIcon(icon);
        actionQuit = new QAction(Assignment2);
        actionQuit->setObjectName(QString::fromUtf8("actionQuit"));
        QIcon icon1;
        icon1.addFile(QString::fromUtf8(":/quit/quit.png"), QSize(), QIcon::Normal, QIcon::Off);
        icon1.addFile(QString::fromUtf8("../../../../Users/Bobby/Downloads/dog.png"), QSize(), QIcon::Normal, QIcon::On);
        actionQuit->setIcon(icon1);
        centralWidget = new QWidget(Assignment2);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        gridLayout = new QGridLayout(centralWidget);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        textEdit = new QTextEdit(centralWidget);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setEnabled(true);
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(textEdit->sizePolicy().hasHeightForWidth());
        textEdit->setSizePolicy(sizePolicy);

        gridLayout->addWidget(textEdit, 1, 0, 1, 1);

        Assignment2->setCentralWidget(centralWidget);
        mainToolBar = new QToolBar(Assignment2);
        mainToolBar->setObjectName(QString::fromUtf8("mainToolBar"));
        Assignment2->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(Assignment2);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        Assignment2->setStatusBar(statusBar);
        menuBar = new QMenuBar(Assignment2);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 652, 21));
        menuText_Editor = new QMenu(menuBar);
        menuText_Editor->setObjectName(QString::fromUtf8("menuText_Editor"));
        menuEdit = new QMenu(menuBar);
        menuEdit->setObjectName(QString::fromUtf8("menuEdit"));
        Assignment2->setMenuBar(menuBar);

        mainToolBar->addAction(actionSearch_and_Replace);
        mainToolBar->addAction(actionQuit);
        menuBar->addAction(menuText_Editor->menuAction());
        menuBar->addAction(menuEdit->menuAction());
        menuText_Editor->addAction(actionQuit);
        menuEdit->addAction(actionSearch_and_Replace);

        retranslateUi(Assignment2);
        QObject::connect(actionQuit, SIGNAL(activated()), Assignment2, SLOT(close()));

        QMetaObject::connectSlotsByName(Assignment2);
    } // setupUi

    void retranslateUi(QMainWindow *Assignment2)
    {
        Assignment2->setWindowTitle(QApplication::translate("Assignment2", "Text Editor", 0, QApplication::UnicodeUTF8));
        actionFile->setText(QApplication::translate("Assignment2", "Save", 0, QApplication::UnicodeUTF8));
        actionSearch_and_Replace->setText(QApplication::translate("Assignment2", "Search and Replace", 0, QApplication::UnicodeUTF8));
        actionQuit->setText(QApplication::translate("Assignment2", " Quit", 0, QApplication::UnicodeUTF8));
        menuText_Editor->setTitle(QApplication::translate("Assignment2", "File", 0, QApplication::UnicodeUTF8));
        menuEdit->setTitle(QApplication::translate("Assignment2", "Edit", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class Assignment2: public Ui_Assignment2 {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ASSIGNMENT2_H
