#!/bin/bash
echo "$(date)" >> executor.log
echo $AMX_RECEIVER >> executor.log
echo $AMX_STATUS >> executor.log
echo $AMX_EXTERNAL_URL >> executor.log
echo $AMX_LABEL_alertname >>executor.log
echo "AMX_LABEL_instance "$AMX_LABEL_instance >> executor.log
