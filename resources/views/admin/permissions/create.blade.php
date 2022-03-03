@extends('admin.layouts.master')


@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Create New Permission</h4>
              </div>
              <form action="{{ route('permissions.store') }}" method="POST">
                @csrf
                <input type="hidden" name="guard_name" value="web">
                <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Name</label>
                  <div class="col-sm-12 col-md-7">
                    <input type="text" name="name" class="form-control" placeholder="Name">
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