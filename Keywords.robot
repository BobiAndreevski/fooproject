*** Settings ***
Library     SeleniumLibrary
Library     DateTime

*** Variables ***
${Browser} =    Chrome
${Main_page Url} =  http://rental18.infotiv.net/webpage/html/gui/index.php
${User_FName} =     Bobi
${User_LName} =     Andreevski
${User_Password} =  ithögskolan
${User_Mail} =  bob.andreevski@gmail.com
${User_Phone} =     0769478222

*** Keywords ***
Begin Web Test
    Open Browser    about:blank     ${Browser}

User goes To Web Page
    Load main Page
    Start page Loaded

Load main Page
    Go To   ${Main page Url}

Load registration page
    Go To   http://rental18.infotiv.net/webpage/html/gui/userRegistration.php

Load About page
    Go to   http://rental18.infotiv.net/webpage/html/gui/about.php

Load Continue page
    Go to   http://rental18.infotiv.net/webpage/html/gui/showCars.php

Start page Loaded
    Wait Until Page Contains    When do you want to make your trip?

Page create user has loaded
    Wait Until Page Contains    Create a new user

User goes to crate user and puts in info and creates a user
    User pushes create user button
    User puts in valid information to create account
    User pushes Create Button

User pushes Create Button
    Click button    //*[@id="create"]

Verify Header
    Page Should Contain Element     xpath://*[@id="rightHeader"]

Press logo
    Click Element   xpath://*[@id="title"]

Confirm creditcard input
    Click Button    //*[@id="confirm"]

User pushes create user button
    Click Button    //*[@id="createUser"]

User pushes loginButton
    Click Button    //*[@id="login"]

User gets alert messege when atemt to login
    Page Should Contain Element     //*[@id="signInError"]

User is loged in to mypage
    Wait Until Page Contains    Logout

User enters login name
    Input Text  //*[@id="email"]    ${User Mail}

User enters login password
    Input Text  //*[@id="password"]     ${User Password}

User enters invalid login name
    Input Text  //*[@id="email"]    invalid_User_Name

User enters invalid login password
    Input Text  //*[@id="password"]     invalid_User_Password

Verify page contains Textfield and button
    Page Should Contain Textfield   //*[@id="name"]     //*[@id="last"]     //*[@id="phone"]
    Page Should Contain Textfield   //*[@id="emailCreate"]      //*[@id="passwordCreate"]
    Page Should Contain Button  //*[@id="createUser"]   //*[@id="continue"]

Verify Cancel button goes to date site
    Click Button    //*[@id="cancel"]
    Location Should Be  http://rental18.infotiv.net/webpage/html/gui/index.php

User puts in information witout confirmation
    Input Text  //*[@id="name"]     ${User FName}
    Input Text  //*[@id="last"]     ${User LName}
    Input Text  //*[@id="phone"]    ${User Phone}
    Input Text  //*[@id="emailCreate"]  ${User Mail}
    Input Text  //*[@id="passwordCreate"]   ${User Password}

User puts in valid information to create account
    Input Text  //*[@id="name"]     ${User FName}
    Input Text  //*[@id="last"]     ${User LName}
    Input Text  //*[@id="phone"]    ${User Phone}
    Input Text  //*[@id="emailCreate"]      ${User Mail}
    Input Text  //*[@id="confirmEmail"]     ${User Mail}
    Input Text  //*[@id="passwordCreate"]   ${User Password}
    Input Text  //*[@id="confirmPassword"]      ${User Password}

Select passegers amount and car
    Click Button    //*[@id="ms-list-2"]/button
    Click Element   //*[@id="ms-opt-5"]
    Click Button    //*[@id="ms-list-1"]/button
    Click Element   //*[@id="ms-list-1"]/div/ul/li[3]/label
    Wait Until Element Is Visible   //*[@id="carSelect1"]
    Click Button    //*[@id="carSelect1"]

Click on about button
    Click Element   //*[@id="about"]
    Verify Header

Select start date
    ${Startdate} =  Get Time    day month   now+3 day
    Input text  id:start  ${startdate}

Select end date
    ${CurrentDate} =    Get Current Date    UTC

    ${plusdaysadded} =  Add Time To Date    ${CurrentDate}  7days

    ${Enddate} =    Convert Date    ${plusdaysadded}    result_format=%m-%d
    Input Text  //*[@id="end"]  ${Enddate}

Controll kalender defultvalue
    ${Defaultvalue} =   Get Current Date    result_format=%Y-%m-%d
    Textfield Should Contain    id:start     ${Defaultvalue}
    Textfield Should Contain    id:end       ${Defaultvalue}

Check Creditcard field
    Page Should Contain Textfield   //*[@id="cardNum"]  //*[@id="confirmSelection"]/form/select[1]  //*[@id="confirmSelection"]/form/select[2]
    Page Should Contain Textfield   //*[@id="cvc"]
    Page Should Contain Button  //*[@id="cancel"]   //*[@id="confirm"]

Insert Creditcard info
    Input Text  //*[@id="cardNum"]  1234567891234567
    Input Text  //*[@id="fullName"]   ${User FName} ${User LName}
    Select From List By Label   //*[@id="confirmSelection"]/form/select[1]  9
    Select From List By Label   //*[@id="confirmSelection"]/form/select[2]  2022
    Input Text  //*[@id="cvc"]  233

Chek if car is on myPage
    Click Button    //*[@id="mypage"]
    Wait Until Page Contains    My bookings
    Page Should Contain Element     //*[@id="make1"]    id="make1"

Delete Bokings
    Click Button    //*[@id="unBook1"]
    Handle Alert
    Page Should Contain     has been Returned
    Click Button    //*[@id="mypage"]
    Page Should Contain     You have no bookings


User Clears login field
    Clear Element Text      //*[@id="email"]
    Clear Element Text      //*[@id="password"]

Book date
    select start date
    Select end date
    Click Element   xpath://*[@id="continue"]

User tryes to comfirme user
    Wait Until Page Contains    That E-mail is already taken

User tryes to create account without all information
    User puts in information witout confirmation
    User pushes Create Button
    Alert Should Be Present     Fyll i dethär fältet

User has an pre booked car
    User goes To Web Page
    User logs in to page
    Controll kalender defultvalue
    Book date
    Select passegers amount and car
    Check Creditcard field
    Insert Creditcard info
    Confirm creditcard input
    Chek if car is on myPage
    Close Browser


User puts in loggin details
    User enters login name
    User enters login password

User clicks on CreateUser Button
    User pushes create user button
    Page create user has loaded

User puts in invalid name loggina nd valid password
    User enters invalid login name
    User enters login password

User puts in invalid password loggin and valid name
    User enters login name
    User enters invalid login password

User logs in to page
    User puts in loggin details
    User pushes loginButton

User goes to my page
    Begin Web Test
    User goes To Web Page
    User puts in loggin details
    User pushes loginButton
    User pushes mypage button
    User is loged in to mypage

User loggs in to my page
    User goes To Web Page
    User puts in loggin details
    User pushes loginButton
    User pushes mypage button
    User is loged in to mypage

User pushes mypage button
    Click Button    //*[@id="mypage"]
    Page Should Contain Element     //*[@id="hide"]

The booking information is visibable on upcoming bookings
    Page Should Contain     orderID
    Element Should Contain  //*[@id="make1"]   Tesla
    Element Should Contain  //*[@id="model1"]  Roadster
    Page Should Contain     Booked from
    Page Should Contain     Until
    Element Should Contain  //*[@id="passengers1"]  2
    Page Should Contain     License Number
    Delete Bokings
Logg in to my pagen with invalid name
    User puts in invalid name loggin and valid password
    User pushes loginButton


Logg in to my pagen with invalid password
    User puts in invalid password loggin and valid name
    User pushes loginButton
    User gets alert messege when atemt to login

User name is shown when logged in
    Page Should Contain     you are signed in as${User FName}

User clicks on logout
    Click Button    //*[@id="logout"]
User captures faild login messege no bug screenshot
    Capture Page Screenshot     C:\Users\boban\PycharmProjects\Labb3\Captures\loginmsg.png
User captures faild login messege with first bug screenshot
    Capture Page Screenshot     C:\Users\boban\PycharmProjects\Labb3\Captures\loginmsg1bug.png
User captures centerd login bug screenshot
    Capture Page Screenshot     C:\Users\boban\PycharmProjects\Labb3\Captures\loginmsg2bug.png
Minimaiaz browser to show first bug
    Set Window Size     860     747
Minimaiz browser to show second bug
    Set Window Size     820     747

End Web Test
     Close Browser
