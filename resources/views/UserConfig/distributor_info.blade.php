@section('title',"Distributor Info")
@extends('layout.app')
@section('main')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body border-bottom">
                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-2 mb-md-0 text-uppercase fw-medium">Distributor Info</h6>
                            <button class="btn btn-success btn-sm " type="button" onclick="showModal()"><i
                                    class="typcn typcn-plus"></i> Add New
                            </button>

                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive pt-3">
                            <div>
                                <form id="filterForm">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Search Name</label>
                                                <input type="text" id="name" name="name"
                                                       class="form-control form-control-sm"
                                                       placeholder="Enter Name For Search" aria-label="Username">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Search Email</label>
                                                <input type="text" id="email" name="email"
                                                       class="form-control form-control-sm"
                                                       placeholder="Enter Email For Search" aria-label="Username">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="usersTable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Owner Name</th>
                                    <th>Owner Phone</th>
                                    <th>Company Name</th>
                                    <th>Company Email</th>
                                    <th>Address</th>
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
    <div class="modal fade bd-example-modal-lg" id="addModal" tabindex="-1" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addRoleForm" class="row g-3" onsubmit="return false">
                        @csrf
                        <input type="hidden" name="id" id="id"/>
                        <div class="row g-1">
                            <div class="col mb-1">
                                <label class="form-label" for="owner_name">Owner Name</label>
                                <input type="text" id="owner_name" name="owner_name" class="form-control"
                                       placeholder="Enter Owner Name" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label" for="owner_email">Owner Email</label>
                                <input type="text" id="owner_email" name="owner_email" class="form-control"
                                       placeholder="Enter Owner email"/>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1" id="pass">
                                <label class="form-label" for="owner_phone">Owner Phone</label>
                                <input type="number" id="owner_phone" name="owner_phone" class="form-control"
                                       placeholder="Enter Owner Phone"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="row g-1">
                            <div class="col mb-1">
                                <label class="form-label" for="company_name">Company Name</label>
                                <input type="text" id="company_name" name="company_name" class="form-control"
                                       placeholder="Enter Company Name" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label" for="company_email">Company Email</label>
                                <input type="text" id="company_email" name="company_email" class="form-control"
                                       placeholder="Enter Company email"/>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1" id="pass">
                                <label class="form-label" for="company_phone">Company Phone</label>
                                <input type="number" id="company_phone" name="company_phone" class="form-control"
                                       placeholder="Enter Company Phone"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="row g-1">
                            <div class="col mb-1">
                                <label class="form-label" for="address">Company Address</label>
                                <input type="text" id="address" name="address" class="form-control"
                                       placeholder="Enter Company address" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label">Select User</label>
                                <select class="form-select" name="user_id" id="user_id">
                                    <option value="">Select A User</option>
                                </select>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label">Select Status</label>
                                <select class="form-select" name="status" id="status">
                                    <option value="">Select Status</option>
                                    <option value="A">Active</option>
                                    <option value="I">InActive</option>
                                </select>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" onclick="addData()" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('script')

    <script>
        function showModal() {
            $("#addModal form")[0].reset();
            $(".modal-title").text("Add New User");
            $("#addModal").modal("show");
        }

        $(document).ready(function () {
            var table = $('#usersTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route('distributor-info.data') }}',
                    type: 'POST',
                    data: function (d) {
                        d._token = $('input[name="_token"]').val(); // Include CSRF token
                        d.name = $('input[name="name"]').val();
                        d.email = $('input[name="email"]').val();
                    }
                },
                columns: [
                    {data: 'id'},
                    {data: 'owner_name', title: 'Owner Name'},
                    {data: 'owner_phone', title: 'Owner Phone'},
                    {data: 'company_name', title: 'Company Name'},
                    {data: 'company_email', title: 'Company Email'},
                    {data: 'address', title: 'Address'},
                    {data: 'status', title: 'Status'},
                    {
                        data: null,
                        render: function (data, type, row) {
                            return `
                                <button type="button" class="btn btn-outline-success btn-sm btn-icon-text edit-btn" data-id="${row.id}"><i class="typcn typcn-edit btn-icon-append"></i></button>
                                <button type="button" class="btn btn-outline-danger btn-sm btn-icon-text delete-btn" data-id="${row.id}"><i class="typcn typcn-delete-outline btn-icon-append"></i></button>
                        `;
                        },
                        orderable: false,
                        searchable: false
                    }
                ],
                columnDefs: [
                    {
                        targets: 4,
                        render: function (data, type, row) {
                            return data ? new Date(data).toLocaleString('en-GB', {timeZone: 'Asia/Dhaka'}) : 'N/A';
                        }
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
            $('#usersTable tbody').on('click', '.delete-btn', function () {
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
                            url: "{{ url('distributor-info') }}" + '/' + id,
                            type: "POST",
                            data: {'_method': 'DELETE', '_token': csrf_token},
                            success: function (response) {
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
                            error: function (xhr) {
                                alert('Delete failed: ' + xhr.responseText);
                            }
                        });

                    }
                });

            });

            $('#name, #email').on('change keyup', function () {
                table.draw(); // Reload DataTable with new filters
            });

        });

        function addData() {
            url = "{{ url('distributor-info') }}";
            $.ajax({
                url: url,
                type: "POST",
                data: new FormData($("#addModal form")[0]),
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.statusCode == 200) {
                        Swal.fire({
                            title: "Success!",
                            text: data.statusMsg,
                            icon: "success"
                        });
                        $("#addModal form")[0].reset();
                        $("#addModal").modal("hide");
                        $('#usersTable').DataTable().ajax.reload();
                    } else if (data.statusCode == 204) {
                        showErrors(data.errors);
                    } else {
                        Swal.fire({
                            icon: "error",
                            text: data.statusMsg,
                        });

                    }
                }, error: function (data) {
                    Swal.fire({
                        text: "Internal Server Error",
                        icon: "question"
                    });
                }
            });
            return false;
        };

        function showData(id) {
            $("#addModal form")[0].reset();
            $("#addModal").modal("show");
            $("#pass").hide();

            $.ajax({
                url: "{{ url('distributor-info') }}" + '/' + id,
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                    $('#addModal form')[0].reset();
                    $('.modal-title').text('Update');
                    $('#addModal').modal('show');
                    $('#id').val(data.id);
                    $('#owner_name').val(data.owner_name);
                    $('#owner_phone').val(data.owner_phone);
                    $('#owner_email').val(data.owner_email);
                    $('#company_name').val(data.company_name);
                    $('#company_phone').val(data.company_phone);
                    $('#company_email').val(data.company_email);
                    $('#address').val(data.address);
                    $('#status').val(data.status);
                }, error: function () {
                    swal({
                        title: "Oops",
                        text: "Error Occured",
                        icon: "error",
                        timer: '1500'
                    });
                }
            });
            return false;
        };

        $.ajax({
            url: "{{ url('getDisUserList') }}",
            method: 'GET',
            success: function (data) {
                var $select = $('#user_id');
                if (Array.isArray(data) && data.length > 0) {
                    $select.empty();
                    $select.append('<option value="">Select a User</option>');
                    $.each(data, function (index, item) {
                        $select.append($('<option>', {
                            value: item.id,
                            text: item.name
                        }));
                    });
                } else {
                    $select.empty();
                    $select.append('<option value="">Select a User</option>');
                }
            },
            error: function (xhr) {
                Swal.fire({
                    icon: "error",
                    text: 'An error occurred:', xhr,
                });
            }
        });
    </script>
@endsection
