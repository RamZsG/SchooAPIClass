*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${BASEURL}=     http://thetestingworldapi.com/
*** Test Cases ***
tc01_CreateAStudentEndToEnd
    Create Session  MySession   ${BASEURL}
    &{Body}=    create dictionary  first_name=Ramcees  middle_name=Ulises  last_name=Gonzalez  date_of_birth=05/05/1940
    ${Post_Response}=   post on session  MySession  /api/studentsDetails    data=&{Body}
    #log to console  ${Post_Response.status_code}
    #log to console  ${Post_Response.content}
    ${JSonPostResponse}=    to json  ${Post_Response.content}
    @{idList}=  get value from json   ${JSonPostResponse}   id
    ${id}=  get from list  ${idList}    0
    log to console  ${id}
    # Get Request Post
    ${Get_Response1}=   get on session   MySession   /api/studentsDetails/${id}
    log to console  ${Get_Response1.status_code}
    log to console  ${Get_Response1.content}
    # Validation
    ${code}=    convert to string   ${Post_Response.status_code}
    should be equal         ${code}         201
    # Put Request
    &{Body_Put}=    create dictionary  id=${id}  first_name=John  middle_name=Ulises  last_name=Connor  date_of_birth=05/05/1940
    ${Put_Response}=   put on session  MySession  /api/studentsDetails/${id}    data=&{Body_Put}
    log to console  ${Put_Response.status_code}
    log to console  ${Put_Response.content}
    # Get Request Put
    ${Get_Response3}=   get on session   MySession   /api/studentsDetails/${id}
    log to console  ${Get_Response3.status_code}
    log to console  ${Get_Response3.content}
    # Delete Request
    ${Delete_Response}=   delete on session   MySession   /api/studentsDetails/${id}
    log to console  ${Delete_Response.status_code}
    log to console  ${Delete_Response.content}
    # Get Request Deleted
    ${Get_Response4}=   get on session   MySession   /api/studentsDetails/${id}
    log to console  ${Get_Response4.status_code}
    log to console  ${Get_Response4.content}