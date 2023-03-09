<!DOCTYPE html>
<html lang="en">

<head>
    <?php $this->load->view('backend/__partials/header'); ?>
</head>

<body>

    <div class="main">

        <!-- Sign in form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <?php if($this->session->flashdata('message_login_error')): ?>
                    <div class="invalid-feedback">
                        <?= $this->session->flashdata('message_login_error') ?>
                    </div>
                    <?php endif ?>
                    <div class="signup-form">
                        <h2 class="form-title">Sign in</h2>
                        <form method="POST" class="register-form" id="register-form">

                            <div class="form-group">
                                <input type="text" name="username"
                                    class="<?= form_error('username') ? 'invalid' : '' ?>"
                                    placeholder="Your username or email" value="<?= set_value('username') ?>"
                                    required />
                                <div class="invalid-feedback">
                                    <?= form_error('username') ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password"
                                    class="<?= form_error('password') ? 'invalid' : '' ?>"
                                    placeholder="Enter your password" value="<?= set_value('password') ?>" required />
                                <div class="invalid-feedback">
                                    <?= form_error('password') ?>
                                </div>
                            </div>


                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Login" />
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="../../assets/images/daun.png" alt="sing up image"></figure>

                    </div>
                </div>
            </div>
        </section>


        <?php $this->load->view('backend/__partials/footer'); ?>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>