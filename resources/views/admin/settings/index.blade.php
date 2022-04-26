@extends('admin.layouts.master')

@section('page-title')
 Add & Update Settings
@endsection

@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Add & Update Settings</h4>
              </div>
              <form action="{{ route('settings.store') }}" method="POST">
                @csrf
                <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Company Name</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['company_name'] }}" type="text" name="company_name" class="form-control" placeholder="Company Name">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Email</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['email'] }}" type="text" name="email" class="form-control" placeholder="Email">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Secondary Email</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['secondary_email'] }}" type="text" name="secondary_email" class="form-control" placeholder="Secondary Email">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">VAT</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['vat'] }}" type="text" name="vat" class="form-control" pattern="\d*" placeholder="VAT">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Commission</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['commission'] }}" type="text" name="commission" class="form-control" pattern="\d*" placeholder="Commission">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Contact Number</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['contact_number'] }}" type="text" name="contact_number" class="form-control" pattern="\d*" placeholder="Contact Number">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Whatsapp Number</label>
                  <div class="col-sm-12 col-md-7">
                    <input value="{{ $data['whatsapp_number'] }}" type="text" name="whatsapp_number" class="form-control" pattern="\d*" placeholder="Whatsapp Number">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Address</label>
                  <div class="col-sm-12 col-md-7">
                   <textarea class="form-control" style="height:150px" name="address" placeholder="Address">{{ $data['address'] }}</textarea>
                  </div>
                </div>
                 <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Delivery Cost (per mile)</label>
                  <div class="col-sm-12 col-md-7">
                   <input value="{{ $data['delivery_cost'] }}" type="text" name="delivery_cost" class="form-control" pattern="\d*" placeholder="Delivery Cost">
                  </div>
                </div>

                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                  <div class="col-sm-12 col-md-7">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                </div>
              </div>
              </form>
            </div>
          </div>
        </div>
    </div>
</section>
@endsection