<?php
include 'pdo.php';
require_once 'class/encode.php';

//header('Access-Control-Allow-Origin:*');

$encode = new \encode\encode();
$a = '';
if (isset($_POST[ 'submit']) && $_POST['submit']){

    $username = $_POST['username'];
    $userpass = $_POST['userpass'];
    $username = htmlspecialchars($username);
    $userpass = htmlspecialchars($userpass);
    $sql = "select * from userinfo where username = ? and userpass = ?";
    $stmt = $dblj->prepare($sql);
    $bool = $stmt->execute(array($username,$userpass));
    $stmt->bindColumn('username',$cxusername);
    $stmt->bindColumn('userpass',$cxuserpass);
    $stmt->bindColumn('token',$cxtoken);
    $exeres = $stmt->fetch(PDO::FETCH_ASSOC);
    if ((strlen($username) < 6 || strlen($userpass) < 6) && !$exeres){
        $a = '账号或密码错误';
    }elseif ((strlen($username) >= 6 || strlen($userpass) >= 6) && !$exeres){
        $a = '账号或密码错误';
    }elseif ($cxusername == $username && $cxuserpass == $userpass){

        $sql = "select * from game1 where token='$cxtoken'";
        $cxjg = $dblj->query($sql);
        $cxjg->bindColumn('sid',$sid);
        $cxjg->fetch(PDO::FETCH_ASSOC);
        if ($sid==null){
            $cmd = "cmd=cj&token=$cxtoken";
        }else{
            $cmd = "cmd=login&sid=$sid";
            $nowdate = date('Y-m-d H:i:s');

            $sql = "update game1 set endtime = '$nowdate',sfzx=1 WHERE sid=?";
            $stmt = $dblj->prepare($sql);
            $stmt->execute(array($sid));
        }
        $cmd = $encode->encode($cmd);
        header("refresh:1;url=game.php?cmd=$cmd");
    }else{
        $a = '登录服务有误';
    }
}
?>
<html lang="en">
<head>
    <meta charset="utf-8" content="width=device-width,user-scalable=no" name="viewport" />
    <title>寻仙纪</title>
    <link rel="stylesheet" href="css/gamecss.css">
</head>
<body style="text-align: center;">
<img src="images/11.jpg" width="320" height="200"><br/>
<div id="mainfont">
月冷千山江自碧，冰崖万丈无留意。<br/>
寻道只影莲花落，竹音寥落听新曲。<br/>
仙人听谁醉明月，踏浪踏风随燕去。<br/>
纪纲人伦心如桑，一醉红尘消百绪。<br/>
魔前扣首三千年，回首红尘不做仙。<br/>
</div>
<form action=<?php echo $_SERVER['PHP_SELF']; ?> method="post">
    账号:<br/>
    <input type="text" name="username"><br/>
    密码:<br/>
    <input type="password" name="userpass"><br/>
    <div style="color: #9f182a;"><?php echo $a ?></div>
    <p><a href="reguser.php" id="btn" >注册</a> <input type="submit" name="submit" value="登录" id="loginBtn"></p>
</form>

</body>
<?php include 'footer.php'; ?>
</html>