/**
* LICENSE PLACEHOLDER
*
* @file qcdm_memory_read_worker.cpp
* @class QcdmMemoryReadWorker
* @package openpst/qcdm
* @brief Handles background processing of memory reading
*
* @author Gassan Idriss <ghassani@gmail.com>
*/

#include "worker/qcdm_memory_read_worker.h"

using namespace OpenPST;

QcdmMemoryReadWorker::QcdmMemoryReadWorker(QcdmSerial& port, QcdmMemoryReadWorkerRequest request, QObject *parent) :
    port(port),
    request(request),
    QThread(parent),
    cancelled(false)
{

}

QcdmMemoryReadWorker::~QcdmMemoryReadWorker()
{

}

void QcdmMemoryReadWorker::cancel()
{
    cancelled = true;
}

void QcdmMemoryReadWorker::run()
{
    return;
}