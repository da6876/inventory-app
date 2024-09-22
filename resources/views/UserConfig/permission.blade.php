@section('title',"Permission")
@extends('layout.app')
@section('style')
@endsection
@section('main')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body border-bottom">
                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-2 mb-md-0 text-uppercase fw-medium">Menu Permission</h6>


                        </div>
                    </div>
                    <div class="card-body">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Permission</h4>
                                    <form id="permission-form" class="forms-sample">
                                        <div class="form-group">
                                            <label for="role_Id">User Role</label>
                                            <select class="form-select form-select" id="role_Id" name="role_Id">
                                                <option value="">Select a Role</option>
                                                <!-- Options will be populated by AJAX -->
                                            </select>
                                        </div>

                                        <h4 class="card-title">Menu Permission List</h4>
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="permissionsTable">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        <input type="checkbox" id="select-all-permissions"> Select All Permissions
                                                    </th>
                                                    <th>Menu ID</th>
                                                    <th>Menu Name</th>
                                                    <th>Permission Name</th>
                                                    <th>Has Permission</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <!-- Rows will be populated by AJAX -->
                                                </tbody>
                                            </table>
                                        </div>

                                        <button type="submit" id="submitPermissions" class="btn btn-primary me-2">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('script')
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "{{ url('getRolesList') }}",
                method: 'GET',
                success: function(data) {
                    var $select = $('#role_Id');
                    if (Array.isArray(data) && data.length > 0) {
                        $select.empty();
                        $select.append('<option value="">Select a Role</option>');
                        $.each(data, function(index, item) {
                            $select.append($('<option>', {
                                value: item.id,
                                text: item.description
                            }));
                        });
                    } else {
                        $select.empty();
                        $select.append('<option value="">Select a Role</option>');
                    }
                },
                error: function(xhr) {
                    Swal.fire({
                        icon: "error",
                        text: 'An error occurred while fetching roles.',
                    });
                }
            });

            $('#permission-form').on('submit', function(event) {
                event.preventDefault();

                var selectedPermissions = [];

                // Collect selected permissions
                $('#permissionsTable tbody').find('.row-select-permission:checked').each(function() {
                    console.log(selectedPermissions);
                    selectedPermissions.push({
                        role_id: $(this).data('role-id'),
                        menu_id: $(this).data('menu-id'),
                        permission_id: $(this).data('permission-id')
                    });
                });

                // Make AJAX request to submit the permissions
                $.ajax({
                    url: "{{ url('submitPermissions') }}", // Your submission endpoint
                    method: 'POST',
                    data: {
                        permissions: JSON.stringify(selectedPermissions),
                        _token: '{{ csrf_token() }}'
                    },

                    success: function(response) {
                        // Handle success response
                        Swal.fire({
                            icon: "success",
                            text: response.message // Show success message
                        });
                        // Optionally reset the form or table
                    },
                    error: function(xhr) {
                        // Handle error response
                        Swal.fire({
                            icon: "error",
                            text: 'An error occurred while saving permissions.',
                        });
                    }
                });
            });


        });


        $(document).ready(function() {
            var table = $('#permissionsTable').DataTable();

            $('#role_Id').change(function() {
                var roleId = $(this).val();
                if (roleId) {
                    $.ajax({
                        url: "{{ url('getRolesMenuList') }}/" + roleId,
                        method: 'GET',
                        success: function(data) {
                            var rows = [];

                            if (Array.isArray(data) && data.length > 0) {
                                $.each(data, function(index, item) {
                                    rows.push([
                                        '<input type="checkbox" class="row-select-permission" data-menu-id="' + item.menu_id + '" data-permission-id="' + item.permission_id + '" data-role-id="' + roleId + '">',
                                        item.menu_id,
                                        item.title,
                                        item.permission_name,
                                        item.has_permission ? 'Yes' : 'No' // Convert to human-readable format
                                    ]);
                                });
                            } else {
                                rows.push(['No permissions found', '', '', '']);
                            }

                            // Clear existing data and add new rows
                            table.clear().rows.add(rows).draw();
                        },
                        error: function(xhr) {
                            Swal.fire({
                                icon: "error",
                                text: 'An error occurred while fetching menu permissions.',
                            });
                        }
                    });
                }
            });

            // Handle the "Select All" checkbox
            $('#select-all-permissions').on('change', function() {
                var isChecked = $(this).is(':checked');
                $('#permissionsTable tbody').find('.row-select-permission').each(function() {
                    $(this).prop('checked', isChecked);
                });
            });
        });
    </script>
@endsection
