<?php
$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$imlist = '';

$sql="select * from setting WHERE sid='$sid'";
$ret = $dblj->query($sql);
$setting = $ret->fetchAll(PDO::FETCH_ASSOC);
var_dump($setting);
if ($setting || $setting->auto_zd == 1) {
    $page = "开/<button onClick=''>关</button>";
} else {
    $page = "<button onClick=''>开</button>/关";
}

$imhtml =<<<HTML
=======设置=======<br/>
<br/>
自动攻击状态：{$page}<br/>
<br/>
<button onClick="javascript:history.back(-1);">返回上一页</button><br/>
<a href="?cmd=$gonowmid">返回游戏</a>
HTML;
echo $imhtml;