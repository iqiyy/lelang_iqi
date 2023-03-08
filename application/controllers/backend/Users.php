<?php

class Users extends CI_Controller
{
    public function __construct()
	{
		parent::__construct();
		$this->load->model('Users_model');
		$this->load->model('auth_model');
		if(!$this->auth_model->current_user()){
			redirect('backend/auth/login');
		}
	}
	
   public function index()
    {
        $data['activeUser'] = $this->auth_model->current_user();
        if ($data['activeUser']->level == 'Admin') {
            $data['users'] = $this->Users_model->get_all();
        } else {
            $data['users'] = $this->Users_model->get_by_user($data['activeUser']->username)->result();;
        }
        $data['title'] = 'List Data User';
        $this->load->view('backend/list_users', $data);
    }
	public function delete($id = null)
	{
		$data['activeUser'] = $this->auth_model->current_user(); //menampilkan level
        $this->Users_model->delete($id);
		redirect("backend/Users");
		 $this->session->set_flashdata('message','Data berhasil dihapus');
        redirect("backend/Users") ;
	}
	public function new()
    {
        $data['activeUser'] = $this->auth_model->current_user();
        if ($data['activeUser']->level <> 'Admin') {
            show_404();
        }
        if ($this->input->method() === 'post') {
            $username = $this->input->post('username');
            $is_exists = $this->Users_model->get_by_user($username)->row();
            if ($is_exists) {
                $this->session->set_flashdata('message', 'Username sudah terdaftar sebelumnya!');
            } else {
                $users = [
                    'username'  => $this->input->post('username'),
                    'password'  => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
                    'nip'       => $this->input->post('nip'),
                    'nama'      => $this->input->post('nama'),
                    'email'     => $this->input->post('email'),
                    'no_kontak' => $this->input->post('no_kontak'),
                    'level'     => $this->input->post('level')
                ];
                $saved = $this->Users_model->insert($users);
                if ($saved) {
                    $this->session->set_flashdata('message', 'Data berhasil disimpan!');
                    return redirect('backend/users');
                }
            }
        }
        $this->load->view('backend/componens/add_users', $data);
    }
	public function update($id = null)
	{
		$data['activeUser'] = $this->auth_model->current_user(); //menampilkan level
		$data['users'] = $this->Users_model->find($id);

		if (!$data['users'] || !$id) {
			show_404();
		}

		if ($this->input->method() === 'post') {
			// TODO: lakukan validasi data seblum simpan ke model
			$user = [
				'id_user' => $id,
				'username' => $this->input->post('username'),
				'email' => $this->input->post('email'),
				'no_kontak' => $this->input->post('no_kontak'),
				'nip' => $this->input->post('nip'),
				'nama' => $this->input->post('nama'),
				'level' => $this->input->post('level'),
				'status' => $this->input->post('status')
				

					
			];
			$updated = $this->Users_model->update($user);
			if ($updated) {
				$this->session->set_flashdata('message', 'User was updated');
				redirect('backend/users');
			}
		}

		$this->load->view('backend/componens/update_user', $data);
	}
	public function block($id = null)
	{
		$data['activeUser'] = $this->auth_model->current_user(); //menampilkan level

		
			// TODO: lakukan validasi data seblum simpan ke model
			$user = [
				'id_user' => $id,
				'status' => 0
			];
			$updated = $this->Users_model->block($user);
			if ($updated) {
				$this->session->set_flashdata('message', 'User was updated');
				redirect('backend/users');
			}
	}
	public function unblock($id = null)
	{
		$data['activeUser'] = $this->auth_model->current_user(); //menampilkan level

		
			// TODO: lakukan validasi data seblum simpan ke model
			$user = [
				'id_user' => $id,
				'status' => 1
			];
			$updated = $this->Users_model->unblock($user);
			if ($updated) {
				$this->session->set_flashdata('message', 'User was updated');
				redirect('backend/users');
			}
	}
	 public function change($id_user = null)
    {
        $data['activeUser'] = $this->auth_model->current_user();
        $data['user'] = $this->Users_model->get_by_id($id_user);
        if ($data['activeUser']->level <> 'Admin' && $data['activeUser']->username <> $data['user']->username) {
            show_404();
        }
        if ($this->input->method() === 'post') {
            $current = $this->input->post('current');
            $verify = $this->Users_model->verify($data['user']->username, $current);
            if (!$verify) {
                $this->session->set_flashdata('message', 'Current password salah!');
            } else {
                $user = [
                    'id_user'   => $id_user,
                    'password'  => password_hash($this->input->post('password'), PASSWORD_DEFAULT)
                ];
                $update = $this->Users_model->update($user);
                if ($update) {
                    $this->session->set_flashdata('message', 'Password berhasil diubah!');
                    if ($data['activeUser']->username == $data['user']->username) {
                        $this->auth_model->logout();
                        redirect('backend');
                    }
                    redirect('backend/users');
                } else {
                    $this->session->set_flashdata('message', 'Password gagal diubah!');
                }
            }
        }
        $this->load->view('backend/componens/change_password', $data);
    }
}
	