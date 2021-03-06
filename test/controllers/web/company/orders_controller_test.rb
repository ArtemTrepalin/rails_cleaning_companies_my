require 'test_helper'

class Web::Company::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = create :order
    sign_in_as_company(@order.service_price.company)
  end

  test 'should get index company orders page' do
    get company_orders_path
    assert_response :success
  end

  test 'should get show company order page' do
    get company_order_path(@order)
    assert_response :success
  end

  test 'should state activate order' do
    put company_order_activate_path(@order)
    assert_response :redirect
    @order.reload
    assert_equal @order.state, 'active'
  end

  test 'should state completed order' do
    order = create :order, :active
    sign_in_as_company(order.service_price.company)
    put company_order_complete_path(order)
    assert_response :redirect
    order.reload
    assert_equal order.state, 'completed'
  end

  test 'should state rejected order' do
    put company_order_complete_path(@order)
    assert_response :redirect
    @order.reject
    assert_equal @order.state, 'rejected'
  end
end
