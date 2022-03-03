@extends('admin.layouts.master')

@section('page-title')
   Search Logs
@endsection

@section('content')
@php
$i = 1;
@endphp
<section class="section">
   <div class="section-body">
      <div class="row">
         <div class="col-12">
            <div class="card">
               <div class="card-header">
                  <h4>Search Logs</h4>
               </div>
               <form action="{{ route('logs.search') }}" method="post">
                  @csrf
                  <div class="col-sm-12">
                     <div class="row">
                        <div class="col-sm-3 text-right">
                           <h4 style="margin-top: 1%;">Search</h4>
                        </div>
                        <div class="col-sm-3 ">
                           <input type="text" class="form-control datepicker" name="from_date">
                        </div>
                        <div class="col-sm-3">
                           <input type="text" class="form-control datepicker" name="from_to">
                        </div>
                        <div class="col-sm-3">
                           <input type="submit" class="btn btn-primary" name="submit" value="Submit">
                        </div>
                     </div>
                  </div>
               </form>
               <div class="card-body">
                  <div class="table-responsive">
                     <table class="table table-striped" id="table-1">
                        <thead>
                           <tr>
                              <th>No</th>
                              <th>Log Name</th>
                              <th>Description</th>
                              <th>Subject ID</th>
                              <th>Sub Type</th>
                              <th>Causer Type </th>
                              <th>Causer ID</th>
                              <th>Create At</th>
                           </tr>
                        </thead>
                        <tbody>
                           @foreach ($logs as $log)
                           @if(!empty($log))
                           <tr>
                              <td>{{ $i++ }}</td>
                              <td>{{ $log->log_name }}</td>
                              <td>{{ $log->description }}</td>
                              <td>{{ $log->subject_id }}</td>
                              <td>{{ $log->subject_type }}</td>
                              <td>{{ $log->causer_type }}</td>
                              <td>{{ $log->causer_id }}</td>
                              <td>{{ $log->created_at }}</td>
                           </tr>
                           @else
                           <div class="alert alert-danger">
                             No Records Found
                           </div>
                           @endif
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