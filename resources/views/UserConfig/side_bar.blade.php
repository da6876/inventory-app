@section('title',"Menu Info")
@extends('layout.app')
@section('main')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body border-bottom">
                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-2 mb-md-0 text-uppercase fw-medium">Menu Info</h6>
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
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Search Title</label>
                                                <input type="text" id="title" name="title"
                                                       class="form-control form-control-sm"
                                                       placeholder="Search BY Title" aria-label="name">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="usersTable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>URL</th>
                                    <th>Parent ID</th>
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
                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label" for="name">Name</label>
                                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Menu Name"
                                       tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label" for="url">URL</label>
                                <input type="text" id="url" name="url" class="form-control" placeholder="Enter Url"
                                       tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label" for="icon">Icon</label>
                                <input type="text" id="icon" name="icon" class="form-control" placeholder="Enter Icon"
                                       tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label" for="order">Icon</label>
                                <input type="number" id="order" name="order" class="form-control"
                                       placeholder="Enter Order Number" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label" for="parent_id">Parent Menu</label>
                                <select class="form-select" name="parent_id" id="parent_id">
                                    <option value="">Select Parent Menu</option>
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
            $("#addModal input[type='hidden']").not("[name='_token']").each(function () {
                $(this).val('');
            });
            $(".modal-title").text("Add New");
            $("#addModal").modal("show");
            getPrentMenu();
        }

        $(document).ready(function () {
            var table = $('#usersTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route('menu-info.data') }}',
                    type: 'POST',
                    data: function (d) {
                        d._token = $('input[name="_token"]').val();
                        d.title = $('input[name="title"]').val();
                    }
                },
                columns: [
                    {data: 'id'},
                    {data: 'title'},
                    {data: 'url'},
                    {data: 'parent_id'},
                    {data: 'status'},
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
                            url: "{{ url('menu-info') }}" + '/' + id,
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
                                Swal.fire({
                                    icon: "error",
                                    text: 'Delete failed: ' + xhr.responseText,
                                });
                            }
                        });

                    }
                });

            });

            $('#title').on('change keyup', function () {
                table.draw(); // Reload DataTable with new filters
            });

        });

        function addData() {
            url = "{{ url('menu-info') }}";
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
                    var response = JSON.parse(data.responseText);
                    Swal.fire({
                        text: response.statusMsg || "Internal Server Error",
                        icon: "error"
                    });
                }
            });
            return false;
        };

        function showData(id) {
            $("#addModal form")[0].reset();
            $("#addModal input[type='hidden']").not("[name='_token']").each(function () {
                $(this).val('');
            });
            $.ajax({
                url: "{{ url('menu-info') }}" + '/' + id,
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                    $('#addModal form')[0].reset();
                    $('.modal-title').text('Update Data');
                    $('#addModal').modal('show');
                    $('#id').val(data.uid);
                    $('#name').val(data.title);
                    $('#url').val(data.url);
                    $('#icon').val(data.icon);
                    $('#parent_id').val(data.parent_id);
                    getPrentMenu(data.parent_id);
                    $('#order').val(data.order);
                    $('#status').val(data.status);
                }, error: function (data) {
                    var response = JSON.parse(data.responseText); // Parse the JSON response

                    Swal.fire({
                        text: response.statusMsg || "Internal Server Error", // Use the status message or a default
                        icon: "error" // Use an appropriate icon
                    });
                }
            });
            return false;
        };

        function getPrentMenu(selectedId = null){
            $.ajax({
                url: "{{ url('getPrentMenu') }}",
                method: 'GET',
                success: function(data) {
                    if (Array.isArray(data) && data.length > 0) {
                        var $select = $('#parent_id');
                        $select.empty();
                        $select.append('<option value="">Select a Parent Menu</option>');
                        $.each(data, function(index, item) {
                            $select.append($('<option>', {
                                value: item.id,
                                text: item.title,
                                selected: item.id == selectedId
                            }));
                        });
                    }
                },
                error: function(xhr) {
                    Swal.fire({
                        icon: "error",
                        text: 'An error occurred:', xhr,
                    });
                }
            });
        }
    </script>
@endsection
