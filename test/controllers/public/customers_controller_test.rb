require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_page" do
    get public_customers_my_page_url
    assert_response :success
  end

  test "should get confirm" do
    get public_customers_confirm_url
    assert_response :success
  end
end
