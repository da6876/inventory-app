@section('title',"Login")
@extends('layout.public')
@section('main')

<!-- page-body-wrapper start -->
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth px-0">
            <div class="row w-100 mx-0">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left py-5 px-4 px-sm-5 UserLogin">
                        <div class="brand-logo">
                            <img src="{{asset('assets/images/logo-dark.svg')}}" alt="logo"/>
                        </div>
                        <h4>Hello! let's get started</h4>
                        <h6 class="font-weight-light">Sign in to continue.</h6>
                        <form id="loginForm" class="pt-3">@csrf
                            <input type="hidden" name="longitude" id="longitudeInput">
                            <input type="hidden" name="latitude" id="latitudeInput">
                            <input type="hidden" name="ip" id="ip">
                            <div class="form-group">
                                <input type="email" name="username" class="form-control form-control-lg" id="username" placeholder="Username" required>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control form-control-lg" id="password" placeholder="Password" required>
                                <div class="invalid-feedback"></div>
                            </div>
                            <div class="mt-3 text-center">
                                <button type="button" onclick="loginNow()" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN IN</button>
                            </div>
                            <div class="my-2 d-flex justify-content-between align-items-center">
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input type="checkbox" name="remember" class="form-check-input">
                                        Keep me signed in
                                    </label>
                                </div>
                                <a href="#" class="auth-link text-black">Forgot password?</a>
                            </div>
                            <div class="text-center mt-4 font-weight-light">
                                Don't have an account? <a href="register.html" class="text-primary">Create</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- page-body-wrapper ends -->

@endsection
@section('script')
<script>
    fetch('https://api.ipify.org?format=json')
    .then(response => response.json())
    .then(data => {
        document.getElementById('ip').value = data.ip;
    });
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            document.getElementById('latitudeInput').value = latitude;
            document.getElementById('longitudeInput').value = longitude;
        }, function(error) {
            console.error('Error obtaining location: ', error);
        });
    } else {
        console.error('Geolocation is not supported by this browser.');
    }
    function loginNow() {
        url = "{{ url('loginPost') }}";
        var formData = new FormData($(".UserLogin form")[0]);
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                if (data.statusCode == 200) {
                    window.location.href = data.route;
                    $('.UserLogin form')[0].reset();
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



</script>
@endsection
