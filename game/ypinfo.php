<?php
$yphp = '';
$ypgj = '';
$ypfy = '';
$ypbj = '';
$ypxx = '';
$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$yaopin = \player\getyaopinonce($ypid,$dblj);
$setyp = '';
$tishi='';
if (isset($canshu)){
    switch ($canshu){
        case 'setyp1':
            \player\changeplayersx('yp1',$ypid,$sid,$dblj);
            $tishi = "设置药品1成功<br/>";
            break;
        case 'setyp2':
            \player\changeplayersx('yp2',$ypid,$sid,$dblj);
            $tishi = "设置药品2成功<br/>";
            break;
        case 'setyp3':
            \player\changeplayersx('yp3',$ypid,$sid,$dblj);
            $tishi = "设置药品3成功<br/>";
            break;
        case 'useyp':
            $userypret = \player\useyaopin($ypid,1,$sid,$dblj);
            if ($userypret){
                $tishi = "使用药品成功<br/>";
            }else{
                $tishi = "使用药品失败<br/>";
            }
            break;
    }
}
$playeryp = \player\getplayeryaopin($ypid,$sid,$dblj);
if ($playeryp){
    $setyp1 = $encode->encode("cmd=ypinfo&canshu=setyp1&ypid=$ypid&sid=$sid");
    $setyp2 = $encode->encode("cmd=ypinfo&canshu=setyp2&ypid=$ypid&sid=$sid");
    $setyp3 = $encode->encode("cmd=ypinfo&canshu=setyp3&ypid=$ypid&sid=$sid");
    $useyp = $encode->encode("cmd=ypinfo&canshu=useyp&ypid=$ypid&sid=$sid");
    $setyp = <<<HTML
    <br/>
    <a href="?cmd=$setyp1">装备药品1.</a>
    <a href="?cmd=$setyp2">装备药品2.</a>
    <a href="?cmd=$setyp3">装备药品3.</a><br/>
    <a href="?cmd=$useyp">使用</a>
HTML;
}
if($playeryp->yphp!=0){
    $yphp = "气血".$playeryp->yphp."<br/>";
}
if ($playeryp->ypgj!=0){
    $ypgj = "攻击".$playeryp->ypgj."<br/>";
}
if ($playeryp->ypfy!=0){
    $ypfy = "防御".$playeryp->ypfy."<br/>";
}
if ($playeryp->ypbj!=0){
    $ypbj = "暴击".$playeryp->ypbj."<br/>";
}
if ($playeryp->ypxx!=0){
    $ypxx = "吸血".$playeryp->ypxx."<br/>";
}
$ypsx = "<br/>".$yphp.$ypgj.$ypfy.$ypbj.$ypxx;
$ypinfo = <<<HTML
$tishi
[$yaopin->ypname]<br/>
$ypsx
$setyp
<br/>
<button onClick="javascript :history.back(-1);">返回上一页</button><br/>
<a href="?cmd=$gonowmid">返回游戏</a>
HTML;
echo $ypinfo;