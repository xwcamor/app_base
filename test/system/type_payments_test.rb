require "application_system_test_case"

class TypePaymentsTest < ApplicationSystemTestCase
  setup do
    @type_payment = type_payments(:one)
  end

  test "visiting the index" do
    visit type_payments_url
    assert_selector "h1", text: "Type payments"
  end

  test "should create type payment" do
    visit type_payments_url
    click_on "New type payment"

    fill_in "Name", with: @type_payment.name
    click_on "Create Type payment"

    assert_text "Type payment was successfully created"
    click_on "Back"
  end

  test "should update Type payment" do
    visit type_payment_url(@type_payment)
    click_on "Edit this type payment", match: :first

    fill_in "Name", with: @type_payment.name
    click_on "Update Type payment"

    assert_text "Type payment was successfully updated"
    click_on "Back"
  end

  test "should destroy Type payment" do
    visit type_payment_url(@type_payment)
    click_on "Destroy this type payment", match: :first

    assert_text "Type payment was successfully destroyed"
  end
end
