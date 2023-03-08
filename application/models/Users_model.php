<?php
defined('BASEPATH') or exit ('no direct script acces allowed');
class Users_model extends CI_Model
{
    private $_table = 'users';
    public function rules()
    {
        return [
            [
                'field' => 'username',  
                'label' => 'username',  
                'rules' => 'trim|required' 
            ],
            [
                'field' => 'password',
                'label' => 'password',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'email',  
                'label' => 'email',  
                'rules' => 'trim|required' 
            ],
            [
                'field' => 'no_kontak',
                'label' => 'no_kontak',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'nip',
                'label' => 'nip',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'nama',
                'label' => 'nama',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'level',
                'label' => 'level',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'status',
                'label' => 'status',
                'rules' => 'trim|required'
            ],
        ];
    }
   
    public function get_all() //Menampilkan list semua data users
    {
        $query = $this ->db->get_where($this->_table); //data diambil dari table users
        return $query->result();
    }
        public function delete($id)
    {
        return $this->db->delete($this->_table, array("id_user" => $id));
    }
    public function save(){
        {
            $data = array(
                "username" => $this->input->post('username'),
                "password" => $this->input->post('password'),
                "email" => $this->input->post('email'),
                "no_kontak" => $this->input->post('no_kontak'),
                "nip" => $this->input->post('nip'),
                "nama" => $this->input->post('nama'),
                "password" => password_hash($this->input->post('password'),PASSWORD_DEFAULT),
                "level" => $this->input->post('level'),
                "status" => $this->input->post('status')
            );
            return $this->db->insert($this->_table, $data);
        }
    
    }
     public function insert($user)
    {
        $this->db->insert($this->_table, $user);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
    public function find($id_user)
	{
		if (!$id_user) {
			return;
		}

		$query = $this->db->get_where($this->_table, array('id_user' => $id_user));
		return $query->row();
	}

    public function update($users)
	{
		if (!isset($users['id_user'])) {
			return;
		}

		return $this->db->update($this->_table, $users, ['id_user' => $users['id_user']]);
	}
    public function block($users)
	{
		if (!isset($users['id_user'])) {
			return;
		}

		return $this->db->update($this->_table, $users, ['id_user' => $users['id_user']]);
        
	}
    public function unblock($users)
	{
		if (!isset($users['id_user'])) {
			return;
		}

		return $this->db->update($this->_table, $users, ['id_user' => $users['id_user']]);
        
	}
    public function get_by_id($id_user)
    {
        $query = $this->db->get_where($this->_table, array('id_user' => $id_user));
        return $query->row();
    }
    public function verify($username, $password)
    {
        $this->db->where('username', $username);
        $query = $this->db->get($this->_table);
        $user = $query->row();
        if (!password_verify($password, $user->password)) {
            return FALSE;
        }
        return true;
    }
     public function get_by_user($username)
    {
        $query = $this->db->get_where($this->_table, array('username' => $username));
        return $query;
    }
}