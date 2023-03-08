<aside class="side-nav">
    <div class="brand">
        <img src="<?=base_url('assets/images/daun.png')?>" width="170px" height="135px" alt="">
    </div>
    <nav>
        <a href="<?= site_url('backend/dashboard')?>">Dashboard</a>

        <?php  if($activeUser->level == "Admin") : ?>
        <a href="<?= site_url('backend/Masyarakat')?>">Masyarakat</a>
        <a href="<?= site_url('backend/Users')?>">users</a>
        <?php endif ?>

        <?php  if($activeUser->level == "Petugas") : ?>
        <a href="<?= site_url('backend/Barang')?>">Kelola barang</a>
        <a href="<?= site_url('backend/Lelang')?>">Lelang</a>
        <a href="<?= site_url('backend/Penawaran')?>">Penawaran</a>
        <a href="<?= site_url('backend/Laporan')?>">Laporan</a>
        <?php endif ?>

        <a href="<?= site_url('backend/auth/logout')?>">logout</a>
    </nav>
</aside>