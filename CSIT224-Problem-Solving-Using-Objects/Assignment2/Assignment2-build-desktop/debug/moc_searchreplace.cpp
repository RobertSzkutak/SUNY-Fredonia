/****************************************************************************
** Meta object code from reading C++ file 'searchreplace.h'
**
** Created: Thu Oct 20 13:16:42 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Assignment2/searchreplace.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'searchreplace.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_searchreplace[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x08,
      29,   14,   14,   14, 0x08,
      40,   14,   14,   14, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_searchreplace[] = {
    "searchreplace\0\0enableCheck()\0findText()\0"
    "replaceTextEdit()\0"
};

const QMetaObject searchreplace::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_searchreplace,
      qt_meta_data_searchreplace, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &searchreplace::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *searchreplace::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *searchreplace::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_searchreplace))
        return static_cast<void*>(const_cast< searchreplace*>(this));
    return QDialog::qt_metacast(_clname);
}

int searchreplace::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: enableCheck(); break;
        case 1: findText(); break;
        case 2: replaceTextEdit(); break;
        default: ;
        }
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
