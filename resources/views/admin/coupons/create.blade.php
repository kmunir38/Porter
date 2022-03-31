@extends('admin.layouts.master')

@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Create New Coupon</h4>
              </div>
              {!! Form::open(array('route' => 'coupon.store','method'=>'POST', 'files' => true)) !!}
                 <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Name</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('title', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Restaurant</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::select('restaurant_id', $restaurant, null,  array('placeholder' => 'Select','class' => 'form-control selectric')) !!}
                  </div>
                </div>   
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Grocery</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::select('grocery_id', $grocery, null,  array('placeholder' => 'Select','class' => 'form-control selectric')) !!}
                  </div>
                </div>   
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Voucher Code</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('voucher_code', null,  array('placeholder' => 'Code','class' => 'form-control')) !!}
                  </div>
                </div>   
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Discount</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('discount', null,  array('placeholder' => 'Discount','class' => 'form-control')) !!}
                  </div>
                </div>   
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Expiry Date</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('exp_date', null, array('placeholder' => 'Exp Date','class' => 'form-control datetimepicker')) !!}
                  </div>
                </div>  
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Expiry Date</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::textarea('description', null, array('placeholder' => 'Description','class' => 'form-control')) !!}
                  </div>
                </div>                 
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