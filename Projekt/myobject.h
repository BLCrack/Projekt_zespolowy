#ifndef MYOBJECT_H
#define MYOBJECT_H
#include <QObject>
#include <QDirIterator>
#include <QStandardPaths>
class MyObject : public QObject{
   Q_OBJECT
public:
    Q_INVOKABLE int usun(){
        QString url = QStandardPaths::writableLocation(QStandardPaths::DownloadLocation);

        QDirIterator it(url, QDirIterator::Subdirectories);

        while (it.hasNext()) {
                std::string file = it.next().toStdString();
                if (file[file.length() - 5] == '.' && file[file.length() - 4] == 'J' && file[file.length() - 3] == 'S' && file[file.length() - 2] == 'O' && file[file.length() - 1] == 'N') {
                    remove(file.c_str());
                }
        }
        return 1;
    }
};

#endif // MYOBJECT_H
