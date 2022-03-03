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
                <h4 >Content Mangements</h4>
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
                      @foreach ($records as $record )
                      @if(!empty($record))
                      <tr>
                        <td>{{ $i++ }}</td>
                        <td>{{ $record->name }}</td>
                        <td>{{ $record->value }}</td> 
                        <td>{{ $record->added_by }}</td>                       
                        <td>
                      @can('setting-list')
                      <a class="btn btn-primary" href="{{ route('editContent', $record->id) }}">Edit</a>
                      @endcan                           
                        </td>
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