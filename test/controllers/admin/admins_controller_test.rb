require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index admins page' do
    create :admin

    get admin_admins_path
    assert_response :success
  end

  test 'should get new admin page' do
    get new_admin_admin_path
    assert_response :success
  end
 
  test 'should post create admin' do
      admins_attrs = attributes_for :admin
      post admin_admins_path, params: { admin: admins_attrs}
      assert_response :redirect
      admin = Admin.find_by(email: admins_attrs[:email])
      assert_equal admins_attrs[:email], admin.email
  end

  test 'should get admin page' do
    admin = create :admin
    get admin_admin_path(admin.id)
    assert_response :success 
  end
end
