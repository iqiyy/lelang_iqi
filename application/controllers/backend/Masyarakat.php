<?php

class Masyarakat extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('masyarakat_model');
        $this->load->model('auth_model');
        if (!$this->auth_model->current_user()) {
            redirect('backend/auth/login');
        }
    }

    public function index()
    {
        $data['activeUser'] = $this->auth_model->current_user();
        if ($data['activeUser']->level <> 'Admin') {
            show_404();
        }
        $data['title'] = 'List Data Masyarakat';
        $data['masyarakat'] = $this->masyarakat_model->get_all();
        $this->load->view('backend/list_masyarakat', $data);
    }

    public function block($id_masyarakat = null)
    {
        $data['activeUser'] = $this->auth_model->current_user();
        if ($data['activeUser']->level <> 'Admin') {
            show_404();
        }
        $data['masyarakat'] = $this->masyarakat_model->get_by_id($id_masyarakat);
        if (!$data['masyarakat'] || !$id_masyarakat) {
            show_404();
        }
        $masyarakat = [
            'id_masyarakat' => $id_masyarakat,
            'update_by' => $data['activeUser']->id_user,
            'update_date' => date('Y-m-d H:i:s'),
            'status' => 0
        ];
        $update = $this->masyarakat_model->update($masyarakat);
        if ($update) {
            $this->session->set_flashdata('message', 'Data berhasil diblokir!');
        } else {
            $this->session->set_flashdata('message', 'Data gagal diblokir!');
        }
        redirect('backend/masyarakat');
    }
}