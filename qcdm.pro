#-------------------------------------------------
# QMake Build Script for: openpst/qcdm
#-------------------------------------------------

lessThan(QT_MAJOR_VERSION, 5): error("At least Qt 5.0 is required")

QT       += core gui widgets xml
CONFIG   += C++11 debug_and_release build_all
TARGET   = qcdm
TEMPLATE = app

equals(BASE_DIR, ""):  BASE_DIR = $$PWD

include($$BASE_DIR/lib/gui-common/gui-common.pri)
include($$BASE_DIR/lib/gui-common/gui-common.pro)
include($$BASE_DIR/lib/libopenpst/libopenpst.pri)

INCLUDEPATH +=  $$BASE_DIR/include \
                $$BASE_DIR/lib/libopenpst/include \
                $$BASE_DIR/lib/libopenpst/lib/serial/include \
                $$BASE_DIR/lib/gui-common/include 

SOURCES += \
    $$BASE_DIR/src/qcdm_window.cpp \
    $$BASE_DIR/src/worker/qcdm_efs_directory_tree_worker.cpp \
    $$BASE_DIR/src/worker/qcdm_efs_file_read_worker.cpp \
    $$BASE_DIR/src/worker/qcdm_efs_file_write_worker.cpp \
    $$BASE_DIR/src/worker/qcdm_memory_read_worker.cpp \
    $$BASE_DIR/src/worker/qcdm_prl_read_worker.cpp \
    $$BASE_DIR/src/worker/qcdm_prl_write_worker.cpp \
    $$BASE_DIR/src/worker/qcdm_nv_item_read_worker.cpp \
    $$BASE_DIR/src/main.cpp

HEADERS  += \
    $$BASE_DIR/include/qcdm_window.h \
    $$BASE_DIR/include/worker/qcdm_efs_directory_tree_worker.h \
    $$BASE_DIR/include/worker/qcdm_efs_file_read_worker.h \
    $$BASE_DIR/include/worker/qcdm_efs_file_write_worker.h \
    $$BASE_DIR/include/worker/qcdm_memory_read_worker.h \
    $$BASE_DIR/include/worker/qcdm_prl_read_worker.h \
    $$BASE_DIR/include/worker/qcdm_prl_write_worker.h \
    $$BASE_DIR/include/worker/qcdm_nv_item_read_worker.h


FORMS  += $$BASE_DIR/resources/ui/qcdm_window.ui

RESOURCES = $$BASE_DIR/resources/qcdm.qrc
