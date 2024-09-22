@section('title',"Pro. Info")
@extends('layout.app')
@section('style')
    <style>
        img{
            max-width:180px;
        }
        input[type=file]{
            padding:10px;
            background:#2d2d2d;}
    </style>
@endsection
@section('main')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body border-bottom">
                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-2 mb-md-0 text-uppercase fw-medium">Pro. Info</h6>
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
                                                <label>Search Name</label>
                                                <input type="text" id="name" name="name" class="form-control form-control-sm" placeholder="Search BY Name" aria-label="name">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="usersTable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>SKU Code</th>
                                    <th>Name</th>
                                    <th>Shot Decs</th>
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
                        <div class="row g-3">
                            <div class="col mb-1">
                                <label class="form-label" for="i_name">Name</label>
                                <input type="text" id="i_name" name="i_name" class="form-control" placeholder="Enter Name" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label">Select Category</label>
                                <select class="form-select" name="cat_id" id="cat_id">

                                </select>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label">Select Sub Category</label>
                                <select class="form-select" name="sub_cat_id" id="sub_cat_id">
                                    <option  value="">Select Sub Category</option>
                                </select>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="row g-2">
                            <div class="col mb-1">
                                <label class="form-label">Select Pro Type</label>
                                <select class="form-select" name="pro_type_id" id="pro_type_id">
                                    <option  value="">Select Pro Type</option>
                                </select>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label">Select Unit</label>
                                <select class="form-select" name="unit" id="unit">
                                    <option  value="">Select Unit</option>
                                    <option value="GM">GM</option>
                                    <option value="KG">KG</option>
                                    <option value="KG">LT</option>
                                    <option value="PCS">PCS</option>
                                </select>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="col mb-1">
                                <label class="form-label">Pcs Per Ctn</label>
                                <input type="number" id="pcs_per_ctn" name="pcs_per_ctn" class="form-control" placeholder="Enter Shot Decs" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="row g-1">

                            <div class="col mb-1">
                                <label class="form-label" for="i_name">Shot Decs</label>
                                <input type="text" id="shot_decs" name="shot_decs" class="form-control" placeholder="Enter Shot Decs" tabindex="-1"/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="row g-2">

                            <div class="col mb-1">
                                <label class="form-label" for="pro_image1"> Pro Image 1</label>
                                <input type='file' id="pro_image1" name="pro_image1" class="form-control" onchange="readURL(this);" />
                                <div class="invalid-feedback"></div>
                            </div>

                            <div class="col mb-1">
                                <img id="blah" src="http://placehold.it/180" alt="your image" width="180px" />
                            </div>
                            <div class="col mb-1">
                                <label class="form-label">Select Status</label>
                                <select class="form-select" name="status" id="status">
                                    <option  value="">Select Status</option>
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
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function showModal() {
            $("#addModal form")[0].reset();
            $("#addModal input[type='hidden']").not("[name='_token']").each(function() {
                $(this).val('');
            });
            $(".modal-title").text("Add New");
            $("#addModal").modal("show");
        }

        $(document).ready(function () {
            var table = $('#usersTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route('ProInfo.data') }}',
                    type: 'POST',
                    data: function (d) {
                        d._token = $('input[name="_token"]').val();
                        d.name = $('input[name="name"]').val();
                    }
                },
                columns: [
                    {data: 'id'},
                    {data: 'pro_sku_code'},
                    {data: 'name'},
                    {data: 'shot_decs'},
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
                            url: "{{ url('ProInfo') }}" + '/' + id,
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
            url = "{{ url('ProInfo') }}";
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
                    }else if (data.statusCode == 204) {
                        showErrors(data.errors);
                    }else{
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
            $("#addModal input[type='hidden']").not("[name='_token']").each(function() {
                $(this).val('');
            });
            $("#addModal").modal("show");
            $("#pass").hide();

            $.ajax({
                url: "{{ url('ProInfo') }}" + '/' + id,
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                    $('#addModal form')[0].reset();
                    $('.modal-title').text('Update Data');
                    $('#addModal').modal('show');
                    $('#id').val(data.uid);
                    $('#cat_id').val(data.cat_id);
                    $('#i_name').val(data.name);
                    $('#pro_type_id').val(data.pro_type_id);
                    getSubcat(data.cat_id, data.sub_cat_id);
                    $('#sub_cat_id').val(data.sub_cat_id);
                    $('#shot_decs').val(data.shot_decs);
                    $('#unit').val(data.unit);
                    $('#pcs_per_ctn').val(data.pcs_per_ctn);
                    $('#pro_image1').val(data.pro_image1);
                    $('#status').val(data.status);
                }, error: function () {
                    Swal.fire({
                        icon: "error",
                        text: "Error Occured",
                    });
                }
            });
            return false;
        };

        $.ajax({
            url: "{{ url('GetProCategory') }}",
            method: 'GET',
            success: function(data) {
                if (Array.isArray(data) && data.length > 0) {
                    var $select = $('#cat_id');
                    $select.empty();
                    $select.append('<option value="">Select a category</option>');
                    $.each(data, function(index, item) {
                        $select.append($('<option>', {
                            value: item.id,
                            text: item.name
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

        $('#cat_id').change(function() {
            var categoryId = $(this).val();
            if (categoryId) {
                getSubcat(categoryId)
            } else {
                $('#sub_cat_id').empty().append('<option value="">Select a subcategory</option>'); // Clear subcategories if no category is selected
            }
        });

        $.ajax({
            url: "{{ url('GetProType') }}",
            method: 'GET',
            success: function(data) {
                if (Array.isArray(data) && data.length > 0) {
                    var $select = $('#pro_type_id');
                    $select.empty();
                    $select.append('<option value="">Select Pro Type</option>');
                    $.each(data, function(index, item) {
                        $select.append($('<option>', {
                            value: item.id,
                            text: item.name
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

        function getSubcat(categoryId, selectedSubcatId = null) {
            $.ajax({
                url: "{{ url('GetProSubCatByCatId') }}",
                method: 'GET',
                data: { cat_id: categoryId },
                success: function(data) {
                    var $subCategorySelect = $('#sub_cat_id');
                    $subCategorySelect.empty();
                    $subCategorySelect.append('<option value="">Select a subcategory</option>');

                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, item) {
                            $subCategorySelect.append($('<option>', {
                                value: item.id,
                                text: item.name,
                                selected: item.id == selectedSubcatId
                            }));
                        });
                    }

                    // Manually set the selected value if provided
                    if (selectedSubcatId) {
                        $subCategorySelect.val(selectedSubcatId);
                    }
                },
                error: function(xhr) {
                    Swal.fire({
                        icon: "error",
                        text: 'An error occurred: ' + xhr.statusText,
                    });
                }
            });
        }
    </script>
@endsection
