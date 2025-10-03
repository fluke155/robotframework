*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Suite Setup    Create Test User

*** Variables ***
${BASE_URL}    https://aod-fontend.pages.dev/apiS

*** Test Cases ***
Read User
    [Documentation]    อ่านข้อมูล user ที่ถูกสร้างใน Suite Setup
    ${response}=    GET On Session    my_session    /${user_id}
    Should Be Equal As Integers    ${response.status_code}    200

Update User
    [Documentation]    อัปเดตข้อมูล user
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    name=Jane Doe    email=jane.doe@example.com
    ${response}=    PUT On Session    my_session    /${user_id}    json=${payload}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200

Delete User
    [Documentation]    ลบ user
    ${response}=    DELETE On Session    my_session    /${user_id}
    Should Be Equal As Integers    ${response.status_code}    200


*** Keywords ***
Create Test User
    [Documentation]    
    Create Session    my_session    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    name=John Doe    email=john.doe@example.com
    ${response}=    POST On Session    my_session    /    json=${payload}    headers=${headers}
    Log To Console    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    201
    ${user_id}=    Get Value From Json    ${response.json()}    id
    Set Suite Variable    ${user_id}
