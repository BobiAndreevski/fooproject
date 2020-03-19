*** Settings ***
Documentation   Labb3
Library     SeleniumLibrary
Library     DateTime
Resource    ../Resources/Keywords.robot
Test Setup  Begin Web Test
Test Teardown   End Web Test

*** Test Cases ***
Tests for fields and buttons to create new users.
    [Documentation]    On the create user page, the user may create a user account
    ...                Required fields are, first and last name, phone number, email and password.
    ...                A Cancel button and a Create button
    [Tags]  Test 1
    Given User goes To Web Page
    when User clicks on CreateUser Button
    Then Verify page contains Textfield and button

Tests if the Cancel button works when creating users.
    [Documentation]     A Cancel button, that will take the user to the date selection page,
    [Tags]  Test 2
    User goes To Web Page
    User goes to crate user and puts in info and creates a user
    verify cancel button goes to date site

Tries to create a user with the information you enter.
    [Documentation]     Create button that will attempt to create the user account with the inputted information.
    [Tags]  Test 3
    Given User goes To Web Page
    When User goes to crate user and puts in info and creates a user
    Then User tryes to comfirme user

Tests if Header is on the Home page.
    [Documentation]     The header is available on every page.
    [Tags]  Test 4
    User goes To Web Page
    Verify Header

Tests if Header is on mypage.
    [Tags]  Test 4.1
    User goes To Web Page
    User loggs in to my page
    Verify Header

Tests on Header can be found on the about page.
    [Tags]  Test 4.2
    User goes To Web Page
    Load About page
    Verify Header

Tests if Header is on the Continue page.
    [Tags]  Test 4.3
    Load Continue page
    Verify Header

Tests if Header is on the createuser page.
    [Tags]  Test 4.4
    Load registration page
    Verify Header

Tests the front page if you return to the front page by clicking on the logo.
    [Documentation]     The logo and title are clickable and will take you to the start page.
    [Tags]  Test 5
    User goes To Web Page
    Press logo
    Start page Loaded

Test my page if you come back to the front page by clicking on the logo.
    [Tags]  Test 5.1
    User goes To Web Page
    User loggs in to my page
    Press logo
    Start page Loaded

Test the About page if you return to the front page by clicking on the logo.
    [Tags]  Test 5.2
    User goes To Web Page
    Load About page
    Press logo
    Start page Loaded

Test the Continue page if you return to the front page by clicking on the logo.
    [Tags]  Test 5.3
    User goes To Web Page
    Load Continue page
    Press logo
    Start page Loaded

Tests the registration page if you return to the front page by clicking on the logo.
    [Tags]  Test 5.4
   User goes To Web Page
   Load registration page
   Press logo
   Start page Loaded

Tries to log in with invalid data and get an error message.
    [Documentation]     If the user inserts the wrong information a error message appears to the left of the buttons.
    [Tags]  Test 6
    User goes To Web Page
    Logg in to my pagen with invalid name
    User Clears login field
    Logg in to my pagen with invalid password
    User gets alert messege when atemt to login

Tries to book a car and then reset the values.
    [Documentation]    On the date selection page, user is required to input start and end dates for the trip.
     ...               The default values will always be put as todays date.
     ...               If the user is signed in then the book button will select the car model on the corresponding row
     ...               and take the user to the confirm booking page.
     ...               On the booking confirmation page,
     ...               the selections made by the user will be displayed along with a basic form that asks for credit card info.
     ...               this form saves nothing and sends no info, it asks for a 16 digit card number, expiration date and cvc code.
     ...               Confirm button that will attempt to finalize the booking.
     ...               On the successful booking page, a message will appear with details of the registered booking if successful.
     ...               A Home button, that will take the user to the date selection page,
     ...               and a My Page button that will take the user to the page where they can view their bookings.
     ...               On a successful booking, an entry is added to the database table bookings with license number of the selected car,
     ...               the selected start/end dates and the users internal id.
     ...               Next to the orders there's a button for unbooking the car which will give the user a warning/confirmation box,
     ...               asking if they really do want to cancel the order.
    [Tags]  Test 7
    User goes To Web Page
    User logs in to page
    Controll kalender defultvalue
    Book date
    Select passegers amount and car
    Check Creditcard field
    Insert Creditcard info
    Confirm creditcard input
    Chek if car is on myPage
    Delete Bokings

Tests if the input jumps when the screen is reduced.
    [Documentation]     To the right is the user information field. If not signed in, a input field for email and password is visible.
    [Tags]  Test 8
    User goes To Web Page
    Maximize Browser Window
    Logg in to my pagen with invalid name
    User captures faild login messege no bug screenshot
    Start page Loaded
    Minimaiaz browser to show first bug
    Logg in to my pagen with invalid name
    User captures faild login messege with first bug screenshot
    Start page Loaded
    Minimaiz browser to show second bug
    User captures centerd login bug screenshot

Tests whether booking information is complete after booking
    [Documentation]    On the my page, the user will see their upcoming bookings along with information about the booking.
    ...                The information provided is an order id, brand/model of car, No passengers, licenseplate and start/end date for the order.
    [Tags]  Test 9 VG delen
    Given User has an pre booked car
    When User goes to my page
    Then The booking information is visibable on upcoming bookings

Tests if the logout button works
    [Documentation]     Buttons will be changed to Logout, that wiill logout the user from the session,
    [Tags]  Test 10
    Given User goes To Web Page
    And User logs in to page
    when User clicks on logout
    Then Start page loaded


