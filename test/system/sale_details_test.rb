require "application_system_test_case"

class SaleDetailsTest < ApplicationSystemTestCase
  setup do
    @sale_detail = sale_details(:one)
  end

  test "visiting the index" do
    visit sale_details_url
    assert_selector "h1", text: "Sale details"
  end

  test "should create sale detail" do
    visit sale_details_url
    click_on "New sale detail"

    fill_in "Product", with: @sale_detail.product_id
    fill_in "Quantity", with: @sale_detail.quantity
    click_on "Create Sale detail"

    assert_text "Sale detail was successfully created"
    click_on "Back"
  end

  test "should update Sale detail" do
    visit sale_detail_url(@sale_detail)
    click_on "Edit this sale detail", match: :first

    fill_in "Product", with: @sale_detail.product_id
    fill_in "Quantity", with: @sale_detail.quantity
    click_on "Update Sale detail"

    assert_text "Sale detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Sale detail" do
    visit sale_detail_url(@sale_detail)
    click_on "Destroy this sale detail", match: :first

    assert_text "Sale detail was successfully destroyed"
  end
end
