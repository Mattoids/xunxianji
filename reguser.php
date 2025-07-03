<?php
include 'pdo.php';
$a = '';
    if (isset($_POST[ 'submit']) && $_POST['submit'] ){
        $username = $_POST['username'];
        $userpass = $_POST['userpass'];
        $userpass2 = $_POST['userpass2'];
        $email = $_POST['email'];
        $emailPattern = '/^[^\s@]+@[^\s@]+\.[^\s@]+$/';
        $username = htmlspecialchars($username);
        $userpass = htmlspecialchars($userpass);
        $email = htmlspecialchars($email);
        $sql = "select * from userinfo where username=?";
        $stmt = $dblj->prepare($sql);
        $stmt->execute(array($username));
        $stmt->bindColumn('username',$cxusername);
        $ret = $stmt->fetch(PDO::FETCH_ASSOC);

        if($userpass2 != $userpass){
            $a = '两次输入密码不一致';
        }elseif (strlen($username) < 6 or strlen($userpass)< 6){
            $a = '账号或密码长度请大于或等于6位';
        }elseif ($ret){
            $a = '注册失败,账号'.$cxusername.'已经存在';
        }elseif ($email && !preg_match($emailPattern, $email)){
            $a = '电子邮件地址无效';
        }else{
            $token = md5("$username.$userpass".strtotime(date('Y-m-d H:i:s')));
            $sql = "insert into userinfo(username,userpass,token,email) values('$username','$userpass','$token','$email')";
            $cxjg = $dblj->exec($sql);
            $a = '注册成功';
            header("refresh:1;url=index.php");
        }
    }

    ?>
<html lang="en">
<head>
    <meta charset="utf-8" content="width=device-width,user-scalable=no" name="viewport">
    <title>寻仙纪</title>

    <link rel="stylesheet" href="css/gamecss.css">
</head>
<body style="text-align: center;">
<img src="images/11.jpg" width="320" height="200">
<p>天下风云出我辈，一入江湖岁月催</p>
<p>皇图霸业谈笑中，不胜人生一场醉</p>
<p>提剑跨骑挥鬼雨，白骨如山鸟惊飞</p>
<p>尘事如潮人如水，只叹江湖几人回。</p>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    账号：<br/>
    <input type="text" name="username"><br/>
    密码：<br/>
    <input type="password" name="userpass"><br/>
    确认密码：<br/>
    <input type="password" name="userpass2"><br/>
    邮箱：<br/>
    <input type="text" name="email"><br/><div>邮箱后续可用于找回密码（选填）</div>
    <div style="color: #9f182a;"><?php echo $a ?></div>
    <p><a href="index.php" id="btn">登陆</a> <input type="submit" name="submit" value="注册" id="loginBtn"> </p>
</form>
</body>
<?php include 'footer.php'; ?>
</html>