<?php
//城主学琴
$player = player\getplayer($sid,$dblj);
$rehp = $encode->encode("cmd=npc&nid=$nid&canshu=xueqin&sid=$sid");
$npchtml =<<<HTML
游戏错误
 <p><a href="?cmd=$gonowmid">返回游戏</a></p>;
HTML;
if ($nid!=''){
    if (isset($canshu)){
        switch ($canshu){
            case 'xueqin':
                $dhsj = strtotime(date("Y-m-d",time()));
                $dhsql="select * from npc_lingqu where type = 1 and dhsj='$dhsj' and sid='$sid'";
                $sfduih = $dblj->query($dhsql);
                $cxRet = $sfduih->fetch(\PDO::FETCH_ASSOC);
                if (!$cxRet){
                    \player\changeyxb(1,3000,$sid,$dblj);
                    $sql = "insert into npc_lingqu(type,dhsj,sid,dh) VALUES (1,'$dhsj','$sid','获取3000灵石')";
                    $dblj->exec($sql);
                    $gnhtml =<<<HTML
                    <br/>$npc->nname:少侠，谢谢您对游戏的支持！<br/>
                    获得灵石：3000<br/>
HTML;
                }else{
                    $gnhtml ="<br/>你今天已经领取过一次啦<br/>";
                }
                break;
        }
    }else{
        $gnhtml =<<<HTML
        <br/><a href="?cmd=$rehp">谢谢学琴城主（获得3000灵石）！</a><br/>
HTML;
    }
}
?>