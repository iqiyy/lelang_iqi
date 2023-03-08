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
                            <h5>Ubah Data Barang</h5>
                            <?php if (isset($error)) : ?>
                            <div class="invalid-feedback"><?= $error ?></div>
                            <?php endif; ?>
                        </div>
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="tipe_kamar"><strong>Nama Barang</strong></label>
                                    <input type="text" value="<?= $barang->nama_barang ?>" class="form-control"
                                        name="nama_barang" required maxlength="200" />

                                </div>
                                <div class="form-group">
                                    <label for="deskripsi"><strong>Deskripsi Barang</strong></label>
                                    <input type="hidden" class="form-control" name="deskripsi"
                                        value="<?= html_escape($barang->deskripsi) ?>" />
                                    <div id="editor" class="form-control" style="min-height: 160px;">
                                        <?= $barang->deskripsi ?></div>
                                </div>
                                <div class="form-group">
                                    <label for="harga_awal"><strong>Harga Awal</strong></label>
                                    <input type="number" value="<?= $barang->harga_awal ?>" min=1 max=1000000000
                                        class="form-control" name="harga_awal" required />
                                </div>
                                <img src="<?= empty($barang->gambar) ? base_url('assets/images/no_image.png')  : base_url('upload/barang/' . $barang->gambar) ?>"
                                    class="img-thumbnail my-1" style="width: 120px;">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><strong>Gambar Utama</strong></span>
                                    </div>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="gambar" name="gambar">
                                        <label class="custom-file-label" for="gambar">Choose file</label>
                                    </div>
                                </div>

                                <div class="float-right">
                                    <a href="<?= site_url('backend/barang'); ?>" class="btn btn-secondary">
                                        <i href="#" class="fa-solid fa-backward"></i> Kembali
                                    </a>
                                    <button type="submit" id="save" value="save" class="btn btn-warning"><i
                                            class="fa-regular fa-floppy-disk"></i> Simpan</button>
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
<script>
var quill = new Quill('#editor', {
    theme: 'snow'
});
quill.on('text-change', function(delta, oldDelta, source) {
    document.querySelector("input[name='deskripsi']").value = quill.root.innerHTML;
});
</script>

<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>