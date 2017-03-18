<?php

class PortailController extends Controller  
{
	
	public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);
	}

	public function auth()
	{
		$success = false;
		if(isset($_POST['loginU']) && isset($_POST['passwordU']))
		{
			$user =  $this->_model->findUserlogin($_POST['loginU']);
			if($user["password_user"] === sha1($_POST['passwordU']))
			{
				$_SESSION['user'] = array(	"user_session" => session_id(),
											"user_key" => $user["fk_id_user"]
											);
				$return = $this->_model->getRankUser($user["fk_id_user"]);
				$_SESSION['user']['rank'] = $return["name_rank"];

				$success = $return["name_rank"];
			}
		}
		echo $success;
	}
	
	public function login()
	{
		return $this->_view->output();
	}

	public function logout()
	{
		try {
				session_destroy();
				header("Location: http://" . DOMAIN_NAME);
			 
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	
}