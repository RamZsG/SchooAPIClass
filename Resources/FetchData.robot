*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${BASEURL}=     http://thetestingworldapi.com/

*** Keywords ***
I Get Student Details
    [Arguments]  ${id}
    ${Get_Response}=   get on session   MySession   /api/studentsDetails/${id}
    log to console  ${Get_Response.status_code}
    log to console  ${Get_Response.content}
I Create A Student
    [Arguments]  ${FirstName}   ${MiddleName}   ${LasttName}    ${DOB}
    Create Session  MySession   ${BASEURL}
    &{Body}=    create dictionary  first_name=${FirstName}  middle_name=${MiddleName}  last_name=${LasttName}  date_of_birth=${DOB}
    ${Post_Response}=   post on session  MySession  /api/studentsDetails    data=&{Body}
    ${JSonPostResponse}=    to json  ${Post_Response.content}
    @{idList}=  get value from json   ${JSonPostResponse}   id
    ${id}=  get from list  ${idList}    0
    [Return]    ${id}