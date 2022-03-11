@extends('admin.layouts.master')


@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Create New Role</h4>
              </div>
              {!! Form::open(array('route' => 'roles.store','method'=>'POST')) !!}
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
                                  {{ Form::checkbox('permission[role-list]', 'role-list') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>List</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-create]', 'role-create') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Create</label>
                                  </div>
                                </div> 
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-edit]', 'role-edit') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Edit</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[role-delete]', 'role-delete') }}
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
                                  {{ Form::checkbox('permission[permission-list]', 'permission-list') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>List</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-create]', 'permission-create') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Create</label>
                                  </div>
                                </div> 
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-edit]', 'permission-edit') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Edit</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[permission-delete]', 'permission-delete') }}
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
                                  {{ Form::checkbox('permission[user-list]', 'user-list') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>List</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-create]', 'user-create') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Create</label>
                                  </div>
                                </div> 
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-edit]', 'user-edit') }}
                                  <div class="state p-info">
                                    <i class="icon material-icons">done</i>
                                    <label>Edit</label>
                                  </div>
                                </div>
                            </td>
                            <td>
                               <div class="pretty p-icon p-jelly p-round p-bigger">
                                  {{ Form::checkbox('permission[user-delete]', 'user-delete') }}
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
                                    {{ Form::checkbox('permission[customer-list]', 'customer-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-create]', 'customer-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-edit]', 'customer-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[customer-delete]', 'customer-delete') }}
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
                                    {{ Form::checkbox('permission[rider-list]', 'rider-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-create]', 'rider-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-edit]', 'rider-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-delete]', 'rider-delete') }}
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
                                    {{ Form::checkbox('permission[rider-detail-list]', 'rider-detail-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[rider-detail-view]', 'rider-detail-view') }}
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
                            <td>Restaurants</td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-list]', 'restaurant-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-create]', 'restaurant-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-edit]', 'restaurant-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[restaurant-delete]', 'restaurant-delete') }}
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
                                    {{ Form::checkbox('permission[grocery-list]', 'grocery-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-create]', 'grocery-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-edit]', 'grocery-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[grocery-delete]', 'grocery-delete') }}
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
                                    {{ Form::checkbox('permission[item-list]', 'item-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-create]', 'item-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-edit]', 'item-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[item-delete]', 'item-delete') }}
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
                                    {{ Form::checkbox('permission[category-list]', 'category-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-create]', 'category-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-edit]', 'category-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[category-delete]', 'category-delete') }}
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
                                    {{ Form::checkbox('permission[coupon-list]', 'coupon-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-create]', 'coupon-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-edit]', 'coupon-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[coupon-delete]', 'coupon-delete') }}
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
                                    {{ Form::checkbox('permission[shopper-list]', 'shopper-list') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>List</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-create]', 'shopper-create') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Create</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-edit]', 'shopper-edit') }}
                                    <div class="state p-info">
                                        <i class="icon material-icons">done</i>
                                        <label>Edit</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="pretty p-icon p-jelly p-round p-bigger">
                                    {{ Form::checkbox('permission[shopper-delete]', 'shopper-delete') }}
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
                                    {{ Form::checkbox('permission[dashboard-list]', 'dashboard-list') }}
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
                                    {{ Form::checkbox('permission[setting-list]', 'setting-list') }}
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
                                    {{ Form::checkbox('permission[content-list]', 'content-list') }}
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
                                    {{ Form::checkbox('permission[log-list]', 'log-list') }}
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
                    <button type="submit" class="btn btn-primary">Submit</button>
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