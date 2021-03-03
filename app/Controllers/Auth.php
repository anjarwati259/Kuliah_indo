<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\ModelAuth;

class Auth extends BaseController
{
	public function __construct()
	{
		$this->ModelAuth = new ModelAuth();
		helper('form');
	}
	public function index()
	{
	}
	public function login_admin()
	{
		echo view('v_login-admin');
	}
	//cek login user
	public function cek_login_admin()
	{
		if ($this->validate([
			'username' => [
				'label' => 'Username',
				'rules' => 'required',
				'errors' => [
					'required' => '{field} Wajib Diisi !!',
				]
			],
			'password' => [
				'label' => 'Password',
				'rules' => 'required',
				'errors' => [
					'required' => '{field} Wajib Diisi !!',
				]
			]
		])) {
			//valid
			$username = $this->request->getPost('username');
			$password = $this->request->getPost('password');
			$cek_login = $this->ModelAuth->login_admin($username, $password);
			if ($cek_login) {
				session()->set('nama_anggota', $cek_login['nama_anggota']);
				session()->set('username', $cek_login['username']);
				session()->set('level', 'admin');
				return redirect()->to(base_url('admin'));
			} else {
				session()->setFlashdata('pesan', 'Username atau Password Salah !!!');
				return redirect()->to(base_url('auth/login_admin'));
			}
		} else {
			session()->setFlashdata('errors', \Config\Services::validation()->getErrors());
			return redirect()->to(base_url('auth/login_admin'));
		}
	}

	public function logout()
	{
		session()->remove('nama_anggota');
		session()->remove('username');
		session()->remove('level');
		session()->setFlashdata('pesan', 'Logout success');
		return redirect()->to(base_url('auth/login_admin'));
	}
}
