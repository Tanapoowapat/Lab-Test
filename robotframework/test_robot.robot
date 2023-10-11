*** Settings ***
Library           requests

*** Keywords ***
Get HelloWorld JSON
    ${resp}=     Get     http://127.0.0.1:5001/
    
    # Verify the response status code is 200
    Should Be Equal     ${resp.status_code}     ${200}

    # Get the response body as JSON
    [return]     ${resp.json()}

Get Is_prime
    [Arguments]    ${num}
    ${resp}=    Get     http://127.0.0.1:5001/is_prime/${num}

    # Verify the status code is 200
    Should Be Equal    ${resp.status_code}   ${200}

    # Get response content as bytes
    [Return]    ${resp.content}

Get worong_port_url
    ${resp}=    Get     http://127.0.0.1:5002/

    # Verify the status code is 404
    Should Be Equal    ${resp.status_code}   ${200}

    # Get response content as bytes
    [Return]    ${resp.content}

*** Test Cases ***
Test HelloWorld JSON
    ${resp}=     Get HelloWorld JSON
    Should Be Equal    ${resp['message']}     Hello, World!
Test Is_prime
    ${resp}=    Get Is_prime    ${17}
    Should Be Equal As Strings   ${resp}    True

Test is_not_prime
    ${resp}=    Get Is_prime    ${36}
    Should Be Equal As Strings    ${resp}    False