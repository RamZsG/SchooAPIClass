*** Settings ***
Resource  ../Resources/FetchData.robot

*** Variables ***

*** Test Cases ***
tc01_CreateAStudentEndToEnd
    ${id}=  I Create A Student  Clark   Michael     Kent    05/05/1980
    Then    I Get Student Details   ${id}
