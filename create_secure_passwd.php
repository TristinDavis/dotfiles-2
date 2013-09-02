<?PHP

$uniqidList = array();
$passwordList = array();

for ($i = 0; $i < 1000; $i++) {
	$uniqid = str_replace(".", "P", uniqid(mt_rand(), 1));

	if (in_array($uniqid, $uniqidList)) {
		continue;
	}

	$uniqidList[] = $uniqid;

	$startIndex = mt_rand(1, 20);

	$password = substr($uniqid, $startIndex, 10);

	if (in_array($password, $passwordList)) {
		continue;
	}

	$passwordList[] = $password;

	echo $password . "," . md5($password) . "\n";
}

?>
