Feature: Pick Your Slot activity booking for net practice slot after membership type QUARTERLY end to end

  Background:
    Given user login with username "9361981185" and password "123456"
    And user click a "Login" Button
    Then the user navigated to pys home screen

  Scenario Outline: User buy a membership type "Quarterly"

    Given User clicks on activity “Cricket”
    And User selects the vendor “turf"
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
      |net practice |random  |OnlinePayment |slotOffer     |
      |net practice |random  |OnlinePayment |flatOffer     |
      |net practice |random  |OnlinePayment |firstTimeOffer|
      |net practice |random  |cash          |-             |

  Scenario Outline: To verify whether user got charged for booking slots after exceeding the no.of bookings per day
  limit in Quarterly type membership

    Given user clicks activity "Cricket"
    And user select the vendor "Turf"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    And user able to view the slots for the selected sub-activity
    When user selects the below slot details
      |date     |time     |numberOfOvers    |bowlingType   |
      |<date>   |<time>   |<numberOfOvers>  |<bowlingType> |
    And user click "View more" button in select timings to see if more slots allocated in a day
    When user at the below payment details will be charged only for slots exceeding maxim no.of bookings per day
    And user clicks "Next" button
    Then  in purchase summary page user will be able to see the below details
      |date     |time     |numberOfOvers   |bowlingType   |
      |<date>   |<time>   |<numberOfOvers> |<bowlingType> |
    When user select the Payment mode as "Online Payment"
      |paymentMode    |
      |<paymentMode>  |
    Given the user clicks at Online payment
    When user clicks the "Apply Coupon" and the <offer> if available it will get applied
    And the amount will be deducted only for the slots exceeding the maximum number of bookings per day
    And user clicks "Proceed To Pay"


    Examples:
      |subActivity    |date    |time                 |paymentMode      |offer   |numberOfOvers |bowlingType  |

      |net practice   |random  |1st and 2nd and 3rd  |online           |--      |1             |Manual       |
      |net practice   |random  |1st and 2nd and 3rd  |online&offer     |first   |1             |Manual       |
      |net practice   |random  |1st and 2nd and 3rd  |online&offer     |flat    |1             |Manual       |
      |net practice   |random  |1st and 2nd and 3rd  |online&offer     |slot    |1             |Manual       |
      |net practice   |random  |1st and 2nd and 3rd  |online           |--      |1             |Machine      |
      |net practice   |random  |1st and 2nd and 3rd  |online&offer     |first   |1             |Machine      |
      |net practice   |random  |1st and 2nd and 3rd  |online&offer     |flat    |1             |Machine      |
      |net practice   |random  |1st and 2nd and 3rd  |online&offer     |slot    |1             |Machine      |

  Scenario Outline: To verify whether user got charged for booking slots within the maximum no.of bookings per day
  limit in quarterly type membership

    Given user clicks activity "Cricket"
    And user select the vendor "Turf"
    And user select the service <subActivity>
    And user clicks "Book Now" button
    And user able to view the slots for the selected sub-activity
    When user selects the below slot details
      |date     |time     |numberOfOvers     |bowlingType   |
      |<date>   |<time>   |<numberOfOvers>   |<bowlingType> |
    And user click "View more" button in select timings to see if more slots allocated in a day
    When user at the below payment details view the slot timings booked on membership
    And user clicks "Next" button
    Then  in purchase summary page user will be able to see the below details
      |date     |time     |numberOfOvers     |bowlingType   |
      |<date>   |<time>   |<numberOfOvers>   |<bowlingType> |
    And user clicks "Confirm Booking"

    Examples:
      |subActivity     |date           |time                 |numberOfOvers  |bowlingType  |
      |net practice    |random         |1st and 2nd          |1              |Machine      |
      |net practice    |random         |1st and 2nd          |1              |Manual       |