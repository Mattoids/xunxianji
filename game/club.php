<?php
$clubplayer = \player\getclubplayer_once($sid,$dblj);
$player = \player\getplayer($sid,$dblj);
$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$clubhtml= '';
$clubmenu = '';
$renzhihtml='';
$playerlist='';
$gongneng='';
if (isset($canshu)){
    switch ($canshu){
        case "joinclub":
            if ($clubplayer){
                echo "你已经有门派了<br/>";
                break;
            }
            $club = \player\getclub($clubid,$dblj);
            if ($club->clubautosh == 1){
                $sql = "insert into clubplayer(clubid, uid, sid, uclv) VALUES ($clubid,$player->uid,'$sid',6)";
                $row = $dblj->exec($sql);
                $clubplayer = \player\getclubplayer_once($sid,$dblj);
                echo "恭喜你成功加入<br/>";
            } else {
                $clubplayerapply = \player\getclubplayerapply($clubid, $player->uid, $dblj);
                if (!$clubplayer && !$clubplayerapply) {
                    $sql = "insert into clubplayerapply(clubid, uid, sid) VALUES ($clubid,$player->uid,'$sid')";
                    $row = $dblj->exec($sql);
                    $clubplayer = \player\getclubplayer_once($sid,$dblj);
                    echo "恭喜你申请成功，请等待审核通过。<br/>";
                } else {
                    echo "已经申请过了，请不要重复申请。";
                }
            }
            break;
        case "outclub":
            $clubcmd = $encode->encode("cmd=club&sid=$sid");
            $outclubcmd = $encode->encode("cmd=club&canshu=outclub&sid=$sid&confirm=1");
            $gongneng = "确认要叛出门派吗？<br/>";
            $gongneng .= "<a href='?cmd=$outclubcmd'>确认</a> / <a href='?cmd=$clubcmd'>取消</a><br/>";
            if (isset($confirm) && $confirm && $clubplayer){
                $sql="delete from clubplayer WHERE sid='$sid'";
                $row = $dblj->exec($sql);
                $clubplayer = \player\getclubplayer_once($sid,$dblj);
            }
            break;
        case "deleteclub":
            $clubcmd = $encode->encode("cmd=club&sid=$sid");
            $outclubcmd = $encode->encode("cmd=club&canshu=deleteclub&sid=$sid&confirm=1");
            $gongneng = "确认要解散门派吗？<br/>";
            $gongneng .= "<a href='?cmd=$outclubcmd'>确认</a> / <a href='?cmd=$clubcmd'>取消</a><br/>";
            if (isset($confirm) && $confirm && $clubplayer){
                if ($clubplayer->uclv == 1){
                    $sql="delete from club WHERE clubid='$clubplayer->clubid'";
                    $row = $dblj->exec($sql);
                    $sql="delete from clubplayer WHERE clubid='$clubplayer->clubid'";
                    $row = $dblj->exec($sql);
                    $sql="delete from clubplayerapply WHERE clubid='$clubplayer->clubid'";
                    $row = $dblj->exec($sql);
                    echo "门派解散成功<br/>";
                }
            }
            break;
        case "renzhi":
            if ($clubplayer){
                if (isset($zhiwei)){
                    $sql="select uid from clubplayer WHERE clubid=$clubplayer->clubid AND uclv > $clubplayer->uclv";
                    $ret = $dblj->query($sql);
                    $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($retuid as $uiditem){
                        $uid = $uiditem['uid'];
                        if ($uid==$player->uid){
                            continue;
                        }
                        $otherplayer = \player\getplayer1($uid,$dblj);
                        $ucmd = $encode->encode("cmd=club&canshu=zhiwei&zhiwei=$zhiwei&uid=$uid&sid=$sid");
                        $playerlist .= "<a href='?cmd=$ucmd'>{$otherplayer->uname}</a><br/>";

                    }
                    $gongneng =  "=========选择任职人员=========<br/>$playerlist<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
                    exit($gongneng);
                }

                if ($clubplayer->uclv == 1){
                    $no2cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=2&sid=$sid");
                    $no3cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=3&sid=$sid");
                    $no4cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=4&sid=$sid");
                    $no5cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=5&sid=$sid");
                    $no6cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=6&sid=$sid");
                    $gongneng = "<a href='?cmd=$no2cmd'>任职副掌门</a><br/><a href='?cmd=$no3cmd'>任职长老</a><br/><a href='?cmd=$no4cmd'>任职执事</a><br/><a href='?cmd=$no5cmd'>任职精英</a><br/><a href='?cmd=$no6cmd'>任职弟子</a><br/>";
                }
                if ($clubplayer->uclv == 2){
                    $no3cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=3&sid=$sid");
                    $no4cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=4&sid=$sid");
                    $no5cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=5&sid=$sid");
                    $no6cmd = $encode->encode("cmd=club&canshu=renzhi&zhiwei=6&sid=$sid");
                    $gongneng = "<a href='?cmd=$no3cmd'>任职长老</a><br/><a href='?cmd=$no4cmd'>任职执事</a><br/><a href='?cmd=$no5cmd'>任职精英</a><br/><a href='?cmd=$no6cmd'>任职弟子</a><br/>";
                }
            }
            break;
        case "zhiwei":
            $sql="update clubplayer set uclv = $zhiwei WHERE uid=$uid AND clubid = $clubplayer->clubid";
            $dblj->exec($sql);
            break;
        case "setting":
            $club = \player\getclub($clubplayer->clubid,$dblj);
            if (isset($clubautosh) && $club->clubautosh != $clubautosh){
                $sql="update club set clubautosh = $clubautosh WHERE clubid = $clubplayer->clubid";
                $dblj->exec($sql);

                $club = \player\getclub($clubplayer->clubid,$dblj);
            }

            $enable = $encode->encode("cmd=club&canshu=setting&sid=$sid&clubautosh=1");
            $disable = $encode->encode("cmd=club&canshu=setting&sid=$sid&clubautosh=0");
            if ($club->clubautosh == 0) {
                $gongneng = "自动审核: <a href='?cmd=$enable'>开</a> / 关<br/><br/>";
            } else {
                $gongneng = "自动审核: 开 / <a href='?cmd=$disable'>关</a><br/><br/>";
            }
            break;
        case "audit":
            $gongneng = "=========申请人员=========<br/>";
            $sql="select * from clubplayerapply WHERE clubid=$clubplayer->clubid";
            $ret = $dblj->query($sql);
            $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);
            foreach ($retuid as $uiditem){
                $enable = $encode->encode("cmd=club&canshu=auditres&sid=$sid&confirm=1&clubid=$uiditem[clubid]&uid=$uiditem[uid]");
                $disable = $encode->encode("cmd=club&canshu=auditres&sid=$sid&confirm=0&clubid=$uiditem[clubid]&uid=$uiditem[uid]");
                $ucmd = $encode->encode("cmd=getplayerinfo&uid=$uiditem[uid]&sid=$sid");

                $applyplayer = \player\getplayer($uiditem['sid'], $dblj);
                $gongneng .= "<a href='?cmd=$ucmd'>$applyplayer->uname</a> | <a href='?cmd=$enable'>通过</a> <a href='?cmd=$disable'>拒绝</a><br/>";
            }

            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "auditres":
            if (isset($confirm) && isset($clubid) && isset($uid)){
                if ($confirm == 1) {
                    try {
                        $clubplayerapply = \player\getclubplayerapply($clubid, $uid, $dblj);
                        if ($clubplayerapply->sid) {
                            $sql = "insert into clubplayer(clubid, uid, sid, uclv) VALUES ($clubid,$uid,'$clubplayerapply->sid',6)";
                            $row = $dblj->exec($sql);

                            // 审核通过则拒绝该用户的其他申请信息
                            $sql="delete from clubplayerapply WHERE uid=$uid";
                            $row = $dblj->exec($sql);

                            $clubplayer = \player\getclubplayer_once($sid,$dblj);
                            echo "审核成功<br/>";
                        } else {
                            echo "用户申请已经被审核，请不要重复审核！<br/>";
                        }
                    } catch (Exception $e) {
                        echo "审核失败<br/>";
                    }
                } else {
                    echo "已拒绝用户申请！<br/>";
                }
            }
            break;
        case "edit":
            $club = \player\getclub($clubplayer->clubid,$dblj);
            $gongneng = "=========修改简介=========<br/>";
            $gongneng .= "<form><input type='hidden' name='cmd' value='club'><input type='hidden' name='canshu' value='editinfo'><input type='hidden' name='sid' value='$sid'>门派说明:<br/><textarea name='clubinfo' style='height: 80px'>$club->clubinfo</textarea><br/><input type='submit' value='修改'></form><br/>";
            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "editinfo":
            $club = \player\getclub($clubplayer->clubid,$dblj);
            if (isset($clubinfo) && $club->clubinfo != $clubinfo){
                $sql="update club set clubinfo = '$clubinfo' WHERE clubid = $clubplayer->clubid";
                $dblj->exec($sql);
                echo "修改成功!<br/>";
            }
            break;
        case "tichu":
            $gongneng = "=========人员=========<br/>";
            $sql="select * from clubplayer WHERE clubid=$clubplayer->clubid AND uclv > $uclv";
            $ret = $dblj->query($sql);
            $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);
            foreach ($retuid as $uiditem){
                $tichures = $encode->encode("cmd=club&canshu=tichures&sid=$sid&confirm=1&tsid=$uiditem[sid]");
                $ucmd = $encode->encode("cmd=getplayerinfo&uid=$uiditem[uid]&sid=$sid");

                $applyplayer = \player\getplayer($uiditem['sid'], $dblj);

                $gongneng .= "<a href='?cmd=$ucmd'>$applyplayer->uname($uiditem[clubexp])</a> | <a href='?cmd=$tichures'>踢出</a><br/>";
            }

            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "tichures":
            if (isset($tsid)) {
                $clubcmd = $encode->encode("cmd=club&sid=$sid");
                $outclubcmd = $encode->encode("cmd=club&canshu=tichures&sid=$sid&tichuqueren=1&tsid=$tsid");
                $clubplayer = \player\getclubplayer_once($tsid,$dblj);
                if (isset($tichuqueren) && $tichuqueren == 1 && $clubplayer) {
                    $sql="delete from clubplayer WHERE clubid='$clubplayer->clubid' AND sid='$tsid'";
                    $dblj->exec($sql);
                    echo "操作成功！<br/>";
                } else {
                    $playertc = \player\getplayer($tsid, $dblj);
                    $gongneng = "确认要踢出<a href='$clubcmd'>$playertc->uname</a>吗？<br/>";
                    $gongneng .= "<a href='?cmd=$outclubcmd'>确认</a> / <a href='?cmd=$clubcmd'>取消</a><br/>";
                    $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
                    exit($gongneng);
                }
            }
            break;
        case "qiandao":
            $clubplayer = \player\getclubplayer_once($sid,$dblj);
            $date = date('Y-m-d');
            if (!isset($clubplayer->qiandao) || $clubplayer->qiandao != $date) {
                $sql="update clubplayer set qiandao='$date' WHERE sid='$sid'";
                $dblj->exec($sql);

                // TODO::奖励
                $config = \player\getconfig("clubqiandao", $dblj);

                echo "签到成功<br/>";
            } else {
                echo "你今天已签到，请不要重复签到！<br/>";
            }
            break;
        case "upgrade":
            $club = \player\getclub($clubplayer->clubid,$dblj);
            $playercount = \player\getclubplayer_count($club->clubid, $dblj);
            $clubczbxs = 10 - $club->clublv + 1;
            $clubyxbxs = 10 + $club->clublv - 1;
            $clubmxsum = $club->clubmxsum + 10;
            $clubyxb = $club->clubupexp * $clubyxbxs;
            $clubczb = ceil($club->clubupexp / $clubczbxs);

            $gongneng = "=========门派升级=========<br/>";
            $gongneng .= "灵石: $club->clubyxb/$clubyxb<br/>";
            $gongneng .= "建设度: $club->clubexp/$club->clubupexp<br/>";
            $gongneng .= "极品灵石: $club->clubczb/$clubczb<br/><br/>";

            $gongneng .= "=========升级收益=========<br/>";
            $gongneng .= "成员数量: $playercount/$clubmxsum<br/>";
            $gongneng .= "签到奖励提升<br/><br/>";

            if ($club->clubyxb >= $clubyxb && $club->clubexp >= $club->clubupexp && $club->clubczb >= $clubczb) {
                $upgrade = $encode->encode("cmd=club&canshu=upgraderun&sid=$sid");
                $gongneng .= "<a href='?cmd=$upgrade'>确认升级</a><br/><br/>";
            } else {
                $gongneng .= "条件不足，无法升级！<br/><br/>";
            }

            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "upgraderun":
            $club = \player\getclub($clubplayer->clubid,$dblj);
            $clubczbxs = 10 - $club->clublv + 1;
            $clubyxbxs = 10 + $club->clublv - 1;
            $clubyxb = $club->clubupexp * $clubyxbxs;
            $clubczb = ceil($club->clubupexp / $clubczbxs);
            $clubupexp = $club->clubupexp * ($club->clublv + 1) * $club->clublv;

            if ($club->clubyxb >= $clubyxb && $club->clubexp >= $club->clubupexp && $club->clubczb >= $clubczb) {
                $sql="update club set clublv=clublv+1, clubupexp=$clubupexp, clubexp=clubexp-$club->clubupexp, clubyxb=clubyxb-$clubyxb, clubczb=clubczb-$clubczb, clubmxsum=clubmxsum+10 WHERE clubid=$clubplayer->clubid";
                $dblj->exec($sql);
                echo "升级成功！<br/>";
            } else {
                echo "条件不足，请不要重复升级!<br/>";
            }

            break;
    }
}
if (isset($clubid) || $clubplayer){
    if ($clubplayer){
        if (isset($clubid)){
            if ($clubplayer->clubid != $clubid){
                goto noclub;
            }
        }else{
            $clubid = $clubplayer->clubid;
        }
        $outclub = $encode->encode("cmd=club&canshu=outclub&sid=$sid");
        $deleteclub = $encode->encode("cmd=club&canshu=deleteclub&sid=$sid");
        $renzhicmd = $encode->encode("cmd=club&canshu=renzhi&sid=$sid");
        $setting = $encode->encode("cmd=club&canshu=setting&sid=$sid");
        $apply = $encode->encode("cmd=club&canshu=audit&sid=$sid");
        $edit = $encode->encode("cmd=club&canshu=edit&sid=$sid");
        $qiandao = $encode->encode("cmd=club&canshu=qiandao&sid=$sid");
        $gongxian = $encode->encode("cmd=club&canshu=gongxian&sid=$sid");
        $shangdian = $encode->encode("cmd=club&canshu=shangdian&sid=$sid");
        $cangku = $encode->encode("cmd=club&canshu=cangku&sid=$sid");
        $xujing = $encode->encode("cmd=club&canshu=xujing&sid=$sid");
        $tichu = $encode->encode("cmd=club&canshu=tichu&sid=$sid&uclv=$clubplayer->uclv");
        $upgrade = $encode->encode("cmd=club&canshu=upgrade&sid=$sid");

        $clubmenu = "<a href='?cmd=$qiandao'>签到</a>";
        $clubmenu .= "<a href='?cmd=$gongxian'>贡献</a>";
        $clubmenu .= "<a href='?cmd=$shangdian'>商店</a>";
        $clubmenu .= "<a href='?cmd=$cangku'>仓库</a><br/>";
        $clubmenu .= "<a href='?cmd=$xujing'>虚境</a>";
        if ($clubplayer->uclv <= 3) {
            $clubmenu .= "<a href='?cmd=$apply'>审核</a>";
            $clubmenu .= "<a href='?cmd=$tichu'>踢出</a>";
        }
        if ($clubplayer->uclv <= 2) {
            $clubmenu .= "<a href='?cmd=$renzhicmd'>任职</a><br/>";
            $clubmenu .= "<a href='?cmd=$edit'>修改</a>";
            $clubmenu .= "<a href='?cmd=$upgrade'>升级</a>";
            $clubmenu .= "<a href='?cmd=$setting'>设置</a>";
        }
        if ($clubplayer->uclv==1){
            $clubmenu .= "<a href='?cmd=$deleteclub'>解散</a>";
        } else {
            $clubmenu .= "<a href='?cmd=$outclub'>判出</a>";
        }
    }else{
        $joincmd = $encode->encode("cmd=club&clubid=$clubid&canshu=joinclub&sid=$sid");
        $clubmenu = "<a href='?cmd=$joincmd'>申请加入</a>";
    }
    noclub:
    $club = \player\getclub($clubid,$dblj);
    $cboss = \player\getplayer1($club->clubno1,$dblj);
    $cbosscmd = $encode->encode("cmd=getplayerinfo&uid=$club->clubno1&sid=$sid");
    $clublist = $encode->encode("cmd=clublist&sid=$sid");
    
    $sql="select uid,uclv,clubexp from clubplayer WHERE clubid=$clubid ORDER BY uclv ASC ";
    $ret = $dblj->query($sql);
    $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);
    foreach ($retuid as $uiditem){
        $uid = $uiditem['uid'];
        $uclv = $uiditem['uclv'];
        $clubexp = $uiditem['clubexp'];
        $chenhao = "[弟子]";
        switch ($uclv){
            case 1:
                $chenhao = "[掌门]";
                break;
            case 2:
                $chenhao = "[副掌门]";
                break;
            case 3:
                $chenhao = "[长老]";
                break;
            case 4:
                $chenhao = "[执事]";
                break;
            case 5:
                $chenhao = "[精英]";
                break;
        }
        $otherplayer = \player\getplayer1($uid,$dblj);
        $ucmd = $encode->encode("cmd=getplayerinfo&uid=$uid&sid=$player->sid");
        $playerlist .= "<a href='?cmd=$ucmd'>{$chenhao}{$otherplayer->uname}</a>({$clubexp})<br/>";
    }

    $playercount = \player\getclubplayer_count($club->clubid, $dblj);

    $clubhtml =<<<HTML
门派:$club->clubname<br/>
创建者:<a href="?cmd=$cbosscmd" >$cboss->uname</a><br/>
门派等级:$club->clublv<br/>
门派资金:灵石[$club->clubyxb] 极品灵石[$club->clubczb]<br/>
建设度:$club->clubexp/$club->clubupexp<br/>
门派介绍:<br/>$club->clubinfo<br/>
成员数量:$playercount/$club->clubmxsum<br/>
$clubmenu
<br/><br/>
$gongneng
门派成员：<br/>
$playerlist
<br/>
<a href="?cmd=$clublist">门派列表</a><br/><br/>
<button onClick="javascript :history.back(-1);">返回上一页</button><br/> 
<a href="?cmd=$gonowmid">返回游戏</a>
HTML;
    exit($clubhtml);

}

if (!$clubplayer){
    $clublist = $encode->encode("cmd=clublist&sid=$sid");
    $clubhtml =<<<HTML
你现在还没有门派呢！<br/>
<a href="?cmd=$clublist">加入门派</a>
<br/>
<br/>
<a href="?cmd=$gonowmid">返回游戏</a> 
HTML;

}
echo $clubhtml;