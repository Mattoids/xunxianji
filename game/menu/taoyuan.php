<?php
$player = \player\getplayer($sid,$dblj);
$gonowmid = $encode->encode("cmd=club&canshu=xujingplayer&sid=$sid&xjid={$xjid}");



$lukouhtml ='';
$bosshtml = '';
if ($clmid->midinfo == ''){
    $clmid->midinfo = $clmid->mname;
}


if ($clmid->midboss != 0){
    $boss = \player\getboss($clmid->midboss,$dblj);
    $bossinfo = $encode->encode("cmd=boss&bossid=$boss->bossid&sid=$sid");
    $bosshtml = <<<HTML
    BOSS:<a href="?cmd=$bossinfo">$boss->bossname</a><br/>
HTML;
}
if ($upmid->mname!=''){
    $lukouhtml .= <<<HTML
    北<br/><a href="?cmd=$upmidlj">$upmid->mname ↑</a><br/>
HTML;
} else {
    $lukouhtml .= <<<HTML
    北</br>此路不通 ↑<br/>
HTML;

}

if ($leftmid->mname!=''){
    $lukouhtml .= <<<HTML
    西:<a href="?cmd=$leftmidlj">← $leftmid->mname</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
HTML;
} else {
    $lukouhtml .= <<<HTML
    西:← 此路不通
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
HTML;
}

if ($rightmid->mname!=''){
    $lukouhtml .= <<<HTML
    <a href="?cmd=$rightmidlj">$rightmid->mname →</a>:东<br/>
HTML;
} else {
    $lukouhtml .= <<<HTML
    此路不通 →:东<br/>
HTML;
}

if ($downmid->mname!=''){
    $lukouhtml .= <<<HTML
    <a href="?cmd=$downmidlj">$downmid->mname ↓</a><br/>南<br/>
HTML;
} else {
    $lukouhtml .= <<<HTML
    此路不通 ↓</a><br/>南<br/>
HTML;

}

$gwhtml = '';
for ($i = 0;$i<count($cxallguaiwu);$i++){
    $gwcmd = $encode->encode("cmd=getginfo&gid=".$cxallguaiwu[$i]['id']."&gyid=".$cxallguaiwu[$i]['gyid']."&sid=$sid&nowmid=$player->nowmid");
    $gwhtml .="<a href='?cmd=$gwcmd'>".$cxallguaiwu[$i]['gname']."</a> ";
}

if ($clmid->midboss != 0){
    $boss = \player\getboss($clmid->midboss,$dblj);
    $bossinfo = $encode->encode("cmd=boss&bossid=$boss->bossid&sid=$sid");
    $bosshtml = <<<HTML
    BOSS:<a href="?cmd=$bossinfo">$boss->bossname</a><br/>
HTML;
}

$npchtml='';
$task = \player\getplayerrenwu($sid,$dblj);//玩家任务数组

$sql = "select * from playerrenwu WHERE sid='$sid' AND rwlx = 2";
$cxjg = $dblj->query($sql);
$mrrw = $cxjg->fetchAll(PDO::FETCH_ASSOC);
for ($n=0;$n<count($mrrw);$n++){
    if ($mrrw[$n]['data']!=date('d') ){
        $rwid = $mrrw[$n]['rwid'];
        $sql="delete from playerrenwu WHERE rwid=$rwid AND sid='$sid'";
        $dblj->exec($sql);
    }
}

$sql = "select * from playerrenwu WHERE sid='$sid' AND rwzt!=3";
$cxjg = $dblj->query($sql);
$wtjrw = $cxjg->fetchAll(PDO::FETCH_ASSOC);
$taskcount = count($wtjrw);

if ($clmid->mnpc !=""){
    $sql = "select * from npc where id in ($clmid->mnpc)";//获取npc
    $cxjg = $dblj->query($sql);
    $cxnpcall = $cxjg->fetchAll(PDO::FETCH_ASSOC);

    for ($i=0;$i < count($cxnpcall);$i++){
        $nname = $cxnpcall[$i]['nname'];
        $nid = $cxnpcall[$i]['id'];
        $taskid = $cxnpcall[$i]['taskid'];
        $taskarr = explode(',',$taskid);
        $yrw = false;
        if ($taskid!=''){
            for ($l=0;$l<count($taskarr);$l++){
                $nowrw = \player\gettask($taskarr[$l],$dblj);
                $rwret = \player\getplayerrenwuonce($sid,$taskarr[$l],$dblj);
                $lastrwid = $nowrw->lastrwid;

                if ($nowrw->rwlx == 1 || $nowrw->rwlx == 2){
                    if (!$rwret){
                        if ($nowrw->rwzl != 3){
                            $npchtml .='<img src="images/wen.gif" />';
                        }elseif($nowrw->rwyq == $nid){
                            $npchtml .='<img src="images/wen.gif" />';
                        }else{
                            continue;
                        }
                    }elseif ($rwret->rwzt==2){
                        if ($nowrw->rwzl != 3){
                            $npchtml .='<img src="images/tan.gif" />';
                        }elseif ($nowrw->rwcount == $nid){
                            $npchtml .='<img src="images/tan.gif" />';
                        }else{
                            continue;
                        }

                    }
                }
                if ($nowrw->rwlx == 3){
                    if ($rwret){
                        if ($rwret->rwzt==2){
                            if ($nowrw->rwzl != 3){
                                $npchtml .='<img src="images/tan.gif" />';
                            }elseif ($nowrw->rwcount == $nid){
                                $npchtml .='<img src="images/tan.gif" />';
                            }else{
                                continue;
                            }
                        }
                    }else{
                        if ($lastrwid<=0 ){
                            if ($nowrw->rwzl != 3){
                                $npchtml .='<img src="images/wen.gif" />';
                            }elseif ($nowrw->rwyq == $nid){
                                $npchtml .='<img src="images/wen.gif" />';
                            }else{
                                continue;
                            }
                        }else{
                            $rwret = \player\getplayerrenwuonce($sid,$lastrwid,$dblj);
                            if ($rwret){
                                if ($rwret->rwzt==3){
                                    if ($nowrw->rwzl != 3){
                                        $npchtml .='<img src="images/wen.gif" />';
                                    }elseif ($nowrw->rwyq == $nid){
                                        $npchtml .='<img src="images/wen.gif" />';
                                    }else{
                                        continue;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        $npccmd = $encode->encode("cmd=npc&nid=$nid&sid=$player->sid");
        $npchtml.=<<<HTML
        <a href="?cmd=$npccmd">$nname</a><br/>
HTML;
    }
}

$sql = 'SELECT * FROM ggliaotian ORDER BY id DESC LIMIT 2';//聊天列表获取
$ltcxjg = $dblj->query($sql);
$lthtml='';
if ($ltcxjg){
    $ret = $ltcxjg->fetchAll(PDO::FETCH_ASSOC);
    for ($i=0;$i < count($ret);$i++){
        $uname = $ret[count($ret) - $i-1]['name'];
        $umsg = $ret[count($ret) - $i-1]['msg'];
        $uid = $ret[count($ret) - $i-1]['uid'];
        $ucmd = $encode->encode("cmd=getplayerinfo&uid=$uid&sid=$player->sid");
        if ($uid){
            $lthtml .="[公共]<a href='?cmd=$ucmd''>$uname</a>:$umsg<br/>";
        }else{
            $lthtml .="[公共]<div class='hpys' style='display: inline'>$uname:</div>$umsg<br/>";
        }

    }
}

$pvphtml = "[安全区]";
if ($clmid->ispvp){
    $pvphtml = "[PVP]";
}

$sql = "select * from playerrenwu WHERE sid='$sid' AND rwzt!=3";
$cxjg = $dblj->query($sql);
$wtjrw = $cxjg->fetchAll(PDO::FETCH_ASSOC);
$taskcount = count($wtjrw);

$mapcmd = $encode->encode("cmd=allmap&sid=$sid");
$xiuliancmd = $encode->encode("cmd=goxiulian&sid=$sid");
$mytask = $encode->encode("cmd=mytask&sid=$sid");
$getbagjncmd = $encode->encode("cmd=getbagjn&sid=$sid");
$fangshi = $encode->encode("cmd=fangshi&fangshi=daoju&sid=$sid");
$clubcmd = $encode->encode("cmd=club&sid=$sid");
$duihuancmd = $encode->encode("cmd=duihuan&sid=$sid");
$imcmd = $encode->encode("cmd=im&sid=$sid");

$html = <<<HTML
当前地图:{$clmid->mname}{$pvphtml}<a href="?cmd=$mytask">任务({$taskcount})</a><a href="?cmd=$gonowmid">刷新</a> <br/>
$npchtml
$bosshtml
你看到:$gwhtml<br/>
请选择路口:<br/>
$lukouhtml
【<a href="?cmd=$mapcmd">查看地图</a>】<br/>
$clmid->playerinfo
<div id="ltmsg">
$lthtml
</div>
$clmid->midinfo<br/>
<a href="?cmd=$gonowmid">返回秘境</a><br/>
HTML;

exit($html);