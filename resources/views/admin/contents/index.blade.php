@extends('admin.layouts.master')

@section('page-title')
  Manage Contents
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
                <h4>Contents</h4>
              </div>
               <div>              
              </div>                
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-striped" id="table-1">
                    <thead>
                      <tr>                        
                        <th>No</th>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Added By</th>                                              
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach($records as $record)
                      <tr>
                        <td>{{ $i++ }}</td>
                        <td>{{ $record->name }}</td>
                        <td>{{ Str::limit($record->value, 60) }}</td> 
                        <td>{{ $record->user->name ?? 'None' }}</td>                       
                        <td>
                        <a class="btn btn-primary" href="{{ route('contents.edit', $record->id) }}">Edit</a>                          
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