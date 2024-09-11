<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin- @yield('title') </title>
    <!-- base:css -->
    <link rel="stylesheet" href="{{asset('assets/vendors/typicons/typicons.css')}}">
    <link rel="stylesheet" href="{{asset('assets/vendors/css/vendor.bundle.base.css')}}">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="{{asset('assets/css/style.css')}}">

    <link rel="stylesheet" href="{{asset('assets/css/sweetalert2.min.css')}}">
    <!-- endinject -->
    <link rel="shortcut icon" href="{{asset('assets/images/favicon.ico')}}"/>

</head>
<body>


@yield('main')

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="{{asset('assets/js/sweetalert2.all.min.js')}}"></script>
<script src="{{asset('assets/vendors/js/vendor.bundle.base.js')}}"></script>

<script src="{{asset('assets/vendors/chart.js/chart.umd.js')}}"></script>
<script src="{{asset('assets/js/jquery.cookie.js')}}"></script>

<script src="{{asset('assets/js/off-canvas.js')}}"></script>
<script src="{{asset('assets/js/hoverable-collapse.js')}}"></script>
<script src="{{asset('assets/js/template.js')}}"></script>
<script src="{{asset('assets/js/settings.js')}}"></script>
<script src="{{asset('assets/js/todolist.js')}}"></script>

<script src="{{asset('assets/js/dashboard.js')}}"></script>

@yield('script')
<script>

    function showErrors(errors) {
        $('.form-control').removeClass('is-invalid');
        $('.invalid-feedback').remove();
        $.each(errors, function (key, errorMessages) {
            var inputElement = $('#' + key);
            inputElement.addClass('is-invalid');
            var errorDiv = $('<div class="invalid-feedback"></div>').text(errorMessages[0]);
            inputElement.after(errorDiv);
        });
        if ($.isEmptyObject(errors)) {
            Swal.fire({
                text: "Validation Error",
                icon: "question"
            });
        }
    }

</script>


</body>

</html>

