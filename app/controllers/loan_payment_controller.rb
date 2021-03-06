class LoanPaymentController < ApplicationController
  def loan_payment
    @apr = params.fetch("annual_percentage_rate").to_f
    @years = params.fetch("number_of_years").to_i
    @principal = params.fetch("principal_value").to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    r = @apr / 1200
    exp = @years * 12
    @monthly_payment = (r * @principal) / (1 - (1 + r)**-exp)

    # ================================================================================
    # Your code goes above.
    # ================================================================================
    render("loan_payment/loan_payment.html.erb")
  end
end
