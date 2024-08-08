require "application_system_test_case"

class ReportPaymentsTest < ApplicationSystemTestCase
  setup do
    @report_payment = report_payments(:one)
  end

  test "visiting the index" do
    visit report_payments_url
    assert_selector "h1", text: "Report payments"
  end

  test "should create report payment" do
    visit report_payments_url
    click_on "New report payment"

    fill_in "Name", with: @report_payment.name
    click_on "Create Report payment"

    assert_text "Report payment was successfully created"
    click_on "Back"
  end

  test "should update Report payment" do
    visit report_payment_url(@report_payment)
    click_on "Edit this report payment", match: :first

    fill_in "Name", with: @report_payment.name
    click_on "Update Report payment"

    assert_text "Report payment was successfully updated"
    click_on "Back"
  end

  test "should destroy Report payment" do
    visit report_payment_url(@report_payment)
    click_on "Destroy this report payment", match: :first

    assert_text "Report payment was successfully destroyed"
  end
end
