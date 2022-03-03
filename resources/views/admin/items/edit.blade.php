@extends('admin.layouts.master')

@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Create New Item</h4>
              </div>
              {!! Form::model($item, ['method' => 'PUT','route' => ['item.update', $item->id], 'files' => 'true']) !!}

                <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Name</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Restaurant</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::select('restaurent_id', $restaurants, null, array('class' => 'form-control selectric')) !!}
                  </div>
                </div>
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Price</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('price', null, array('placeholder' => 'Price','class' => 'form-control')) !!}
                  </div>
                </div>
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Ingredients</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('ingredients', null, array('placeholder' => 'Ingredients','class' => 'form-control')) !!}
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Discount</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('discount', null,array('placeholder' => 'Discount','class' => 'form-control')) !!}
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Start Date</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::date('start_date', null,array('placeholder' => 'Start Date','class' => 'form-control')) !!}
                  </div>
                </div>
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">End Date</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::date('end_date', null, array('placeholder' => 'End Date','class' => 'form-control')) !!}
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Image</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::file('image', null, array('placeholder' => 'image','class' => 'form-control')) !!}
                  </div>
                </div>
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Description</label>
                  <div class="col-sm-12 col-md-7">
                    {!! Form::text('description', null, array('placeholder' => 'Description','class' => 'form-control')) !!}
                  </div>
                </div>
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