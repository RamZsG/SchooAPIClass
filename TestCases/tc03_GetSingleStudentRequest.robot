*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${BASEURL}=     http://thetestingworldapi.com/
*** Test Cases ***
tc01_GetStudentDetails
    Create Session  MySession   ${BASEURL}
    ${RESPONSE}=    get on session  MySession   /api/studentsDetails
    #log to console  ${RESPONSE.status_code}
    #log to console  ${RESPONSE.content}
    #Validations
    ${RESPONSE_STATUS_CODE}=    convert to string  ${RESPONSE.status_code}
    should be equal   ${RESPONSE_STATUS_CODE}   200
    ${JSON_RESPONSE}=   To Json  ${RESPONSE.content}
    @{NameList}=    get value from json  ${JSON_RESPONSE}     [75].first_name
    ${FirstName}=   get from list  ${NameList}  0
    #should be equal  ${FirstName}   Yakir
    @{NameList}=    get value from json  ${JSON_RESPONSE}     [75].last_name
    ${LastName}=   get from list  ${NameList}  0
    should be equal  ${LastName}   Moshe