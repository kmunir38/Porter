<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Admin Dashboard | Porter</title>

  <!-- General CSS Files index -->
  <link rel="stylesheet" href="{{ asset('assets/admin/css/app.min.css') }}">
  <!-- General CSS Files create-post -->
  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/bootstrap-daterangepicker/daterangepicker.css') }}">

  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/summernote/summernote-bs4.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/jquery-selectric/selectric.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.css') }}">
  <!-- General CSS Files datatables -->
  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/datatables/datatables.min.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css') }}">
  <!-- Template CSS -->
  <link rel="stylesheet" href="{{ asset('assets/admin/css/style.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/admin/css/components.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/admin/bundles/pretty-checkbox/pretty-checkbox.min.css') }}">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="{{ asset('assets/admin/css/custom.css') }}">
  <link rel='shortcut icon' type='image/x-icon' href="{{ asset('assets/admin/img/favicon.ico') }}">
  <link rel="stylesheet" href="{{ asset('assets/admin/backend/css/toastr.min.css') }}">
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar sticky">
        <div class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="javascript:void(0);" data-toggle="sidebar" class="nav-link nav-link-lg
                  collapse-btn"> <i data-feather="align-justify"></i></a></li>
            <li><a href="javascript:void(0);" class="nav-link nav-link-lg fullscreen-btn">
                <i data-feather="maximize"></i>
              </a></li>
          </ul>
        </div>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown"><a href="javascript:void(0);" data-toggle="dropdown"
              class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="{{ asset('assets/admin/img/user.png') }}"
                class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
            <div class="dropdown-menu dropdown-menu-right pullDown">
              <div class="dropdown-title"><b>{{ Auth::user()->name }}</b></div>
              <div class="dropdown-divider"></div>
              <a href="{{ route('logout') }}" 
                 onclick="event.preventDefault();
                 document.getElementById('logout-form').submit();" 
                 class="dropdown-item has-icon text-danger"> 
                 <i class="fas fa-sign-out-alt"></i>
                  Logout
              </a>
              <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
              </form>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="javascript:void(0);"> <img alt="image" src="{{ asset('assets/admin/img/logo.png') }}" class="header-logo" /> <span
                class="logo-name">Porter</span>
            </a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Main</li>

            @if(Gate::check('dashboard-list') )
            <li class=" {{ Request::is('admin/dashboard') ? 'active' : '' }}">
              <a href="{{route('dashboard')}}" class=" nav-link "><i data-feather="monitor"></i><span>Dashboard</span></a>              
            </li>
            @endif

            @if(Gate::check('role-list') || Gate::check('role-create'))
            <li class="dropdown {{ Request::is('admin/roles', 'admin/roles/create') ? 'active' : '' }}">
              <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="anchor"></i><span>Roles</span></a>
              <ul class="dropdown-menu">
                @can('role-list')
                <li class="{{ Request::is('admin/roles') ? 'active' : '' }}"><a class="nav-link" href="{{ route('roles.index') }}">All Roles</a></li>
                @endcan
                @can('role-create')
                <li class="{{ Request::is('admin/roles/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('roles.create') }}">Add Role</a></li>
                @endcan
              </ul>
            </li>
            @endif

            @if(Gate::check('permission-list') || Gate::check('permission-create'))
            <li class="dropdown {{ Request::is('admin/permissions', 'admin/permissions/create') ? 'active' : '' }}">
              <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="activity"></i><span>Permissions</span></a>
              <ul class="dropdown-menu">
                @can('permission-list')
                <li class="{{ Request::is('admin/permissions') ? 'active' : '' }}"><a class="nav-link" href="{{ route('permissions.index') }}">All Permissions</a></li>
                @endcan
                @can('permission-create')
                <li class="{{ Request::is('admin/permissions/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('permissions.create') }}">Add Permission</a></li>
                @endcan
              </ul>
            </li>
            @endif

            @if(Gate::check('user-list') || Gate::check('user-create'))
            <li class="dropdown {{ Request::is('admin/users', 'admin/users/create') ? 'active' : '' }}">
              <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="user-check"></i><span>Admin</span></a>
              <ul class="dropdown-menu">
                @can('user-list')
                <li class="{{ Request::is('admin/users') ? 'active' : '' }}"><a class="nav-link" href="{{ route('users.index') }}">All Admin</a></li>
                @endcan
                @can('user-create')
                <li class="{{ Request::is('admin/users/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('users.create') }}">Add Admin</a></li>
                @endcan
              </ul>
            </li>
            @endif

            @if(Gate::check('customer-list') || Gate::check('customer-create'))
              <li class="dropdown {{ Request::is('admin/customers', 'admin/customers/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="user-check"></i><span>Customers</span></a>
                <ul class="dropdown-menu">
                  @can('customer-list')
                    <li class="{{ Request::is('admin/customers') ? 'active' : '' }}"><a class="nav-link" href="{{ route('customers.index') }}">All Customers</a></li>
                  @endcan
                  @can('customer-create')
                    <li class="{{ Request::is('admin/customers/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('customers.create') }}">Add Customer</a></li>
                  @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('rider-list') || Gate::check('rider-create'))
              <li class="dropdown {{ Request::is('admin/riders', 'admin/riders/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="user-check"></i><span>Riders</span></a>
                <ul class="dropdown-menu">
                  @can('rider-list')
                    <li class="{{ Request::is('admin/riders') ? 'active' : '' }}"><a class="nav-link" href="{{ route('riders.index') }}">All Riders</a></li>
                  @endcan
                  @can('rider-create')
                    <li class="{{ Request::is('admin/riders/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('riders.create') }}">Add Rider</a></li>
                  @endcan
                    @can('rider-detail-list')
                      <li class="{{ Request::is('admin/riders/rider-details') ? 'active' : '' }}"><a class="nav-link" href="{{ route('riders.rider-detail.index') }}">All Rider Details</a></li>
                    @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('restaurant-list') || Gate::check('restaurant-create'))
              <li class="dropdown {{ Request::is('admin/restaurants', 'admin/restaurants/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="user-check"></i><span>Restaurants</span></a>
                <ul class="dropdown-menu">
                  @can('restaurant-list')
                    <li class="{{ Request::is('admin/restaurants') ? 'active' : '' }}"><a class="nav-link" href="{{ route('restaurant.index') }}">All Restaurants</a></li>
                  @endcan
                  @can('restaurant-create')
                    <li class="{{ Request::is('admin/restaurants/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('restaurant.create') }}">Add Restaurant</a></li>
                  @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('shopper-list') || Gate::check('shopper-create'))
              <li class="dropdown {{ Request::is('admin/shoppers', 'admin/shoppers/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="user-check"></i><span>Shoppers</span></a>
                <ul class="dropdown-menu">
                  @can('shopper-list')
                    <li class="{{ Request::is('admin/shoppers') ? 'active' : '' }}"><a class="nav-link" href="{{ route('shopper.index') }}">All Shoppers</a></li>
                  @endcan
                  @can('shopper-create')
                    <li class="{{ Request::is('admin/shoppers/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('shopper.create') }}">Add Shopper</a></li>
                  @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('grocery-list') || Gate::check('grocery-create'))
              <li class="dropdown {{ Request::is('admin/groceries', 'admin/groceries/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="user-check"></i><span>Groceries</span></a>
                <ul class="dropdown-menu">
                  @can('grocery-list')
                    <li class="{{ Request::is('admin/groceries') ? 'active' : '' }}"><a class="nav-link" href="{{ route('grocery.index') }}">All Groceries</a></li>
                  @endcan
                  @can('grocery-create')
                    <li class="{{ Request::is('admin/groceries/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('grocery.create') }}">Add Grocery</a></li>
                  @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('item-list') || Gate::check('item-create'))
              <li class="dropdown {{ Request::is('admin/items', 'admin/items/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="shopping-bag"></i><span>Items</span></a>
                <ul class="dropdown-menu">
                  @can('item-list')
                    <li class="{{ Request::is('admin/items') ? 'active' : '' }}"><a class="nav-link" href="{{ route('item.index') }}">All Items</a></li>
                  @endcan
                  @can('item-create')
                    <li class="{{ Request::is('admin/items/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('item.create') }}">Add Items</a></li>
                  @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('category-list') || Gate::check('category-create'))
              <li class="dropdown {{ Request::is('admin/categories', 'admin/category/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="shopping-bag"></i><span>Item Category</span></a>
                <ul class="dropdown-menu">
                  @can('category-list')
                    <li class="{{ Request::is('admin/items/categories') ? 'active' : '' }}"><a class="nav-link" href="{{ route('category.index') }}">All Categries</a></li>
                  @endcan
                  @can('category-create')
                    <li class="{{ Request::is('admin/items/category/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('category.create') }}">Add Category</a></li>
                  @endcan
                </ul>
              </li>
            @endif

             @if(Gate::check('expertise-list') || Gate::check('expertise-create'))
              <li class="dropdown {{ Request::is('admin/expertise', 'admin/expertise/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="shopping-bag"></i><span>Item Expertise</span></a>
                <ul class="dropdown-menu">
                  @can('expertise-list')
                    <li class="{{ Request::is('admin/expertise') ? 'active' : '' }}"><a class="nav-link" href="{{ route('expertise.index') }}">All Item Expertise</a></li>
                  @endcan
                  @can('expertise-create')
                    <li class="{{ Request::is('admin/expertise/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('expertise.create') }}">Add Item Expertise</a></li>
                  @endcan
                </ul>
              </li>
            @endif

            @if(Gate::check('coupon-list') || Gate::check('coupon-create'))
              <li class="dropdown {{ Request::is('admin/coupons', 'admin/coupons/create') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-toggle nav-link has-dropdown"><i data-feather="shopping-bag"></i><span>Coupons</span></a>
                <ul class="dropdown-menu">
                  @can('coupon-list')
                    <li class="{{ Request::is('admin/coupons') ? 'active' : '' }}"><a class="nav-link" href="{{ route('coupon.index') }}">All Coupons</a></li>
                  @endcan
                  @can('coupon-create')
                    <li class="{{ Request::is('admin/coupons/create') ? 'active' : '' }}"><a class="nav-link" href="{{ route('coupon.create') }}">Add Coupon</a></li>
                  @endcan
                </ul>
              </li>
            @endif          

            @if(Gate::check('setting-list') || Gate::check('setting-list'))
            <li class="dropdown {{ Request::is('admin/settings', 'admin/contents', 'admin/logs') ? 'active' : '' }}">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="settings"></i><span>General Settings</span></a>
              <ul class="dropdown-menu">
                @can('content-list')
                <li class="{{ Request::is('admin/contents') ? 'active' : '' }}"><a class="nav-link" href="{{ route('contents.index') }}">Contents</a></li>
                @endcan
                @can('log-list')
                <li class="{{ Request::is('admin/logs') ? 'active' : '' }}"><a class="nav-link" href="{{ route('logs.index') }}">All Logs</a></li>
                @endcan 
                @can('setting-list')
                <li class="{{ Request::is('admin/settings') ? 'active' : '' }}"><a class="nav-link" href="{{ route('settings.index') }}">Settings</a></li>
                @endcan             
              </ul>
            </li>
            @endif  
            
          </ul>
        </aside>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        @yield('content')
      </div>

      <footer class="main-footer">
        <div class="footer-left">
          <b style="color:#212529;">Copyright © {{ date('Y') }} <a href="https://reignsol.com" target="_blank" style="color:#6777ef; text-decoration:none;"><b>reignsol</b></a>. All rights reserved.</b>
        </div>
        <div class="footer-right">
        </div>
      </footer>
    </div>
  </div>
  <!-- General JS Scripts -->
  <script src="{{ asset('assets/admin/js/app.min.js') }}"></script>
  <!-- JS Libraies index-->
  <script src="{{ asset('assets/admin/bundles/apexcharts/apexcharts.min.js') }}"></script>
  <!-- JS Libraies create-post-->
  <script src="{{ asset('assets/admin/bundles/summernote/summernote-bs4.js') }}"></script>
  <script src="{{ asset('assets/admin/bundles/jquery-selectric/jquery.selectric.min.js') }}"></script>
  <script src="{{ asset('assets/admin/bundles/upload-preview/assets/js/jquery.uploadPreview.min.js') }}"></script>
  <script src="{{ asset('assets/admin/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js') }}"></script>
  <!-- dategrange picker -->
  <script src="{{ asset('assets/admin/bundles/bootstrap-daterangepicker/daterangepicker.js')}}"></script>
  <!-- JS Libraies datatables -->
  <script src="{{ asset('assets/admin/bundles/datatables/datatables.min.js') }}"></script>
  <script src="{{ asset('assets/admin/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('assets/admin/bundles/jquery-ui/jquery-ui.min.js') }}"></script>
  <!-- Page Specific JS File index -->
  <script src="{{ asset('assets/admin/js/page/index.js') }}"></script>
  <!-- Page Specific JS File create-post -->
  <script src="{{ asset('assets/admin/js/page/create-post.js') }}"></script>
  <!-- Page Specific JS File datatables -->
  <script src="{{ asset('assets/admin/js/page/datatables.js') }}"></script>
  <!-- Template JS File -->
  <script src="{{ asset('assets/admin/js/scripts.js') }}"></script>
  <!-- Custom JS File -->
  <script src="{{ asset('assets/admin/js/custom.js') }}"></script>
  <script src="{{ asset('assets/admin/backend/js/toastr.min.js') }}"></script>
  {!! Toastr::message() !!}

  <script>
    @if($errors->any())
    @foreach($errors->all() as $error)
    toastr.error('{{ $error }}', 'Error!!', {
      closeButton:true,
      progressBar:true,
    });
    @endforeach
    @endif
  </script>

  @stack('js')

</body>
</html>