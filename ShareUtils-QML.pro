TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

SOURCES += shareutils.cpp
HEADERS += shareutils.h

ios {
    OBJECTIVE_SOURCES += ios/iosshareutils.mm
    HEADERS += ios/iosshareutils.h

    Q_ENABLE_BITCODE.name = ENABLE_BITCODE
    Q_ENABLE_BITCODE.value = NO
    QMAKE_MAC_XCODE_SETTINGS += Q_ENABLE_BITCODE
}

android {
    QT += androidextras
    OTHER_FILES += android_data/src/com/lasconic/QShareUtils.java
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android_data
    SOURCES += android/androidshareutils.cpp
    HEADERS += android/androidshareutils.h
}

# Default rules for deployment.
include(deployment.pri)
