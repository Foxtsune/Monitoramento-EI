<?php 
require_once('Model.php');

Class User extends Model{

	protected $name;

	protected $email;

	protected $password;

	protected $admin;


    /* Function getUsers
     * Get all users
     * @return Associate array users
     */
	function getUsers(){
		try {
			$sql = "SELECT * FROM `users` ";
			$dbc = new DBConnection($this->dbconfig);
			return $dbc->getQuery($sql);
		} catch (PDOException $e) {
			echo __LINE__.$e->getMessage();
		}
	}

	/* Function getUser
     * Get a user by id
     * @param $id address in database
     * @return a single row with a Address
     */
	function getUser($id){
		try {
			$sql = "SELECT * FROM `users` WHERE id = :id";
			$params = array(':id' => $id);
			$dbc = new DBConnection($this->dbconfig);
			return $dbc->getQuery($sql,$params);
		} catch (PDOException $e) {
			echo __LINE__.$e->getMessage();
		}
	}

	/* Function insertUser
     * Insert a new user
     * @return int count of records affected by running the sql statement into users.
     */
	function insertUser(){
		try {
			$sql = "INSERT INTO `users` (name, email, password, admin) VALUES (:name, :email, :password, :admin)";
			$params = array(':name' => $this->name,
							':email' => $this->email,
							':password' => $this->password,
							':admin' => $this->admin);
			$dbc = new DBConnection($this->dbconfig);
			return $dbc->runQuery($sql,$params);
		} catch (PDOException $e) {
			echo __LINE__.$e->getMessage();
		}
	}

	/* Function deleteUser
     * Delete a user
     * @param $id user's id
     * @return int count of records affected by running the sql statement into users.
     */
	function deleteUser($id){
		try {
			$sql = "DELETE FROM `users` WHERE id = :id";
			$params = array(':id' => $id);
			$dbc = new DBConnection($this->dbconfig);
			return $dbc->runQuery($sql,$params);
		} catch (PDOException $e) {
			echo __LINE__.$e->getMessage();
		}
	}

	/* Function updateUser
     * Update a user
     * @param $params array with User's atributes
     * @return int count of records affected by running the sql statement into users.
     */
	function updateUser(array $params){
		try {
			$sql = "UPDATE `users` SET name = :name, email = :email, password = :password, admin = :admin WHERE id = :id";
			$dbc = new DBConnection($this->dbconfig);
			return $dbc->runQuery($sql,$params);
		} catch (PDOException $e) {
			echo __LINE__.$e->getMessage();
		}
	}
}