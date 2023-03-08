<!DOCTYPE html>
<html lang="en">

<head>
    <?php $this->load->view('backend/_partials/header'); ?>
</head>

<body>
    <div class="container">
        <h1>Login</h1>
        <p>Masuk ke Dashboard</p>

        <?php if($this->session->flashdata('message_login_error')): ?>
        <div class="invalid-feedback">
            <?= $this->session->flashdata('message_login_error') ?>
        </div>
        <?php endif ?>

        <form action="" method="post" style="max-width: 600px;">
            <div>
                <label for="name">Email/Username*</label>
                <input type="text" name="email" class="<?= form_error('email') ? 'invalid' : '' ?>"
                    placeholder="Your username or email" value="<?= set_value('email') ?>" required />
                <div class="invalid-feedback">
                    <?= form_error('email') ?>
                </div>
            </div>
            <div>
                <label for="password">Password*</label>
                <input type="password" name="password" class="<?= form_error('password') ? 'invalid' : '' ?>"
                    placeholder="Enter your password" value="<?= set_value('password') ?>" required />
                <div class="invalid-feedback">
                    <?= form_error('password') ?>
                </div>
            </div>

            <div>
                <input type="submit" class="button button-primary" value="Login">
            </div>
        </form>
    </div>
    <?php $this->load->view('backend/_partials/footer'); ?>
</body>

</html>