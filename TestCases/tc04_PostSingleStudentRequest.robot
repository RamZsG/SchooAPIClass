*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${BASEURL}=     http://thetestingworldapi.com/
*** Test Cases ***
tc01_GetStudentDetails
    Create Session  MySession   ${BASEURL}
    &{REQUEST_PAYLOAD}=     create dictionary   first_name=Ramcees  middle_name=Ulises  last_name=Gonzalez  date_of_birth=05/05/1940
    ${RESPONSE}=    post on session  MySession   /api/studentsDetails   data=&{REQUEST_PAYLOAD}
    log to console  ${RESPONSE.status_code}
    log to console  ${RESPONSE.content}
    #Validations
    ${RESPONSE_STATUS_CODE}=    convert to string  ${RESPONSE.status_code}
    should be equal   ${RESPONSE_STATUS_CODE}   201
