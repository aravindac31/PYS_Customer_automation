Feature: Pick Your Slot activity booking for pre-defined slot after membership type Half-yearly end to end

  Background:
    Given user login with username "708698889" and password "123456"
    And user click a "Login" Button
    Then the user navigated to pys home screen

  Scenario Outline: User buy a membership type "Half-yearly"

    Given User clicks on activity “Fitness”
    And User selects the vendor “Fight4Fit"
    When User clicks service as “<subActivity>”
    And user click a "Book Now" Button
    When user navigated to "Memberships" page
    And user select "Haf-yearly" Membership plan user click "Join Now" button
    And user navigated to "Purchase Summary" Page
    And user click a "ApplyCoupon" button
    When user navigated to "offer" page
    When user select any available "<offer>"
    And user navigated to "Purchase Summary" Page
    Then   user is able to view Purchase Summary details
      |subActivity   |date     |paymentMode   |offer  |
      |<subActivity> |<date>   |<paymentMode> |<offer>|

    Examples:
      |subActivity  |date    |paymentMode   |offer         |
      |gym          |random  |OnlinePayment |slotOffer     |
      |gym          |random  |OnlinePayment |flatOffer     |
      |gym          |random  |OnlinePayment |firstTimeOffer|
      |gym          |random  |cash          |-             |

  Scenario Outline: To verify whether user got charged for booking slots after exceeding the no.of bookings per day
  limit in MONTHLY type membership

    Given user clicks activity "Fitness"
    And user select the vendor "Slam fitness"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    And user able to view the slots for the selected sub-activity
    When user selects the below slot details
      |date     |time     |frequency     |
      |<date>   |<time>   |<frequency>   |
    And user click "View more" button in select timings to see if more slots allocated in a day
    When user at the below payment details will be charged only for slots exceeding maxim no.of bookings per day
    And user clicks "Next" button
    Then  in purchase summary page user will be able to see the below details
      |date     |time     |frequency     |
      |<date>   |<time>   |<frequency>   |
    When user select the Payment mode
      |paymentMode    |
      |<paymentMode>  |
    Given the user clicks at Online payment
    When user clicks the "Apply Coupon" and the <offer> if available it will get applied
    And the amount will be deducted only for the slots exceeding the maximum number of bookings per day
    And user clicks "Proceed To Pay"


    Examples:
      |subActivity  |date           |time                 |frequency    |paymentMode          |offer    |

      |gym          |random         |1st and 2nd and 3rd  |1            |online               |--         |
      |gym          |random         |1st and 2nd and 3rd  |1            |online&offer         |first      |
      |gym          |random         |1st and 2nd and 3rd  |1            |online&offer         |flat       |
      |gym          |random         |1st and 2nd and 3rd  |1            |online&offer         |slot       |
      |gym          |random         |1st and 2nd and 3rd  |--           |online               |--         |
      |gym          |random         |1st and 2nd and 3rd  |--           |online&offer         |first      |
      |gym          |random         |1st and 2nd and 3rd  |--           |online&offer         |flat       |
      |gym          |random         |1st and 2nd and 3rd  |--           |online&offer         |slot       |

  Scenario Outline: To verify whether user got charged for booking slots within the maximum no.of bookings per day
  limit in monthly type membership

    Given user clicks activity "Fitness"
    And user select the vendor "Slam fitness"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    And user able to view the slots for the selected sub-activity
    When user selects the below slot details
      |date     |time     |frequency     |
      |<date>   |<time>   |<frequency>   |
    And user click "View more" button in select timings to see if more slots allocated in a day
    When user at the below payment details view the slot timings booked on membership
    And user clicks "Next" button
    Then  in purchase summary page user will be able to see the below details
      |date     |time     |frequency     |
      |<date>   |<time>   |<frequency>   |
    And user clicks "Confirm Booking"

    Examples:
      |subActivity  |date           |time                 |frequency    |
      |gym          |random         |1st and 2nd          |--           |
      |gym          |random         |1st and 2nd          |--           |
      |gym          |random         |1st and 2nd          |1            |
      |gym          |random         |1st and 2nd          |1            |