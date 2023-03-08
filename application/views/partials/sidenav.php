 <nav class="navbar navbar-expand-lg navbar-dark bg-primary p-2">



     <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <div class="container-fluid">
             <div class="row text-right">

                 <div class="col-sm-12">

                     <ul class="navbar-nav">

                         <div class="btn-group navbar-right">
                             <a class="btn btn-info btn-sm" role="button" href="<?= site_url() ?>">
                                 <i class="fa-solid fa-house"></i>
                                 <small>Home</small>
                             </a>
                             <?php if ($activeUser) : ?>
                             <a class="btn btn-info btn-sm" role="button" href="<?= site_url('page/penawaran') ?>">
                                 <i class="fa-solid fa-clock-rotate-left"></i>
                                 <small>Riwayat</small>
                             </a>
                             <a class="btn btn-info btn-sm" role="button" href="<?= site_url('page/lelang') ?>">
                                 <i class="fa-solid fa-trophy"></i>
                                 <small>Lelang</small>
                             </a>
                             <a class="btn btn-info btn-sm" role="button" href="<?= site_url('page/edit') ?>">
                                 <i class="fa-solid fa-user"></i>
                                 <small>Hi, <?= $activeUser->nama; ?></small>
                             </a>
                             <a class="btn btn-info btn-sm" title="Change Password" role="button"
                                 href="<?= site_url('page/change') ?>">
                                 <i class="fa-solid fa-lock"></i>
                             </a>
                             <a class="btn btn-info btn-sm" title="Logout" role="button"
                                 href="<?= site_url('page/logout') ?>">
                                 <i class="fa-solid fa-right-from-bracket"></i>
                             </a>
                             <?php endif ?>
                             <?php if (!$activeUser) : ?>
                             <a class="btn btn-dark" role="button" href="<?= site_url('page/login') ?>">
                                 <small><strong>Sign In</strong></small>
                             </a>
                             <a class="btn btn-warning" role="button" href="<?= site_url('page/register') ?>">
                                 <small><strong>Register</strong></small>
                             </a>
                             <?php endif ?>
                         </div>
                         <!-- <form method="post" action="<?= site_url('page/cari') ?>">
                             <div class="col-md-1 col-xs-2 text-right hidden-xs menu-6">
                                 <ul>
                                     <li class="search">
                                         <div class="input-group">
                                             <input type="text" placeholder="cari di lelang plant">
                                             <span class="input-group-btn">
                                                 <button class="btn btn-primary" type="button"><i
                                                         class="icon-search"></i></button>
                                             </span>
                                         </div>
                                     </li>
                                 </ul>
                             </div>
                         </form> -->
                         <form method="post" action="<?= site_url('page/cari') ?>">
                             <div class="input-group">
                                 <input type="text" class="form-control" placeholder="Cari" aria-label="Cari" id="cari"
                                     name="cari" aria-describedby="button-addon2">
                                 <div class="input-group-append">
                                     <!-- <i class="fa-solid fa-magnifying-glass"></i> -->
                                     <input type="submit" class="btn btn-info" id="search" value="Cari">
                                 </div>
                             </div>
                         </form>
                     </ul>
                 </div>
             </div>

         </div>
 </nav>