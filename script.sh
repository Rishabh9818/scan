#!/bin/bash
source functions.sh
source log-functions.sh
cd  "${WORKSPACE}"/"${CODEBASE_DIR}"

if [ -d "reports" ]; then
    true
else
    mkdir reports
fi
STATUS=0

logInfoMessage "Scanning the code available at ${WORKSPACE}/${CODEBASE_DIR} "
sleep  "$SLEEP_DURATION"
logInfoMessage "Executing command"
logInfoMessage "scancode -cl --license --html reports/${OUTPUT_ARG} ${WORKSPACE}/${CODEBASE_DIR}"
scancode -cl --license --html reports/"${OUTPUT_ARG}" "${WORKSPACE}"/"${CODEBASE_DIR}"
STATUS=$(echo $?)
if [ -s "reports/${OUTPUT_ARG}" ]; then
   cat reports/"${OUTPUT_ARG}"
else
    echo "NO LICENSE FOUND IN SOURCE CODE "
fi

if [ "$STATUS" -eq 0 ]
then
  logInfoMessage "Congratulations license scan succeeded!!!"
  generateOutput "${ACTIVITY_SUB_TASK_CODE}" true "Congratulations License scan succeeded!"
else
  logErrorMessage "License scan failed!"
  generateOutput "${ACTIVITY_SUB_TASK_CODE}" true "Please check License scan failed!"
  exit 1
fi
