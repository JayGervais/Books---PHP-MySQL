<!DOCTYPE html>
<html>
<head>
	<title>Added Entry Results</title>
</head>
<body>
	<h1>Added Entry Results</h1>
<?php

if(!isset($_POST['ISBN']) || !isset($_POST['Author'])
 || !isset($_POST['Title']) || !isset($_POST['Price'])) {
	echo "<p>You have not entered all the details.<br/>
	Go back and try again.</p>";
	exit;
}

// create short variable names
$isbn=$_POST['ISBN'];
$author=$_POST['Author'];
$title=$_POST['Title'];
$price=$_POST['Price'];
$price = doubleval($price);

@$db = new mysqli('localhost', 'jay', 'password', 'Books');

if (msqli_connect_errno()) {
	echo "<p>Error: Could not connect to database.<br/>
	Please try again.</p>";
	exit;
}

$query = "INSERT INTO Books VALUES (?, ?, ?, ?)";
$stmt = $db->prepare($query);
$stmt->bind_param('sssd', $isbn, $author, $title, $price);
$stmt->execute();

if ($stmt->affected_rows > 0) {
	echo "<p>Submission successful.</p>";
} else {
	echo "<p>An Aweful error occured.<br/>
	Nothing was added.</p>";
}

$db->close();

?>
</body>
</html>