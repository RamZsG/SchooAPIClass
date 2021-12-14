*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${BASEURL}=     https://reqres.in/
*** Test Cases ***
tc01_GetUserPagesStatusCode
    Create Session  MySession   ${BASEURL}
    &{PARAMS}   create dictionary   page=2
    ${RESPONSE}=    GET On Session  MySession       api/users   params=&{PARAMS}
    LOG TO CONSOLE  ${RESPONSE.status_code}
    LOG TO CONSOLE  ${RESPONSE.content}
    ${RESPONSE_STATUS_CODE}=    convert to string  ${RESPONSE.status_code}
    should be equal   ${RESPONSE_STATUS_CODE}   200
    ${JSON_RESPONSE}=   To Json  ${RESPONSE.content}
    @{NameList}=    get value from json  ${JSON_RESPONSE}     data[3].first_name
    ${FirstName}=   get from list  ${NameList}  0
    #log to console  ${FirstName}
    should be equal  ${FirstName}   Byron
    @{EmailList}=   get value from json  ${JSON_RESPONSE}      data[3].email
    ${email}=       get from list  ${EmailList}     0
    should contain  ${email}    byron