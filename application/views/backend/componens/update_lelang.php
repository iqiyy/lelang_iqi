<!DOCTYPE html>
<html lang="en">

<head>
    <?php $this->load->view('backend/_partials/header') ?>
</head>

<body>
    <main class="main">
        <?php $this->load->view('backend/_partials/sidenav') ?>

        <div class="content">
            <div class="container my-4 col-6">
                <div class="container">
                    <div class="card">
                        <div class="card-header bg-dark text-white">
                            <h5>Edit Lelang</h5>
                        </div>
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label for="id_barang">Barang Lelang</label>
                                    <input type="text" name="barang" id="barang" value="<?= $barang->nama_barang ?>"
                                        class="form-control" readonly>
                                    </input>
                                </div>

                                <div class="form-group">
                                    <label for="id_barang">Harga Awal Lelang</label>
                                    <input type="text" name="harga_awal" id="harga_awal"
                                        value="IDR <?= number_format($lelang->harga_awal, 2) ?> " class="form-control"
                                        readonly>
                                    </input>
                                </div>
                                <div class="form-group">
                                    <label for="tgl_mulai">Tanggal Mulai</label>
                                    <input type="date" required class="form-control datepicker" id="tgl_mulai"
                                        name="tgl_mulai" value="<?= $lelang->tgl_mulai ?>" />
                                </div>
                                <div class="form-group">
                                    <label for="tgl_akhir">Tanggal Selesai</label>
                                    <input type="date" required class="form-control datepicker" id="tgl_akhir"
                                        name="tgl_akhir" value="<?= $lelang->tgl_akhir ?>" />
                                </div>
                                <div class="float-right">
                                    <a href="<?= site_url('backend/lelang'); ?>" class="btn btn-secondary">
                                        <i href="#" class="fa-solid fa-backward"></i> Kembali
                                    </a>
                                    <button type="submit" id="save" value="save" class="btn btn-warning"><i
                                            class="fa-regular fa-floppy-disk"></i> Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <?php $this->load->view('backend/_partials/footer') ?>
        </div>
    </main>
</body>

</html>


<!-- Quill JS -->

<?php if ($this->session->flashdata('message')) : ?>
<script>
const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
})

Toast.fire({
    icon: 'success',
    title: '<?= $this->session->flashdata('message') ?>'
})
</script>
<?php endif ?>