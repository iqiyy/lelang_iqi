<!DOCTYPE html>
<html lang="en">

<head>
    <?php $this->load->view('backend/__partials/header'); ?>
</head>

<body>

    <div class="main">


        <!-- Sing up  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <!-- <div class="signin-image">
                        <figure><img src="../../assets/pot/monter.jpg" alt="sing up image"></figure>

                    </div> -->

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="nik"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="nik" id="nik" placeholder="Your Nik" />
                            </div>
                            <div class="form-group">
                                <label for="nama"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="nama" id="nama" placeholder="Your Name" />
                            </div>
                            <div class="form-group">
                                <label for="nip"><i class="zmdi zmdi-lock"></i></label>
                                <select name="jk" id="jk" class="form-control" required>
                                    <option value="Laki-laki">Laki-laki</option>
                                    <option value="Perempuan">Perempuan</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-lock"></i></label>
                                <input type="email" name="email" id="email" placeholder="Email" />
                            </div>
                            <div class="form-group">
                                <label for="no_kontak"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="no_hp" id="no_hp" placeholder="no_kontak" />
                            </div>
                            <div class="form-group">
                                <input type="level" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="level" class="label-agree-term"><span><span></span></span></label>
                                <select name="level" id="level" class="zmdi zmdi-lock" required>
                                    <option value="Petugas">Petugas</option>
                                    <option value="Admin">Admin</option>
                                </select>
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

                    </div>
                </div>
            </div>
        </section>

    </div>


    <?php $this->load->view('backend/__partials/footer'); ?>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>