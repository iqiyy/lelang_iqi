<!DOCTYPE html>
<html lang="en">

<head>
    <?php $this->load->view('backend/__partials/header'); ?>
</head>

<body>

    <div class="main">

        <?php $this->load->view('backend/_partials/sidenav') ?>
        <!-- Sing up  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="../../assets/pot/monter.jpeg" alt="sing up image"></figure>

                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="nama"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="nama" id="nama" placeholder="Your Name" />
                            </div>
                            <div class="form-group">
                                <label for="nip"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="nip" id="nip" placeholder="Nip" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-lock"></i></label>
                                <input type="email" name="email" id="email" placeholder="Email" />
                            </div>
                            <div class="form-group">
                                <label for="no_kontak"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="no_kontak" id="no_kontak" placeholder="no_kontak" />
                            </div>
                            <div class="form-group">
                                <label for="level" class="label-agree-term">
                                    <select name="level" id="level" class="zmdi zmdi-lock">
                                        <option value="Petugas">Petugas</option>
                                        <option value="Admin">Admin</option>
                                    </select>
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" placeholder="username" />
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="Password" />
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="sign up" />
                            </div>

                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>


    <?php $this->load->view('backend/__partials/footer'); ?>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>