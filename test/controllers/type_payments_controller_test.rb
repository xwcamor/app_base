require "test_helper"

class TypePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_payment = type_payments(:one)
  end

  test "should get index" do
    get type_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_type_payment_url
    assert_response :success
  end

  test "should create type_payment" do
    assert_difference("TypePayment.count") do
      post type_payments_url, params: { type_payment: { name: @type_payment.name } }
    end

    assert_redirected_to type_payment_url(TypePayment.last)
  end

  test "should show type_payment" do
    get type_payment_url(@type_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_payment_url(@type_payment)
    assert_response :success
  end

  test "should update type_payment" do
    patch type_payment_url(@type_payment), params: { type_payment: { name: @type_payment.name } }
    assert_redirected_to type_payment_url(@type_payment)
  end

  test "should destroy type_payment" do
    assert_difference("TypePayment.count", -1) do
      delete type_payment_url(@type_payment)
    end

    assert_redirected_to type_payments_url
  end
end
