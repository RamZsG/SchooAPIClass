*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASEURL}=     http://thetestingworldapi.com/
*** Test Cases ***
tc01_getStudentdetails
    CREATE SESSION  MySession       ${baseurl}
    ${RESPONSE}=    GET On Session  MySession       /api/studentsDetails
    LOG TO CONSOLE  ${RESPONSE.status_code}
    LOG TO CONSOLE  ${RESPONSE.content}