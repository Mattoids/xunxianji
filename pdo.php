
<?php
$sqlname='root';
$sqlpass='mysql_HhXYaG';
$dbhost='192.168.2.123:3305';
$dbname='xunxian';
$dsn="mysql:host=$dbhost;dbname=$dbname;";
$dblj = new PDO($dsn,$sqlname,$sqlpass,array(PDO::ATTR_PERSISTENT=>true));
$dblj->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dblj->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$dblj->query("SET NAMES utf8mb4");
?>