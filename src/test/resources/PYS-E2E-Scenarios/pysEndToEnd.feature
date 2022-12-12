Feature: Pick Your Slot activity booking pre-defined, net practice, badminton, Course end to end

  Background:
    Given user login with credentials username "9361981185" and password "123456"
    And user clicks login button
    Then user navigates to the homepage

  Scenario Outline: Verify user is successfully able to book for the pre-defined slot type and view the order summary page
    Given user clicks activity "Fitness"
    And user select the vendor "Test gym"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    When user able to view the slots for the selected sub-activity
    And user selects the below slot details
    |date      |time     |personCount     |frequency       |
    |random    |<time>   |<personCount>   |<frequency>     |
    And user view the Payment details at the bottom of the page
    When user clicks "Next" button moves to Purchase Summary page
    Then user view the below purchase summary details
    |date      |time    |personCount    |frequency      |
    |random    |<time>  |<personCount>  |<frequency>    |
    When user selects Payment mode as <paymentType>
    Given user selects "online payment"
    And  user if clicks "Apply coupon" moves to offers page <selectOffer> and if eligible it will apply
    And user clicks "Proceed To Pay" button

    Examples:

     |subActivity  |time      |personCount    |frequency       |paymentType     |selectOffer   |
     |gym          |1         |1              |--              |cash            |--            |
     |gym          |2         |1              |--              |cash            |--            |
     |gym          |1         |2              |--              |cash            |--            |
     |gym          |2         |2              |--              |cash            |--            |
     |gym          |1         |1              |1               |cash            |--            |
     |gym          |2         |1              |1               |cash            |--            |
     |gym          |2         |1              |1               |cash            |--            |
     |gym          |2         |2              |1               |cash            |--            |
     |gym          |1         |1              |--              |online          |--            |
     |gym          |2         |1              |--              |online          |--            |
     |gym          |1         |2              |--              |online          |--            |
     |gym          |2         |2              |--              |online          |--            |
     |gym          |1         |1              |1               |online          |--            |
     |gym          |2         |1              |1               |online          |--            |
     |gym          |2         |1              |1               |online          |--            |
     |gym          |2         |2              |1               |online          |--            |
     |gym          |1         |1              |--              |--              |flat          |
     |gym          |2         |1              |--              |--              |flat          |
     |gym          |1         |2              |--              |--              |flat          |
     |gym          |2         |2              |--              |--              |flat          |
     |gym          |1         |1              |1               |--              |flat          |
     |gym          |2         |1              |1               |--              |flat          |
     |gym          |2         |1              |1               |--              |flat          |
     |gym          |2         |2              |1               |--              |flat          |
     |gym          |1         |1              |--              |--              |first         |
     |gym          |2         |1              |--              |--              |first         |
     |gym          |1         |2              |--              |--              |first         |
     |gym          |2         |2              |--              |--              |first         |
     |gym          |1         |1              |1               |--              |first         |
     |gym          |2         |1              |1               |--              |first         |
     |gym          |2         |1              |1               |--              |first         |
     |gym          |2         |2              |1               |--              |first         |
     |gym          |1         |1              |--              |--              |slot          |
     |gym          |1         |1              |1               |--              |slot          |
     |gym          |1         |2              |1               |--              |slot          |


  Scenario Outline: Verify user is successfully able to book for the badminton slot type and view the order summary page
    Given user clicks activity "Badminton"
    And user select the vendor "Test Badminton"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    When user able to view the slots for the selected sub-activity
    And user selects the below slot details
      |date     |court    |time     |frequency     |
      |<date>   |court A  |<time>   |<frequency>   |
    And user click "View more" button in select timings to see if more slots allocated in a day
    And user view the payment details at the bottom of the page
    And user clicks "Next" button
    When user clicks "Next" button moves to Purchase Summary page
    Then user view the below purchase summary details
      |date     |court    |time     |frequency     |
      |<date>   |court A  |<time>   |<frequency>   |
    When user selects Payment mode as <paymentType>
    Given user selects "online payment"
    And  user if clicks "Apply coupon" moves to offers page <offer> and if eligible it will apply
    And user clicks "Proceed To Pay" button


    Examples:
      |subActivity      |date           |time          |frequency       |paymentType     |offer    |
      |shuttle          |random         |1st           |--              |online          |--       |
      |shuttle          |random         |1st           |Next 2 days     |online          |--       |
      |shuttle          |random         |1st and 2nd   |--              |online          |--       |
      |shuttle          |random         |1st and 2nd   |Next 2 days     |online          |--       |
      |shuttle          |random         |1st           |--              |cash            |--       |
      |shuttle          |random         |1st           |Next 2 days     |cash            |--       |
      |shuttle          |random         |1st and 2nd   |--              |cash            |--       |
      |shuttle          |random         |1st and 2nd   |Next 2 days     |cash            |--       |
      |shuttle          |random         |1st           |--              |--              |flat     |
      |shuttle          |random         |1st           |Next 2 days     |--              |flat     |
      |shuttle          |random         |1st and 2nd   |--              |--              |flat     |
      |shuttle          |random         |1st and 2nd   |Next 2 days     |--              |flat     |
      |shuttle          |random         |1st           |--              |--              |first    |
      |shuttle          |random         |1st           |Next 2 days     |--              |first    |
      |shuttle          |random         |1st and 2nd   |--              |--              |first    |
      |shuttle          |random         |1st and 2nd   |Next 2 days     |--              |first    |
      |shuttle          |random         |1st           |--              |--              |slot     |
      |shuttle          |random         |1st           |Next 2 days     |--              |slot     |



  Scenario Outline: Verify user is successfully able to book for the net-practice slot type and view the order summary page
    Given user clicks activity "Cricket"
    And user select the vendor "Test Cricket"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    When user able to view the slots for the selected sub-activity
    And user selects the below slot details
      |date     |bowlingType     |numberOfOvers    |time     |
      |<date>   |<bowlingType>   |<numberOfOvers>  |<time>   |
    And user click "View more" button in select timings to see if more slots allocated in a day
    And user view the payment details at the bottom of the page
    And user clicks "Next" button
    Then user will  be able to view the purchase summary page
      |date     |numberOfOvers   |time     |bowlingType    |
      |<date>   |<numberOfOvers> |<time>   |<bowlingType>  |
    When user selects Payment mode as <paymentType>
    Given user selects "online payment"
    And  user if clicks "Apply coupon" moves to offers page <offer> and if eligible it will apply
    And user clicks "Proceed To Pay" button


    Examples:
      |subActivity          |numberOfOvers  |time        |bowlingType |date   |paymentType  |offer  |
      |netPractice          |1              |1st         |Manual      |random |cash         |--     |
      |netPractice          |1              |1st and 2nd |Manual      |random |cash         |--     |
      |netPractice          |1              |1st         |Machine     |random |cash         |--     |
      |netPractice          |1              |1st and 2nd |Machine     |random |cash         |--     |
      |netPractice          |1              |1st         |Manual      |random |online       |--     |
      |netPractice          |1              |1st and 2nd |Manual      |random |online       |--     |
      |netPractice          |1              |1st         |Machine     |random |online       |--     |
      |netPractice          |1              |1st and 2nd |Machine     |random |online       |--     |
      |netPractice          |1              |1st         |Manual      |random |--           |flat   |
      |netPractice          |1              |1st and 2nd |Manual      |random |--           |flat   |
      |netPractice          |1              |1st         |Machine     |random |--           |flat   |
      |netPractice          |1              |1st and 2nd |Machine     |random |--           |flat   |
      |netPractice          |1              |1st         |Manual      |random |--           |first  |
      |netPractice          |1              |1st and 2nd |Manual      |random |--           |first  |
      |netPractice          |1              |1st         |Machine     |random |--           |first  |
      |netPractice          |1              |1st and 2nd |Machine     |random |--           |first  |
      |netPractice          |1              |1st         |Manual      |random |--           |slot   |
      |netPractice          |1              |1st         |Machine     |random |--           |slot   |



  Scenario Outline: Verify user is successfully able to book for the consecutive slot type and view the order summary page
    Given user clicks activity "saloon"
    And user select the vendor "Test saloon"
    And user select the service <subActivity>
    And user selects the child sub-activities for different sub-activities
    |childSubOfSub1   |childSubOfSub2   |
    |<childSubOfSub1> |<childSubOfSub2> |
    And user clicks "Book Now" button
    When user able to view the combined available slot timings of the selected child sub-activity for different sub-activities
    And user selects the below slot timings
      |date    |time    |
      |random  |<time>  |
    And user click "View more" button in select timings to see if more slots allocated in a day
    And user view the payment details at the bottom of the page
    And user clicks "Next" button
    Then user will  be able to view the purchase summary page
      |date       |time       |listedChildSubs    |
      |random     |<time>     |<listedChildSubs>  |
    When user selects Payment mode as <paymentType>
    Given user selects "online payment"
    And  user if clicks "Apply coupon" moves to offers page <offer> and if eligible it will apply
    And user clicks "Proceed To Pay" button

    Examples:
      |subActivity   |childSubOfSub1   |childSubOfSub2   |time      |listedChildSubs    |paymentType |offer  |
      |haircut       |1                |0                |random    |1                  |online      |--     |
      |haircut       |1                |1                |random    |2                  |online      |--     |
      |haircut       |1                |0                |random    |1                  |cash        |--     |
      |haircut       |1                |1                |random    |2                  |cash        |--     |
      |haircut       |1                |0                |random    |1                  |--          |flat   |
      |haircut       |1                |1                |random    |2                  |--          |flat   |
      |haircut       |1                |0                |random    |1                  |--          |first  |
      |haircut       |1                |1                |random    |2                  |--          |first  |


  Scenario Outline: Verify user is successfully able to book for the course slot type and view the order summary page
    Given user clicks activity "Cricket"
    And user select the vendor "<Test Cricket>"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    When user moves to courses tab to view the course slots created for the selected sub-activity
    And user selects "Join Now" button
    Given user will be able to select person count
    And user choose payment mode <paymentType> in purchase summary page
    When user clicks "Apply Coupon"
    And user selects offer
    Then user verify amount, slot timings, course availability days,registration end date, start date and end date
      |selectPersonCount   |paymentType    |offer   |
      |<selectPersonCount> |<paymentType>  |<offer> |

    Examples:
      |selectPersonCount   |subActivity  |paymentType  |offer       |
      |1                   |cricket      |cash         |--          |
      |2                   |cricket      |cash         |--          |
      |1                   |cricket      |online       |--          |
      |2                   |cricket      |online       |--          |
      |1                   |cricket      |--           |flat        |
      |2                   |cricket      |--           |flat        |
      |1                   |cricket      |--           |first       |
      |2                   |cricket      |--           |first       |
      |1                   |cricket      |--           |slot        |
      |2                   |cricket      |--           |slot        |

































