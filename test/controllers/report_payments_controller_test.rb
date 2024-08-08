require "test_helper"

class ReportPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report_payment = report_payments(:one)
  end

  test "should get index" do
    get report_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_report_payment_url
    assert_response :success
  end

  test "should create report_payment" do
    assert_difference("ReportPayment.count") do
      post report_payments_url, params: { report_payment: { name: @report_payment.name } }
    end

    assert_redirected_to report_payment_url(ReportPayment.last)
  end

  test "should show report_payment" do
    get report_payment_url(@report_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_payment_url(@report_payment)
    assert_response :success
  end

  test "should update report_payment" do
    patch report_payment_url(@report_payment), params: { report_payment: { name: @report_payment.name } }
    assert_redirected_to report_payment_url(@report_payment)
  end

  test "should destroy report_payment" do
    assert_difference("ReportPayment.count", -1) do
      delete report_payment_url(@report_payment)
    end

    assert_redirected_to report_payments_url
  end
end
