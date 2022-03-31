@extends('admin.layouts.master')
@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Edit Coupon</h4>
              </div>
              {!! Form::model($coupon, ['method' => 'PUT','route' => ['coupon.update', $coupon->id]]) !!}
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
                    {!! Form::select('restaurant_id', $restaurant, null, array('class' => 'form-control selectric')) !!}
                  </div>
                </div>   
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Grocery</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::select('grocery_id', $grocery, null,  array('class' => 'form-control selectric')) !!}
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
                    {!! Form::date('exp_date', null, array('placeholder' => 'Exp Date','class' => 'form-control')) !!}
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