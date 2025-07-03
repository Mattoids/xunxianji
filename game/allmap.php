<?php

//$sql = "select * from mid order by mid ASC";//获取当前地图
//$cxjg = $dblj->query($sql);

$player = player\getplayer($sid,$dblj);
$map = '';

$cxallmap = \player\getqy_all($dblj);
$br = 0;
for ($i=0;$i<count($cxallmap);$i++){

    $qyame = $cxallmap[$i]['qyname'];
    $mid = $cxallmap[$i]['mid'];
    if ($mid>0){
        $cxmid = \player\getmid($mid,$dblj);
        $mname = $cxmid->mname;
        $br++;
        $gomid = $encode->encode("cmd=gomid&newmid=$mid&sid=$sid");
        $map .=<<<HTML
        <a href="?cmd=$gomid" >[$qyame]$mname</a>
HTML;
    }
    if ($br >= 3){
        $br = 0;
        $map.="<br/>"  ;
    }
}


$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$allmap = <<<HTML
地图列表:<br/>
$map<br>
<br>
<a href="#" onClick="javascript:history.back(-1);">返回上一页</a><br/>
<a href="game.php?cmd=$gonowmid">返回游戏</a>
HTML;
echo $allmap;
?>