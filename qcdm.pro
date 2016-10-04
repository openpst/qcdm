#-------------------------------------------------
# QMake Build Script for: openpst/qcdm
#-------------------------------------------------

lessThan(QT_MAJOR_VERSION, 5): error("At least Qt 5.0 is required")

QT += core gui widgets xml

CONFIG += C++11

TARGET = qcdm

TEMPLATE = app

equals(BASE_DIR, ""):		BASE_DIR 		= $$PWD
equals(LIBOPENPST_DIR, ""):	LIBOPENPST_DIR 	= $$PWD/lib/libopenpst
equals(GUICOMMON_DIR, ""):  GUICOMMON_DIR 	= $$PWD/lib/gui-common
equals(BUILD_DIR, ""):   	BUILD_DIR 		= $$PWD/build

INCLUDEPATH += \
	$$BASE_DIR/include \
	$$LIBOPENPST_DIR/include \
	$$LIBOPENPST_DIR/lib/serial/include \
	$$GUICOMMON_DIR/include

DEPENDPATH += $$BASE_DIR/

VPATH += $$BASE_DIR/

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

###
## Include gui-common .pro
###

include($$GUICOMMON_DIR/gui-common.pro)

###
## Make libopenpst and link against it
###

QMAKE_EXTRA_TARGETS += libopenpst
PRE_TARGETDEPS 		+= libopenpst
libopenpst.commands = cd $$LIBOPENPST_DIR && make qmake

LIBS += -L$$LIBOPENPST_DIR/build -lopenpst