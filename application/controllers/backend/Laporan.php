<?php

class Laporan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('lelang_model');
		$this->load->model('auth_model');
		if (!$this->auth_model->current_user()) {
			redirect('backend/auth/login');
		}
	}

	public function index()
	{
		$data['title'] = 'List Data Lelang';
		$data['activeUser'] = $this->auth_model->current_user(); //menampilkan level
		$data['laporan'] = $this->lelang_model->getall_pemenanglelang(); //menampilkan data

		$this->load->view('backend/list_laporan', $data);

	}
	 public function get_pemenang_Lelang($id_lelang)
    {
        $query = $this->db->get_where($this->_view, array('id_lelang' => $id_lelang));
		return $query;
    }

}