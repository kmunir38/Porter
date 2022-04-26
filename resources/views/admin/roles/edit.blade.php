@extends('admin.layouts.master')


@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Edit Role</h4>
              </div>
              {!! Form::model($role, ['method' => 'PUT','route' => ['roles.update', $role->id]]) !!}
                <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Role Name</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
                  </div>
                </div>

                <table class="table table-bordered table-striped text-center mb-3 table-responsive-xl">
                    <thead>
                    <tr>
                        <th>Model</th>
                        <th>List</th>
                        <th>Create</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Roles</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-list]', 'role-list', $role->hasPermissionTo('role-list')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>List</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-create]', 'role-create', $role->hasPermissionTo('role-create')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Create</label>
                                  </div>
                                </div> 
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-edit]', 'role-edit', $role->hasPermissionTo('role-edit')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Edit</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-delete]', 'role-delete', $role->hasPermissionTo('role-delete')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Delete</label>
                                  </div>
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>Permissions</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-list]', 'permission-list', $role->hasPermissionTo('permission-list')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>List</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-create]', 'permission-create', $role->hasPermissionTo('permission-create')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Create</label>
                                  </div>
                                </div> 
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-edit]', 'permission-edit', $role->hasPermissionTo('permission-edit')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Edit</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-delete]', 'permission-delete', $role->hasPermissionTo('permission-delete')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Delete</label>
                                  </div>
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>Admin</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-list]', 'user-list', $role->hasPermissionTo('user-list')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>List</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-create]', 'user-create', $role->hasPermissionTo('user-create')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Create</label>
                                  </div>
                                </div> 
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-edit]', 'user-edit', $role->hasPermissionTo('user-edit')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Edit</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-delete]', 'user-delete', $role->hasPermissionTo('user-delete')) }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Delete</label>
                                  </div>
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>Customers</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-list]', 'customer-list', $role->hasPermissionTo('customer-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-create]', 'customer-create', $role->hasPermissionTo('customer-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-edit]', 'customer-edit', $role->hasPermissionTo('customer-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-delete]', 'customer-delete', $role->hasPermissionTo('customer-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Riders</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-list]', 'rider-list', $role->hasPermissionTo('rider-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-create]', 'rider-create', $role->hasPermissionTo('rider-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-edit]', 'rider-edit', $role->hasPermissionTo('rider-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-delete]', 'rider-delete', $role->hasPermissionTo('rider-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Rider Details</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-detail-list]', 'rider-detail-list', $role->hasPermissionTo('rider-detail-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-detail-view]', 'rider-detail-view', $role->hasPermissionTo('rider-detail-view')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>View</label>
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Restaurant</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-list]', 'restaurant-list', $role->hasPermissionTo('restaurant-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-create]', 'restaurant-create', $role->hasPermissionTo('restaurant-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-edit]', 'restaurant-edit', $role->hasPermissionTo('restaurant-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-delete]', 'restaurant-delete', $role->hasPermissionTo('restaurant-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Grocery</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-list]', 'grocery-list', $role->hasPermissionTo('grocery-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-create]', 'grocery-create', $role->hasPermissionTo('grocery-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-edit]', 'grocery-edit', $role->hasPermissionTo('grocery-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-delete]', 'grocery-delete', $role->hasPermissionTo('grocery-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Items</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-list]', 'item-list', $role->hasPermissionTo('item-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-create]', 'item-create', $role->hasPermissionTo('item-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-edit]', 'item-edit', $role->hasPermissionTo('item-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-delete]', 'item-delete', $role->hasPermissionTo('item-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Item Category</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-list]', 'category-list', $role->hasPermissionTo('category-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-create]', 'category-create', $role->hasPermissionTo('category-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-edit]', 'category-edit', $role->hasPermissionTo('category-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-delete]', 'category-delete', $role->hasPermissionTo('category-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Coupon</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-list]', 'coupon-list', $role->hasPermissionTo('coupon-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-create]', 'coupon-create', $role->hasPermissionTo('coupon-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-edit]', 'coupon-edit', $role->hasPermissionTo('coupon-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-delete]', 'coupon-delete', $role->hasPermissionTo('coupon-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Shoppers</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-list]', 'shopper-list', $role->hasPermissionTo('shopper-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-create]', 'shopper-create', $role->hasPermissionTo('shopper-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-edit]', 'shopper-edit', $role->hasPermissionTo('shopper-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-delete]', 'shopper-delete', $role->hasPermissionTo('shopper-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Expertise</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[expertise-list]', 'expertise-list', $role->hasPermissionTo('expertise-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[expertise-create]', 'expertise-create', $role->hasPermissionTo('expertise-create')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[expertise-edit]', 'expertise-edit', $role->hasPermissionTo('expertise-edit')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[expertise-delete]', 'expertise-delete', $role->hasPermissionTo('expertise-delete')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Delete</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Dashboard</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[dashboard-list]', 'dashboard-list', $role->hasPermissionTo('dashboard-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>                            
                        </tr>
                         <tr>
                            <td>Setting</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[setting-list]', 'setting-list', $role->hasPermissionTo('setting-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>                            
                        </tr>
                        <tr>
                            <td>Content</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[content-list]', 'content-list', $role->hasPermissionTo('content-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>                            
                        </tr>
                        <tr>
                            <td>Logs</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[log-list]', 'log-list', $role->hasPermissionTo('log-list')) }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>                            
                        </tr>
                    </tbody>
                </table>


                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                  <div class="col-sm-12 col-md-7">
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                </div>
              </div>
              {!! Form::close() !!}
            </div>
          </div>
        </div>
    </div>
</section>
@endsection