<!DOCTYPE html>
<html lang="en">
<?php $this->load->view('partials/header'); ?>
<?php $this->load->view('partials/sidenav'); ?>


<aside id="fh5co-hero" class="js-fullheight">
    <div class="flexslider js-fullheight">
        <ul class="slides">
            <li style="background-image: url(assets/pot/pot.JPG);">
                <div class="overlay-gradient"></div>
                <div class="container">
                    <div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
                        <div class="slider-text-inner">
                            <div class="desc">
                                <span class="price">$800</span>
                                <h2>Alato Cabinet</h2>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and
                                    Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                <p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li style="background-image: url(assets/pot/sekulen.jpg);">
                <div class="container">
                    <div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
                        <div class="slider-text-inner">
                            <div class="desc">
                                <span class="price">$530</span>
                                <h2>The Haluz Rocking Chair</h2>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and
                                    Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                <p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li style="background-image: url(assets/pot/room.jpg);">
                <div class="container">
                    <div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
                        <div class="slider-text-inner">
                            <div class="desc">
                                <span class="price">$750</span>
                                <h2>Alato Cabinet</h2>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and
                                    Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                <p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li style="background-image: url(assets/pot/daun.jpg);">
                <div class="container">
                    <div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
                        <div class="slider-text-inner">
                            <div class="desc">
                                <span class="price">$540</span>
                                <h2>The WW Chair</h2>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and
                                    Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                <p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</aside>


<div id="fh5co-product">
    <div class="container">
        <div class="row animate-box">
            <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                <span>Cool Stuff</span>
                <h2>Products.</h2>
                <p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit
                    ab aliquam dolor eius.</p>
            </div>
        </div>
        <?php foreach($lelang as $s) :?>
        <div class="col-md-4 text-center animate-box">
            <div class="product">
                <div class="product-grid" src="" width="100px"
                    style="background-image:url(<?=base_url('upload/barang/' .$s->gambar)?>);">
                    <div class="inner">
                        <span class="sale">Sale</span>
                        <p>
                            <a href="<?= site_url('page/detail_lelang/' . $s->id_lelang) ?>" class="icon"><i
                                    class="icon-shopping-cart"></i></a>
                            <a href="<?= site_url('page/detail_lelang/' . $s->id_lelang) ?>" class="icon"><i
                                    class="icon-eye"></i></a>
                        </p>
                    </div>
                </div>
                <div class="desc">
                    <h3><a href="single.html"><?= $s->nama_barang?></a></h3>
                    <span class="price">open in <b><?= $s->harga_awal?></b></span>
                </div>
                <div class="card-body">
                    <a class="btn btn-info" role="button" href="<?= site_url('page/detail_lelang/' . $s->id_lelang) ?>">
                        <small>Detail</small>
                    </a>
                </div>
            </div>
        </div>
        <?php endforeach ?>

        <main>
            <?php $this->load->view('partials/footer'); ?>
        </main>

</html>