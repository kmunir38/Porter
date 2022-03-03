@extends('admin.layouts.master')


@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Edit Permission</h4>
              </div>
              <form action="{{ route('permissions.update',$permission->id) }}" method="POST">
                @csrf
                @method('PUT')
                <input type="hidden" name="guard_name" value="{{ $permission->guard_name }}">
                <div class="card-body">
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Name</label>
                  <div class="col-sm-12 col-md-7">
                   <input type="text" name="name" value="{{ $permission->name }}" class="form-control" placeholder="Name">
                  </div>
                </div>
                <div class="form-group row mb-4">
                  <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                  <div class="col-sm-12 col-md-7">
                    <button type="submit" class="btn btn-primary">Update</button>
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