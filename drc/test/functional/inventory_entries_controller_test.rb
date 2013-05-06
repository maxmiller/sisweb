require 'test_helper'

class InventoryEntriesControllerTest < ActionController::TestCase
  setup do
    @inventory_entry = inventory_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_entry" do
    assert_difference('InventoryEntry.count') do
      post :create, inventory_entry: { amount: @inventory_entry.amount, lot: @inventory_entry.lot, purchase_price: @inventory_entry.purchase_price, sale_price: @inventory_entry.sale_price }
    end

    assert_redirected_to inventory_entry_path(assigns(:inventory_entry))
  end

  test "should show inventory_entry" do
    get :show, id: @inventory_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_entry
    assert_response :success
  end

  test "should update inventory_entry" do
    put :update, id: @inventory_entry, inventory_entry: { amount: @inventory_entry.amount, lot: @inventory_entry.lot, purchase_price: @inventory_entry.purchase_price, sale_price: @inventory_entry.sale_price }
    assert_redirected_to inventory_entry_path(assigns(:inventory_entry))
  end

  test "should destroy inventory_entry" do
    assert_difference('InventoryEntry.count', -1) do
      delete :destroy, id: @inventory_entry
    end

    assert_redirected_to inventory_entries_path
  end
end
