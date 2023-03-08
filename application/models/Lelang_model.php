<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Lelang_model extends CI_Model
{
    private $_table = 'lelang',
        $_vDetailLelang = 'detail_lelang',
        $_vLelangBerlangsung = 'lelang_berlangsung',
        $_vPemenangLelang = 'pemenang_lelang',
        $max_penawaran = 'max_penawaran';

    public function get_lelang()
    {
        $query = $this->db->get_where($this->_vDetailLelang);
        return $query->result();
    }

    public function get_by_id($id_lelang)
    {
        $query = $this->db->get_where($this->_table, array('id_lelang' => $id_lelang));
        return $query;
    }

    public function get_lelangBerlangsung()
    {
        $query = $this->db->get_where($this->_vLelangBerlangsung);
        return $query->result();
    }

    public function search($keyword)
    {
        if (!$keyword) {
            return null;
        }
        $this->db->like('nama_barang', $keyword);
        $query = $this->db->get($this->_vLelangBerlangsung);
        return $query->result();
    }
    

    public function berlangsung_by_id($id_lelang)
    {
        $query = $this->db->get_where($this->_vLelangBerlangsung, array('id_lelang' => $id_lelang));
        return $query;
    }

    public function get_pemenangLelangDash()
    {
        $query = $this->db->get_where($this->_vPemenangLelang, array('status' => 'Unconfirmed'));
        return $query->result();
    }
    public function get_pemenangLelang()
    {
        $query = $this->db->get_where($this->_vPemenangLelang);
        return $query->result();
    }


    public function get_pemenang($id_masyarakat)
    {
        $this->db->order_by('tgl_akhir', 'desc');
        $query = $this->db->get_where($this->_vPemenangLelang, array('id_masyarakat' => $id_masyarakat));
        return $query->result();
    }

    public function getall_pemenangLelang()
    {
        $query = $this->db->get_where($this->_vPemenangLelang);
        return $query->result();
    }

    public function insert($lelang)
    {
        $this->db->insert($this->_table, $lelang);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }

    public function update($lelang)
    {
        if (!isset($lelang['id_lelang'])) {
            return;
        }
        return $this->db->update($this->_table, $lelang, ['id_lelang' => $lelang['id_lelang']]);
    }
    public function get_status_open()
    {

        $query = $this->db->get_where($this->_vDetailLelang, array('status' => 'open'));
        return $query->result();
    }
}