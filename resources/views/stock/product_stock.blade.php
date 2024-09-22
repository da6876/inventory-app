@section('title',"Pro. Stock")
@extends('layout.app')
@section('main')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body border-bottom">
                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-2 mb-md-0 text-uppercase fw-medium">Pro. Stock</h6>
                            <button class="btn btn-success btn-sm " type="button" onclick="showModal()"><i class="typcn typcn-plus"></i> View Stock</button>

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
                                                <label>Search Product</label>
                                                <input type="text" id="batch_number" name="batch_number" class="form-control form-control-sm" placeholder="Search Product" aria-label="productSearch">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <form id="stockForm">@csrf
                                <table id="stockTable" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Batch Number</th>
                                        <th>Product</th>
                                        <th>Production Date</th>
                                        <th>Expiry Date</th>
                                        <th>Quantity in Stock</th>
                                        <th>MRP</th>
                                        <th>Dealer Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Dynamic rows will be appended here -->
                                    </tbody>
                                </table>
                                <button type="button" id="addRow" class="btn btn-primary">Add Row</button>
                                <button type="submit" id="submitStock" class="btn btn-success">Submit</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


@endsection
@section('script')

    <script>
        function showModal() {

            window.location.href = "{{url('product-stock')}}";
        }
        $(document).ready(function() {
            // Initialize DataTable
            $('#stockTable').DataTable({
                "paging": false,
                "info": false,
                "searching": false
            });

            // Function to generate a unique batch number
            function generateBatchNumber() {
                return 'BATCH-' + Math.random().toString(36).substr(2, 8).toUpperCase();
            }

            // Function to add a new row
            $('#addRow').on('click', function() {
                let rowCount = $('#stockTable tbody tr').length + 1;
                let batchNumber = generateBatchNumber();
                $('#stockTable tbody').append(`
                    <tr id="row${rowCount}">
                        <td><input type="hidden" class="form-control form-control-sm" name="batch_number[]" value="${batchNumber}" required>${batchNumber}</td>
                        <td>
                            <select class="form-control form-control-sm product-select" name="product_id[]" required>
                                <!-- Product options will be loaded here -->
                            </select>
                        </td>
                        <td><input type="date" class="form-control form-control-sm" name="production_date[]" required></td>
                        <td><input type="date" class="form-control form-control-sm" name="expiry_date[]" required></td>
                        <td><input type="number" class="form-control form-control-sm" name="quantity_in_stock[]" required min="0"></td>
                        <td><input type="number" class="form-control form-control-sm" name="mrp[]" step="0.01" required min="0"></td>
                        <td><input type="number" class="form-control form-control-sm" name="dealer_price[]" step="0.01" required min="0"></td>
                        <td>
                            <select class="form-control form-control-sm" name="status[]" required>
                                <option value="available">Available</option>
                                <option value="out_of_stock">Out of Stock</option>
                            </select>
                        </td>
                        <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                    </tr>
                `);

                // Load product options for the new row
                loadProductsForNewRow($('#stockTable tbody tr:last-child .product-select'));
            });

            // Function to remove a row
            $('#stockTable').on('click', '.removeRow', function() {
                $(this).closest('tr').remove();
            });

            function loadProductsForNewRow(selector) {
                $.ajax({
                    url: '/get-products', // Adjust URL as needed
                    method: 'GET',
                    success: function(data) {
                        let productOptions = '';
                        $.each(data.products, function(index, product) {
                            productOptions += `<option value="${product.id}">${product.name}</option>`;
                        });
                        $(selector).html(productOptions);
                    }
                });
            }

            function validatePrices() {
                let isValid = true;
                $('#stockTable tbody tr').each(function() {
                    let row = $(this);
                    let mrp = parseFloat(row.find('input[name="mrp[]"]').val()) || 0;
                    let dealerPrice = parseFloat(row.find('input[name="dealer_price[]"]').val()) || 0;

                    if (dealerPrice > mrp) {
                        isValid = false;
                        row.find('input[name="dealer_price[]"]').addClass('is-invalid');
                    } else {
                        row.find('input[name="dealer_price[]"]').removeClass('is-invalid');
                    }
                });
                return isValid;
            }

            function validateDateRanges() {
                let isValid = true;
                $('#stockTable tbody tr').each(function() {
                    let row = $(this);
                    let productionDate = new Date(row.find('input[name="production_date[]"]').val());
                    let expiryDate = new Date(row.find('input[name="expiry_date[]"]').val());

                    if (expiryDate <= productionDate) {
                        isValid = false;
                        row.find('input[name="expiry_date[]"]').addClass('is-invalid');
                    } else {
                        row.find('input[name="expiry_date[]"]').removeClass('is-invalid');
                    }
                });
                return isValid;
            }
            // Handle form submission
            $('#stockForm').on('submit', function(e) {
                e.preventDefault();

                let isValid = true;
                $('#stockTable tbody tr').each(function() {
                    let row = $(this);
                    // Check if any required fields are empty
                    row.find('input, select').each(function() {
                        if ($(this).prop('required') && $(this).val() === '') {
                            isValid = false;
                            $(this).addClass('is-invalid');
                        } else {
                            $(this).removeClass('is-invalid');
                        }
                    });
                });

                if (!isValid || !validatePrices() || !validateDateRanges()) {
                    Swal.fire({
                        icon: "error",
                        text: 'Please fill out all required fields, ensure dealer price is greater than or equal to MRP, and that expiry date is after production date.',
                    });
                    return;
                }

                /*if (!isValid) {
                    Swal.fire({
                        icon: "error",
                        text: 'Please fill out all required fields',
                    });
                    return;
                }else if(!validatePrices()){
                    Swal.fire({
                        icon: "error",
                        text: 'Please ensure dealer price is greater than or equal to MRP',
                    });
                    return;
                }else if(validateDateRanges()){
                    Swal.fire({
                        icon: "error",
                        text: 'Please ensure that expiry date is after production date',
                    });
                    return;
                }*/

                $.ajax({
                    url: "{{ url('product-stock') }}",
                    method: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        Swal.fire({
                            text: response.statusMsg,
                        });
                        if (response.statusCode === 200) {
                            $('#stockTable tbody').empty(); // Clear table after successful submission
                        }
                    },
                    error: function(xhr) {
                        Swal.fire({
                            icon: "error",
                            text: 'An error occurred while processing your request.<br>Delete failed: ' + xhr.responseText,
                        });
                    }
                });
            });
        });
    </script>


@endsection
