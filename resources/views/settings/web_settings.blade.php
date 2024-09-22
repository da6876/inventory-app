@section('title',"Web Settings")
@extends('layout.app')
@section('main')
    <div class="content-wrapper">

        <div class="row">
            <div class="col-md-12">
                <h5 class="mb-2 text-titlecase mb-4">Settings</h5>
                <div class="col-xl-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="nav-align-top nav-tabs-shadow mb-6">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                                                data-bs-target="#navs-top-home" aria-controls="navs-top-home"
                                                aria-selected="true">Account
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                                data-bs-target="#navs-top-profile" aria-controls="navs-top-profile"
                                                aria-selected="false" tabindex="-1">Change Password
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                                data-bs-target="#navs-top-messages" aria-controls="navs-top-messages"
                                                aria-selected="false" tabindex="-1">Notifications
                                        </button>
                                    </li>
                                </ul>
                                @php
                                    $userEmail = auth()->user()->email;
                                @endphp
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="navs-top-home" role="tabpanel">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Update You Profile</h4>
                                                <form class="forms-sample">@csrf
                                                    <input type="hidden" name="id" id="id"
                                                           value="{{auth()->user()->uid}}">
                                                    <div class="form-group">
                                                        <label for="exampleInputName1">Name</label>
                                                        <input type="text" class="form-control"
                                                               id="name" name="name" placeholder="Name"
                                                               value="{{auth()->user()->name}}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="username">Email</label>
                                                        <input type="text" class="form-control"
                                                               id="username" name="username" placeholder="email"
                                                               value="{{$userEmail}}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>File upload</label>
                                                        <div class="input-group col-xs-12">
                                                            <input type="file" class="form-control file-upload-info"
                                                                   placeholder="Upload Image">
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary me-2">Update
                                                    </button>
                                                    <button class="btn btn-light">Cancel</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Update Your Password</h4>
                                                <form class="forms-sample">@csrf
                                                    <input type="hidden" name="id" id="id"
                                                           value="{{auth()->user()->uid}}">
                                                    <div class="row g-2">
                                                        <div class="col mb-1">
                                                            <label for="email">Email</label>
                                                            <input type="text" class="form-control" id="email"
                                                                   name="email" placeholder="Email"
                                                                   value="{{$userEmail}}">
                                                        </div>
                                                        <div class="col mb-1">
                                                            <label for="oldPassword">Old Password</label>
                                                            <input type="password" class="form-control" id="oldPassword"
                                                                   name="oldPassword" placeholder="Old Password">
                                                        </div>
                                                    </div>
                                                    <div class="row g-2">
                                                        <div class="col mb-1">
                                                            <label for="newPassword">New Password</label>
                                                            <input type="password" class="form-control" id="newPassword"
                                                                   name="newPassword" placeholder="New Password">
                                                            <small id="passwordHelp" class="form-text text-muted">
                                                                Password must be at least 8 characters long, include
                                                                uppercase and lowercase letters, a number, and a special
                                                                character.
                                                            </small>
                                                            <div class="progress mt-2">
                                                                <div id="passwordStrengthBar" class="progress-bar"
                                                                     role="progressbar" style="width: 0%;"
                                                                     aria-valuenow="0" aria-valuemin="0"
                                                                     aria-valuemax="100">Weak
                                                                </div>
                                                            </div>
                                                            <div id="passwordStrengthMessage" class="text-muted mt-2">
                                                                Password Strength: Weak
                                                            </div>
                                                        </div>
                                                        <div class="col mb-1">
                                                            <label for="confirmPassword">Confirm Password</label>
                                                            <input type="password" class="form-control"
                                                                   id="confirmPassword" name="confirmPassword"
                                                                   placeholder="Confirm Password">
                                                            <div id="passwordMatchMessage" class="text-danger"
                                                                 style="display: none;">
                                                                Passwords do not match.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row g-2" id="progress">
                                                        <div class="col mb-1">
                                                        </div>
                                                        <div class="col mb-1">
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary me-2">Update</button>
                                                    <button type="button" class="btn btn-light"
                                                            onclick="window.location.href='/previous-page-url'">Cancel
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="navs-top-messages" role="tabpanel">
                                        <div class="card">
                                            <div class="card-body">
                                                <p>
                                                    Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly
                                                    beans
                                                    macaroon gummies cupcake gummi
                                                    bears
                                                    cake chocolate.
                                                </p>
                                                <p class="mb-0">
                                                    Cake chocolate bar cotton candy apple pie tootsie roll ice cream
                                                    apple pie
                                                    brownie cake. Sweet roll icing
                                                    sesame snaps caramels danish toffee. Brownie biscuit dessert
                                                    dessert.
                                                    Pudding jelly jelly-o tart brownie
                                                    jelly.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
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
        document.addEventListener('DOMContentLoaded', function () {
            const newPasswordInput = document.getElementById('newPassword');
            const confirmPasswordInput = document.getElementById('confirmPassword');
            const passwordStrengthBar = document.getElementById('passwordStrengthBar');
            const passwordStrengthMessage = document.getElementById('passwordStrengthMessage');
            const passwordMatchMessage = document.getElementById('passwordMatchMessage');

            function evaluatePasswordStrength(password) {
                let strength = 0;
                const lengthCriteria = /(?=.{8,})/;
                const uppercaseCriteria = /(?=.*[A-Z])/;
                const lowercaseCriteria = /(?=.*[a-z])/;
                const numberCriteria = /(?=.*\d)/;
                const specialCharCriteria = /(?=.*[@$!%*?&])/;

                if (lengthCriteria.test(password)) strength += 25;
                if (uppercaseCriteria.test(password)) strength += 25;
                if (lowercaseCriteria.test(password)) strength += 25;
                if (numberCriteria.test(password)) strength += 25;
                if (specialCharCriteria.test(password)) strength += 25;

                return strength;
            }

            function updatePasswordStrength() {
                const password = newPasswordInput.value;
                const strength = evaluatePasswordStrength(password);

                let strengthLabel = 'Weak';
                let strengthClass = 'bg-danger';

                if (strength === 100) {
                    strengthLabel = 'Strong';
                    strengthClass = 'bg-success';
                } else if (strength >= 75) {
                    strengthLabel = 'Good';
                    strengthClass = 'bg-warning';
                } else if (strength >= 50) {
                    strengthLabel = 'Fair';
                    strengthClass = 'bg-info';
                }

                passwordStrengthBar.style.width = strength + '%';
                passwordStrengthBar.className = 'progress-bar ' + strengthClass;
                passwordStrengthBar.setAttribute('aria-valuenow', strength);
                passwordStrengthMessage.textContent = 'Password Strength: ' + strengthLabel;
            }

            function checkPasswordMatch() {
                const newPassword = newPasswordInput.value;
                const confirmPassword = confirmPasswordInput.value;

                if (newPassword && confirmPassword && newPassword !== confirmPassword) {
                    passwordMatchMessage.style.display = 'block';
                } else {
                    passwordMatchMessage.style.display = 'none';
                }
            }

            newPasswordInput.addEventListener('input', updatePasswordStrength);
            confirmPasswordInput.addEventListener('input', checkPasswordMatch);
        });
    </script>
@endsection
