@extends('admin.layouts.master')


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
                <h4 >Activity Logs</h4>
              </div>
               <form action="{{ route('search.logs') }}" method="post">
                @csrf
              <div class="col-sm-12">
                <div class="row">
                  <div class="col-sm-3 text-right">
                    <h4 style="margin-top: 1%;">Search</h4>
                  </div>
                  <div class="col-sm-3 ">
                    <input type="text" class="form-control datepicker" name="from">
              </div>
              <div class="col-sm-3">
                <input type="text" class="form-control datepicker" name="to">
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
                      @foreach ($records as $record )
                      @if(!empty($record))
                      <tr>
                        <td>{{$i++}}</td>
                        <td>{{$record->log_name}}</td>
                        <td>{{$record->description}}</td> 
                        <td>{{$record->subject_id}}</td>
                        <td>{{$record->subject_type}}</td>    
                        <td>{{$record->causer_type}}</td>
                        <td>{{$record->causer_id}}</td>
                        <td>{{$record->created_at}}</td>                       
                      </tr>
                      @else
                      'no record found';
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

@push('js')
    <!-- Sweet Alert Js -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.1/dist/sweetalert2.all.min.js"></script>

    <script type="text/javascript">
        function deleteItem(id) {
            const swalWithBootstrapButtons = swal.mixin({
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
            })

            swalWithBootstrapButtons({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    event.preventDefault();
                    document.getElementById('delete-form-'+id).submit();
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons(
                        'Cancelled',
                        'Your data is safe :)',
                        'error'
                    )
                }
            })
        }
    </script>
@endpush  