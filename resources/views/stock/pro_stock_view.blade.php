@section('title',"View Pro. Stock")
@extends('layout.app')
@section('main')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body border-bottom">
                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-2 mb-md-0 text-uppercase fw-medium">View Pro. Stock</h6>
                            <button class="btn btn-success btn-sm " type="button" onclick="showModal()"><i class="typcn typcn-plus"></i> Add New</button>

                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive pt-3">
                            <div>
                                <form id="filterForm">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Search Batch Number</label>
                                                <input type="text" id="batch_number" name="batch_number" class="form-control form-control-sm" placeholder="Search BY Batch Number" aria-label="name">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="usersTable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>batch_number</th>
                                    <th>production_date</th>
                                    <th>production_date</th>
                                    <th>expiry_date</th>
                                    <th>quantity_in_stock</th>
                                    <th>mrp</th>
                                    <th>dealer_price</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Data will be populated by DataTables -->
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- =================================================Add Customers=========================================================== -->

@endsection
@section('script')

    <script>
        function showModal() {

            window.location.href = 'product-stock/create';
        }

        $(document).ready(function () {
            var table = $('#usersTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route('ProductStock.data') }}',
                    type: 'POST',
                    data: function (d) {
                        d._token = $('input[name="_token"]').val();
                        d.batch_number = $('input[name="batch_number"]').val();
                    }
                },
                columns: [
                    {data: 'batch_number', title: 'Batch Number'},
                    {data: 'pro_info.name', title: 'Product Name'},
                    {data: 'production_date', title: 'Production Date'},
                    {data: 'expiry_date', title: 'Expiry Date'},
                    {data: 'quantity_in_stock', title: 'Quantity Stock'},
                    {data: 'mrp', title: 'MRP'},
                    {data: 'dealer_price', title: 'Dealer Price'},
                    {data: 'status', title: 'Status'},
                    {
                        data: null,
                        render: function (data, type, row) {
                            return `
                                <button type="button" class="btn btn-outline-success btn-sm btn-icon-text edit-btn" data-id="${row.uid}"><i class="typcn typcn-edit btn-icon-append"></i></button>
                                <button type="button" class="btn btn-outline-danger btn-sm btn-icon-text delete-btn" data-id="${row.uid}"><i class="typcn typcn-delete-outline btn-icon-append"></i></button>
                            `;
                        },
                        orderable: false,
                        searchable: false
                    }
                ],
                lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                pageLength: 10
            });

            $('#usersTable tbody').on('click', '.edit-btn', function () {
                var id = $(this).data('id');
                showData(id);
            });

            // Handle Update button click
            $('#usersTable tbody').on('click', '.update-btn', function () {
                var data = table.row($(this).parents('tr')).data();
                console.log('Update button clicked for:', data);
            });

            // Handle Delete button click
            $('#usersTable tbody').on('click', '.delete-btn', function() {
                var id = $(this).data('id');
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        var csrf_token = $('meta[name="csrf-token"]').attr('content');

                        $.ajax({
                            url: "{{ url('ProType') }}" + '/' + id,
                            type: "POST",
                            data: {'_method': 'DELETE', '_token': csrf_token},
                            success: function(response) {
                                if (response.statusCode == 200) {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "Your file has been deleted.",
                                        icon: "success"
                                    });
                                } else {
                                    Swal.fire("Error occured !!");
                                }
                                $('#usersTable').DataTable().ajax.reload();
                            },
                            error: function(xhr) {
                                Swal.fire({
                                    icon: "error",
                                    text: 'Delete failed: ' + xhr.responseText,
                                });
                            }
                        });

                    }
                });

            });

            $('#batch_number').on('change keyup', function () {
                table.draw(); // Reload DataTable with new filters
            });

        });



    </script>
@endsection
