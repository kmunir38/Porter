@extends('admin.layouts.master')


@section('content')
<section class="section">
    <div class="section-body">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4>Items Lists</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-striped" id="table-1">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Restaurant / Grocery</th>
                        <th>Price</th>
                        <th>Start</th>
                        <th>End</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach ($items as $key => $value)
                      <tr>
                        <td>{{ $key + 1 }}</td>
                        <td><img src="{{ asset($value->image) }}" width="80"> </td>
                        <td>{{ $value->name }}</td>
                        @if($value->restaurant !== NULL)
                        <td>{{ $value->restaurant->name }} </td>
                        @else
                        <td>{{ $value->grocery->name }} </td>
                        @endif
                        <td>{{ $value->price }}</td>
                        <td>{{ $value->start_date }}</td>
                        <td>{{ $value->end_date }}</td>
                        <td>
                            @can('item-edit')
                               <a class="btn btn-primary" href="{{ route('item.edit',$value->id) }}">Edit</a>
                            @endcan
                            @can('item-delete')
                            <button class="btn btn-danger" type="button" onclick="deleteItem({{ $value->id }})">
                                <i class="fa fa-trash" aria-hidden="true"></i>
                            </button>
                            <form id="delete-form-{{ $value->id }}" action="{{ route('item.destroy', $value->id) }}" method="post"
                                  style="display:none;">
                                @csrf
                                @method('DELETE')
                            </form>
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