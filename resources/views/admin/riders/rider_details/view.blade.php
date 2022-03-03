@extends('admin.layouts.master')

@section('page-title')
  View Rider Detail
@endsection

@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>View Rider Detail</h4>
              </div>
                <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Rider Name</label>
                  <div class="col-sm-12 col-md-7">
                    <input type="text" class="form-control" placeholder="Driver Name" value="{{ $rider_detail->rider->name }}" readonly>
                  </div>
                </div>
                    <div class="form-group row mb-4">
                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Vehicle Brand</label>
                        <div class="col-sm-12 col-md-7">
                            <input type="text" class="form-control" placeholder="Vehicle Brand" value="{{ $rider_detail->vehicle_brand }}" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Vehicle Model</label>
                        <div class="col-sm-12 col-md-7">
                            <input type="text" class="form-control" placeholder="Vehicle Model" value="{{ $rider_detail->vehicle_model }}" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Vehicle Year Of Manufacterer</label>
                        <div class="col-sm-12 col-md-7">
                            <input type="text" class="form-control" placeholder="Vehicle Year Of Manufacterer" value="{{ $rider_detail->vehicle_manufacterer_year }}" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Vehicle Plate No</label>
                        <div class="col-sm-12 col-md-7">
                            <input type="text" class="form-control" placeholder="Vehicle Plate No" value="{{ $rider_detail->vehicle_plate_no }}" readonly>
                        </div>
                    </div>
                  <div class="form-group row mb-4">
                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Vehicle Image</label>
                    <div class="col-sm-12 col-md-7">
                      <div id="image-preview" class="image-preview">
                        <label for="image-upload" id="image-label">Vehicle Image</label>
                        <img src="{{ asset($rider_detail->vehicle_image) }}">
                      </div>
                    </div>
                  </div>
                  <div class="form-group row mb-4">
                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Rider Identification</label>
                    <div class="col-sm-12 col-md-7">
                      <div id="image-preview" class="image-preview">
                        <label for="image-upload" id="image-label">Rider Identification</label>
                        <img src="{{ asset($rider_detail->rider_identification_image) }}">
                      </div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
    </div>
</section>
@endsection
