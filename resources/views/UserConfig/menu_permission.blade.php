@section('title',"Menu Permission")
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
                                    <h4 class="card-title">Role Permission</h4>
                                    <form id="permission-form" class="forms-sample">
                                        <div class="form-group">
                                            <label for="role_Id">User Role</label>
                                            <select class="form-select form-select" id="role_Id" name="role_Id">
                                                <option value="">Select a Role</option>
                                                <!-- Options will be populated by AJAX -->
                                            </select>
                                        </div>

                                        <h4 class="card-title">Menu List</h4>
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="permissionsTable">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        <input type="checkbox" id="select-all-permissions"> Select All Permissions
                                                    </th>
                                                    <th>Menu Id</th>
                                                    <th>Menu Name</th>
                                                    <th>View Permission</th>
                                                    <th>Add Permission</th>
                                                    <th>Update Permission</th>
                                                    <th>Delete Permission</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <!-- Rows will be populated by AJAX -->
                                                </tbody>
                                            </table>
                                        </div>

                                        <button type="submit" class="btn btn-primary me-2">Submit</button>
                                        <button type="button" class="btn btn-light" id="cancel-button">Cancel</button>
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
            // Fetch roles for the select dropdown
            $.ajax({
                url: "{{ url('getUserTypeList') }}",
                method: 'GET',
                success: function(data) {
                    var $select = $('#role_Id');
                    if (Array.isArray(data) && data.length > 0) {
                        $select.empty();
                        $select.append('<option value="">Select a Role</option>');
                        $.each(data, function(index, item) {
                            $select.append($('<option>', {
                                value: item.id,
                                text: item.name
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
                var roleId = $('#role_Id').val();
                var permissionsData = [];

                $('table tbody tr').each(function() {
                    var menuId = $(this).find('td').eq(1).text(); // Assuming menu ID is in the first column
                    var view = $(this).find('input[name^="permissions[' + menuId + '][view]"]').is(':checked') ? '1' : '0';
                    var add = $(this).find('input[name^="permissions[' + menuId + '][add]"]').is(':checked') ? '1' : '0';
                    var update = $(this).find('input[name^="permissions[' + menuId + '][update]"]').is(':checked') ? '1' : '0';
                    var deletePermission = $(this).find('input[name^="permissions[' + menuId + '][delete]"]').is(':checked') ? '1' : '0';

                    permissionsData.push({
                        role_id: roleId,
                        menu_id: menuId,
                        view: view,
                        add: add,
                        update: update,
                        delete: deletePermission
                    });
                });

                $.ajax({
                    url: "{{ url('MenuPermission') }}",
                    method: 'POST',
                    data: {
                        _token: "{{ csrf_token() }}",
                        permissions: JSON.stringify(permissionsData) // Send JSON array
                    },
                    success: function(response) {
                        Swal.fire({
                            icon: 'success',
                            text: 'Permissions updated successfully!',
                        });
                    },
                    error: function(xhr) {
                        Swal.fire({
                            icon: "error",
                            text: 'An error occurred while saving permissions.',
                        });
                    }
                });
            });
        });


        $(document).ready(function() {
            // Initialize DataTable
            var table = $('#permissionsTable').DataTable();

            // Fetch menu permissions based on selected role
            $('#role_Id').change(function() {
                var roleId = $(this).val();
                if (roleId) {
                    $.ajax({
                        url: "{{ url('getMenuList') }}/" + roleId,
                        method: 'GET',
                        success: function(data) {
                            var rows = [];

                            if (Array.isArray(data) && data.length > 0) {
                                $.each(data, function(index, item) {
                                    rows.push([
                                        '<input type="checkbox" class="row-select-all">', // Row-specific select all checkbox
                                        item.id,
                                        item.title,
                                        '<label class="toggle-switch toggle-switch-success">' +
                                        '<input type="checkbox" class="permission-checkbox view-permission" name="permissions[' + item.id + '][view]" value="1"' + (item.view ? ' checked' : '') + '>' +
                                        '<span class="toggle-slider round"></span>' +
                                        '</label>',
                                        '<label class="toggle-switch toggle-switch-success">' +
                                        '<input type="checkbox" class="permission-checkbox add-permission" name="permissions[' + item.id + '][add]" value="1"' + (item.add ? ' checked' : '') + '>' +
                                        '<span class="toggle-slider round"></span>' +
                                        '</label>',
                                        '<label class="toggle-switch toggle-switch-success">' +
                                        '<input type="checkbox" class="permission-checkbox update-permission" name="permissions[' + item.id + '][update]" value="1"' + (item.update ? ' checked' : '') + '>' +
                                        '<span class="toggle-slider round"></span>' +
                                        '</label>',
                                        '<label class="toggle-switch toggle-switch-success">' +
                                        '<input type="checkbox" class="permission-checkbox delete-permission" name="permissions[' + item.id + '][delete]" value="1"' + (item.delete ? ' checked' : '') + '>' +
                                        '<span class="toggle-slider round"></span>' +
                                        '</label>'
                                    ]);
                                });
                            } else {
                                rows.push(['', 'No permissions found', '', '', '', '', '']);
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

            // Handle row-specific "Select All Permissions" Checkbox
            $('#permissionsTable').on('change', '.row-select-all', function() {
                var isChecked = $(this).is(':checked');
                $(this).closest('tr').find('input.permission-checkbox').prop('checked', isChecked);
            });

            // Handle "Select All Permissions" Checkbox in Header
            $('#select-all-permissions').on('change', function() {
                var isChecked = $(this).is(':checked');
                $('#permissionsTable tbody').find('input.permission-checkbox').each(function() {
                    $(this).prop('checked', isChecked);
                });
                $('#permissionsTable tbody').find('input.row-select-all').prop('checked', isChecked);
            });
        });
    </script>
@endsection
