Feature: Pick Your Slot activity booking for badminton slot after membership type Half-Yearly end to end

  Background:
    Given user login with username "7708698889" and password "123456"
    And user click a "Login" Button
    Then the user navigated to pys home screen

  Scenario Outline: User buy a membership type "Monthly"

    Given User clicks on activity “Badminton”
    And User selects the vendor “smash academy"
    When User clicks service as “<subActivity>”
    And user click a "Book Now" Button
    When user navigated to "Memberships" page
    And user select "Monthly" Membership plan user click "Join Now" button
    And user navigated to "Purchase Summary" Page
    And user click a "ApplyCoupon" button
    When user navigated to "offer" page
    When user select any available "<offer>"
    And user navigated to "Purchase Summary" Page
    Then user is able to view Purchase Summary details
      |subActivity   |date     |paymentMode   |offer  |
      |<subActivity> |<date>   |<paymentMode> |<offer>|

    Examples:
      |subActivity  |date    |paymentMode   |offer         |
      |shuttle      |random  |OnlinePayment |slotOffer     |
      |shuttle      |random  |OnlinePayment |flatOffer     |
      |shuttle      |random  |OnlinePayment |firstTimeOffer|
      |shuttle      |random  |cash          |-             |

  Scenario Outline: To verify whether user got charged for booking slots after exceeding the no.of bookings per day
  limit in monthly type membership

    Given user clicks activity "Badminton"
    And user select the vendor "smash academy"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    And user able to view the slots for the selected sub-activity
    When user selects the below slot details
      |date     |time     |court    |frequency     |
      |<date>   |<time>   |court A  |<frequency>   |
    And user click "View more" button in select timings to see if more slots allocated in a day
    When user at the below payment details will be charged only for slots exceeding maxim no.of bookings per day
    And user clicks "Next" button
    Then  in purchase summary page user will be able to see the below details
      |date     |time     |court    |frequency    |
      |<date>   |<time>   |court A  |<frequency>  |
    When user select the Payment mode
      |paymentMode    |
      |<paymentMode>  |
    Given the user clicks at Online payment
    When user clicks the "Apply Coupon" and the <offer> if available it will get applied
    And the amount will be deducted only for the slots exceeding the maximum number of bookings per day
    And user clicks "Proceed To Pay"


    Examples:
      |subActivity    |date    |time                 |paymentMode      |offer   |frequency   |
      |shuttle        |random  |1st and 2nd and 3rd  |cash             |--      |next 2 days |
      |shuttle        |random  |1st and 2nd and 3rd  |online           |--      |next 2 days |
      |shuttle        |random  |1st and 2nd and 3rd  |online&offer     |first   |next 2 days |
      |shuttle        |random  |1st and 2nd and 3rd  |online&offer     |flat    |next 2 days |
      |shuttle        |random  |1st and 2nd and 3rd  |online&offer     |slot    |next 2 days |
      |shuttle        |random  |1st and 2nd and 3rd  |online           |--      |--          |
      |shuttle        |random  |1st and 2nd and 3rd  |cash             |--      |--          |
      |shuttle        |random  |1st and 2nd and 3rd  |online&offer     |first   |--          |
      |shuttle        |random  |1st and 2nd and 3rd  |online&offer     |flat    |--          |
      |shuttle        |random  |1st and 2nd and 3rd  |online&offer     |slot    |--          |

  Scenario Outline: To verify whether user got charged for booking slots within the maximum no.of bookings per day
  limit in Half-yearly type membership

    Given user clicks activity "Badminton"
    And user select the vendor "smash academy"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    And user able to view the slots for the selected sub-activity
    When user selects the below slot details
      |date     |time     |court    |frequency    |
      |<date>   |<time>   |court A  |<frequency>  |
    And user click "View more" button in select timings to see if more slots allocated in a day
    When user at the below payment details view the slot timings booked on membership
    And user clicks "Next" button
    Then  in purchase summary page user will be able to see the below details
      |date     |time     |court    |frequency    |
      |<date>   |<time>   |court A  |<frequency>  |
    And user clicks "Confirm Booking"

    Examples:
      |subActivity   |date           |time                 |frequency    |
      |shuttle       |random         |1st and 2nd          |--           |
      |shuttle       |random         |1st and 2nd          |next 2 days  |