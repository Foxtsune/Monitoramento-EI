<?php
require_once 'Controller.php';
require_once('..\model\settings.config.php');
require_once '..\model\Unit.php';
require_once '..\model\User.php';

Class UserController extends Controller {

	private $unit;
	private $user;

	public function __construct($dbconfig){
		parent::__construct($dbconfig);
		$this->unit = new Unit($dbconfig);
		$this->user = new User($dbconfig);
		parent::validateSession();
	}

	/* Function validateSession
     * Checks if a session is valid or redirects
     */
	public function validateSession(){
		parent::validateSession();
	}

	/* Function loadAllCandidates
     * Get all candidate from cadidate table
     */
	public function loadAllUsers(){
		$user = new User($this->dbconfig);
		return $user->getUsers();
	}

	/* Function getUser
     * Get a unit by it's Id
     * @param unit's id
     */
	public function getUser($id){
	 	$user =  $this->user->getUser($id);
	 	if (!$user) {
			return array (array('name'=>'Usuário indisponível','id'=>''));
	 	}
 		return $user;
	}

	/* Function insert
     * Insert a new User
     * @param $fields array with form's fields
     */
	public function insert($fields){
		// parent::checkFields($fields);
		$this->user->setAttributes($fields);
		if($this->user->insertUser()){
			$dados = array('msg' => 'Usuário cadastrado com sucesso', 'type' => parent::$success);
			$_SESSION['data'] = $dados;
			header('location: ../view/users.php');
			exit;
		}
		$dados = array('msg' => 'Erro ao cadastrar novo usuário', 'type' => parent::$error);
		$_SESSION['data'] = $dados;
		header('location: ../view/users.php');
		exit;
	}

	/* Function edit
     * Update user data
     * @param $fields array with form's fields
     */
	public function edit($fields){
		// $this->checkFields($fields);
		if($this->user->updateUser($fields)){
			$dados = array('msg' => 'Dados atualizados com sucesso', 'type' => parent::$success);
			$_SESSION['data'] = $dados;
			header('location: ../view/update_user.php?id='.$fields['id']);
			exit;
		}
		$dados = array('msg' => 'Erro ao editar os dados do usuário', 'type' => parent::$error);
		$_SESSION['data'] = $dados;
		header('location: ../view/update_user.php?id='.$fields['id']);
		exit;
	}

	/* Function delete
     * Delete a user data
     * @param $fields array with form's fields
     */
	public function delete($id){
		if ($this->user->deleteUser($id)) {
			$dados = array('msg' => 'Usuário apagado com sucesso', 'type' => parent::$success);
			$_SESSION['data'] = $dados;
			header('location: ../view/users.php');
			exit;
		}
		$dados = array('msg' => 'Erro ao apagar usuário', 'type' => parent::$error);
		$_SESSION['data'] = $dados;
		header('location: ../view/users.php');
		exit;
	}

	/* Function updatePsw
     * Update user's password
     * @param user $uid
     * @param the current password hidden form
     * @param the current password input
     * @param the new password
     * @param the new password confirmation
     */
	public function updatePsw($uid,$oldPsw,$nowPsw,$newPsw,$confPsw){
		$this->checkPsw($uid,$newPsw,$confPsw);
		if ($oldPsw==$nowPsw){
			$this->user->updateUser(array('id' => $uid,'password' => md5($newPsw)));
			$dados = array('msg' => 'Senha alterada com sucesso', 'type' => parent::$success);
			$_SESSION['data'] = $dados;
			header('location: ../view/update_user.php?id='.$uid);
			exit;
		}
		$dados = array('msg' => 'Senha não coincide com a atual', 'type' => parent::$error);
		$_SESSION['data'] = $dados;
		header('location: ../view/update_user.php?id='.$uid);
		exit;
	}

	/* Function checkPsw
     * Checks if passwords matches each other
     * @param user $uid
     * @param the new password
     * @param the new password confirmation
     */
	private function checkPsw($uid,$newPsw,$confPsw){
		if ($newPsw!=$confPsw) {
			$dados = array('msg' => 'A nova senha não coincide com a senha de confirmação', 'type' => parent::$error);
			$_SESSION['data'] = $dados;
			header('location: ../view/update_user.php?id='.$uid);
			exit;
		}
	}
}

// CHAMADA DE MÉTODOS -------------------------------------------------------
session_start();
$controller = new UserController($dbconfig);
$controller->validateSession();
$rows = $controller->loadAllUsers();

if (isset($_GET['id'])) {
	$user = $controller->getUser($_GET['id']);
	$user = array_pop($user);

}

if (isset($_GET['update'])) {
	$user = $controller->getUser($_SESSION['id']);
	$user = array_pop($user);	
}

if (isset($_POST['insert'])) {
	if (!isset($_POST['admin'])) $_POST['admin'] = 0;
	$fields = array('name' => $_POST['name'],'email' =>$_POST['email'],'password' =>md5("semedmch"),'admin' =>$_POST['admin']);
	$controller->insert($fields);
}

if (isset($_POST['edit'])) {
	if (!isset($_POST['admin'])) $_POST['admin'] = 0;
	$fields = array('id' => $_POST['id'],'name' => $_POST['name'],'email' =>$_POST['email'],'password' =>$_POST['password'],'admin' =>$_POST['admin']);
	$controller->edit($fields);
}

if (isset($_GET['delete'])) {
	$controller->delete($_GET['id']);
}

if (isset($_POST['psw'])) {
	$controller->updatePsw($_POST['uid'],$_POST['id_psw'],md5($_POST['psw_now']),$_POST['psw_new'],$_POST['psw_conf']);
}