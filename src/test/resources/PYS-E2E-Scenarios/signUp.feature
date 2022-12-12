Feature: signup page and forgot password page

  Scenario: forgot password

    Given user click "Forgot Password" link
    And the user navigated to "Forgot Password" page
    When user enter Email or Mobile Number "9361981185"
    And user click "Send" button
    And user navigated to "Forgot Password" page
    And user in enter Your new password "1234567" and in Re-enter your password "1234567" and in Enter Your otp"454545"
    Then user clicks "Submit" button
    And user navigated to Login page with success message provided if given new password and Re-enter your password fields got matched and OTP is correct


  Scenario Outline: sign up page functionality

    Given user clicks "Don't have an account? Sign Up" in login page
    And user moves to sign up page
    And user enter full name "aravind"
    And user enter mobile number "9361981185"
    And user sets new password "123456"
    And user confirms new password "123456"
    And user select male/female field radio button as below
    |gender   |
    |<gender> |
    And user clicks check box "I hereby.."
    Then user clicks "Sign up" button
    And user able to login with the given inputs

      Examples:

      |gender  |
      |Male    |
      |Female  |
