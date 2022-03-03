@extends('admin.layouts.master')

@section('page-title')
	Manage Rider Details
@endsection

@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Rider Details</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-striped" id="table-1">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Rider Name</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach ($rider_details as $key => $rider_detail)
                      <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $rider_detail->rider->name }}</td>
                        <td>
                            @can('rider-detail-view')
                               <a class="btn btn-primary" href="{{ route('riders.rider-detail.view',$rider_detail->id) }}">View</a>
                            @endcan
                        </td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
</section>
@endsection