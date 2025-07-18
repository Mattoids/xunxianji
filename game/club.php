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
                    $sql="select uid, clubexp from clubplayer WHERE clubid=$clubplayer->clubid AND uclv > $clubplayer->uclv";
                    $ret = $dblj->query($sql);
                    $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($retuid as $uiditem){
                        $uid = $uiditem['uid'];
                        if ($uid==$player->uid){
                            continue;
                        }
                        $otherplayer = \player\getplayer1($uid,$dblj);
                        $ucmd = $encode->encode("cmd=club&canshu=zhiwei&zhiwei=$zhiwei&uid=$uid&sid=$sid");
                        $playerlist .= "<a href='?cmd=$ucmd'>{$otherplayer->uname}({$uiditem['clubexp']})</a><br/>";

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
            $gongneng .= "<form><input type='hidden' name='cmd' value='club'><input type='hidden' name='canshu' value='editinfo'><input type='hidden' name='sid' value='$sid'>门派说明:<br/><textarea name='clubinfo' style='height: 80px'>$club->clubinfo</textarea><br/><input type='submit' value='确认修改'></form><br/>";
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
            $qiandao = $encode->encode("cmd=club&canshu=qiandaorun&sid=$sid");
            $gongneng = "=========签到=========<br/>";

            $gongneng .= "签到奖励与门派等级<br/>和贡献度有关，门派<br/>等级和贡献度越高奖<br/>励越丰富！<br/><br/>";

            $date = date('Y-m-d');
            if (!isset($clubplayer->qiandao) || $clubplayer->qiandao != $date) {
                $gongneng .= "<a href='?cmd=$qiandao'>确认签到</a><br/><br/>";
            } else {
                $gongneng .= "你今天已经签过到了！<br/><br/>";
            }

            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "qiandaorun":
            $gongneng = "=========签到=========<br/>";
            $club = \player\getclub($clubplayer->clubid,$dblj);
            $date = date('Y-m-d');
            if (!isset($clubplayer->qiandao) || $clubplayer->qiandao != $date) {
                $sql="update clubplayer set qiandao='$date' WHERE sid='$sid'";
                $dblj->exec($sql);

                $gongneng .= "签到成功<br/><br/>";

                // 奖励
                $gongneng .= \player\getconfigdata("clubqiandao", $sid, $dblj, $club->clublv * 10, 1);

            } else {
                $gongneng .= "你今天已签到，请不要重复签到！<br/>";
            }
            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
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
        case "gongxian":
            $gxyxb1 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=80&uyxb=100");
            $gxyxb2 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=200&uyxb=200");
            $gxyxb3 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=600&uyxb=500");
            $gxczb1 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=230&uczb=100");
            $gxczb2 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=580&uczb=200");
            $gxczb3 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=1300&uczb=500");
            $gongneng = "=========门派贡献=========<br/><br/>";

            if (isset($gongxian)) {
                $date = date('Y-m-d');
                if (isset($clubplayer->gongxian) || $clubplayer->gongxian = $date) {
                    $gongnenghtml = "你今天已经贡献过了<br/><br/>";
                } else {
                    $result = false;
                    if (isset($uyxb)) {
                        $result = \player\changeyxb(2, $uyxb, $sid, $dblj);
                    }
                    if (isset($uczb)) {
                        $result = \player\changeczb(2, $uczb, $sid, $dblj);
                    }

                    if ($result) {
                        $sql="update clubplayer set gongxian='$date', clubexp=clubexp+$gongxian WHERE sid='$sid'";
                        $dblj->exec($sql);

                        $sql="update club set clubexp=clubexp+$gongxian WHERE clubid=$clubplayer->clubid";
                        $dblj->exec($sql);

                        \player\changeexp($sid, $dblj, $gongxian);

                        $gongnenghtml = "获得修为：$gongxian<br/>获得贡献点：$gongxian<br/>获得门派建设度：$gongxian<br/><br/>";
                    } else {
                        $gongnenghtml = "剩余灵石或极品灵石不足！<br/><br/>";
                    }

                    $clubplayer = \player\getclubplayer_once($sid,$dblj);
                }
            }

            $gongneng .= "我的贡献点：$clubplayer->clubexp<br/>";
            $gongneng .= "<a href='?cmd=$gxyxb1'>贡献100灵石</a>/<a href='?cmd=$gxczb1'>贡献100极品灵石</a><br/>";
            $gongneng .= "<a href='?cmd=$gxyxb2'>贡献200灵石</a>/<a href='?cmd=$gxczb2'>贡献200极品灵石</a><br/>";
            $gongneng .= "<a href='?cmd=$gxyxb3'>贡献500灵石</a>/<a href='?cmd=$gxczb3'>贡献500极品灵石</a><br/><br/>";
            $gongneng .= $gongnenghtml;

            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);

        case "shangdian":
            $club = \player\getclub($clubplayer->clubid,$dblj);
            $gongneng = "=========门派商店=========<br/>";
            if (isset($csid) && isset($sum)) {
                $clubstore = \player\getclubstore($csid, $dblj);
                $price = $clubstore->price * $sum;
                if (\player\changclubexp(2, $price, $sid, $dblj)) {
                    switch ($clubstore->type) {
                        case 1:
                            \player\adddj($sid, $clubstore->wpid, $sum, $dblj);
                            break;
                        case 2:
                            \player\addyaopin($sid, $clubstore->wpid, $sum, $dblj);
                            break;
                        case 3:
                            \player\addzb($sid, $clubstore->wpid, $dblj);
                            break;
                        case 4:
                            break;
                    }
                    $gongneng .= "购买成功！</br>";
                    $clubplayer = \player\getclubplayer_once($sid, $dblj);
                } else {
                    $gongneng .= "贡献点不足，无法购买！</br>";
                }
            }

            $gongneng .= "我的贡献点：$clubplayer->clubexp<br/><br/>";
            $gxyxb1 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=80");
            $sql="select * from clubstore WHERE clublv <= $club->clublv";
            $ret = $dblj->query($sql);
            $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);

            foreach ($retuid as $item) {
                $name = "";
                switch ($item['type']) {
                    case 1:
                        $shangpin = $encode->encode("cmd=djinfo&djid=$item[wpid]&sid=$sid&isstore=1");
                        $wupin = \player\getdaoju($item['wpid'], $dblj);
                        $name = $wupin->djname;
                        break;
                    case 2:
                        $shangpin = $encode->encode("cmd=ypinfo&ypid=$item[wpid]&sid=$sid&isstore=1");
                        $wupin = \player\getyaopinonce($item['wpid'], $dblj);
                        $name = $wupin->ypname;
                        break;
                    case 3:
                        $shangpin = $encode->encode("cmd=zbinfo&zbid=$item[wpid]&sid=$sid&isstore=1");
                        $wupin = \player\getzbkzb($item['wpid'], $dblj);
                        $name = $wupin->zbname;
                        break;
                    case 4:
                        break;
                }

                $goumai1 = $encode->encode("cmd=club&canshu=shangdian&sid=$sid&csid=$item[csid]&sum=1");
                $goumai5 = $encode->encode("cmd=club&canshu=shangdian&sid=$sid&csid=$item[csid]&sum=5");
                $goumai10 = $encode->encode("cmd=club&canshu=shangdian&sid=$sid&csid=$item[csid]&sum=10");
                if ($item['type'] == 3 || $item['type'] ==4) {
                    $gongneng .= "<a href='?cmd=$shangpin'>$name--$item[price]</a><a href='?cmd=$goumai1'>购买1</a> 购买5 购买10<br/>";
                } else {
                    $gongneng .= "<a href='?cmd=$shangpin'>$name--$item[price]</a><a href='?cmd=$goumai1'>购买1</a><a href='?cmd=$goumai5'>购买5</a><a href='?cmd=$goumai10'>购买10</a><br/>";
                }
            }

            $gongneng .= "<br/>";
            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);

        case "cangku":
            $gongneng = "=========门派仓库=========<br/>";

            if (isset($cwid) && isset($ispay)) {
                try{
                    $dblj->setAttribute(PDO::ATTR_AUTOCOMMIT, 0);
                    $dblj->setAttribute(PDO::ATTR_ERRMODE,  PDO::ERRMODE_EXCEPTION);
                    $dblj->beginTransaction();

                    $clubwarehouse = \player\getclubwarehouse($cwid, $dblj);
                    if (!$clubwarehouse) {
                        throw new PDOException("商品已经库存不足！<br/>");
                    }

                    $attribute = json_decode($clubwarehouse->attribute, true);
                    if (!\player\changclubexp(2, $clubwarehouse->price, $sid, $dblj)) {
                        throw new PDOException("贡献点不足，兑换失败！<br/>");
                    }

                    $sql = "delete from `clubwarehouse` WHERE cwid=$cwid";
                    $affected_rows=$dblj->exec($sql);
                    if (!$affected_rows) {
                        throw new PDOException("出货失败！<br/>");
                    }

                    switch ($clubwarehouse->type) {
                        case "zb":
                            $sql = "UPDATE `playerzhuangbei` SET sid='$sid', uid=$player->uid WHERE zbnowid={$attribute['zbnowid']}";
                            $affected_rows=$dblj->exec($sql);
                            if (!$affected_rows) {
                                throw new PDOException("出货失败！<br/>");
                            }
                            break;
                        case "dj":
                            $getdjsql="select * from playerdaoju where djid='{$attribute['djid']}' and sid='$sid'";
                            $getdjob = $dblj->query($getdjsql);
                            $cxRet = $getdjob->fetch(\PDO::FETCH_ASSOC);
                            if(!$cxRet){
                                $sql = "replace into `playerdaoju`(djname,djsum,uid,sid,djid,djinfo) VALUES('{$attribute['djname']},{$attribute->num} ,'$player->uid','$sid',{$attribute['djid']},'{$attribute['djinfo']}')";
                            }else{
                                $sql = "update `playerdaoju` set djsum = djsum + {$clubwarehouse->num} WHERE djid='{$attribute['djid']}' and sid='$sid'";
                            }
                            $affected_rows=$dblj->exec($sql);
                            if (!$affected_rows) {
                                throw new PDOException("出货失败！<br/>");
                            }
                            break;
                        case "cw":
                            $sql = "UPDATE `playerchongwu` SET sid='$sid' WHERE cwid={$attribute['cwid']}";
                            $affected_rows=$dblj->exec($sql);
                            if (!$affected_rows) {
                                throw new PDOException("出货失败！<br/>");
                            }
                            break;
                    }

                    echo "兑换成功！<br/>";
                    $dblj->commit();//交易成功就提交
                } catch (PDOException $e) {
                    echo $e->getMessage();
                    $dblj->rollBack();
                }
                $dblj->setAttribute(PDO::ATTR_AUTOCOMMIT, 1);//关闭
                $clubplayer = \player\getclubplayer_once($sid, $dblj);
            }

            if ($clubplayer->uclv <= 3) {
                $addcangku = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&type=zb&page=1");
                $gongneng .= "<a href='?cmd=$addcangku'>添加物品</a><br/>";
            }

            $gongneng .= "我的贡献点：$clubplayer->clubexp<br/><br/>";
            $gxyxb1 = $encode->encode("cmd=club&canshu=gongxian&sid=$sid&gongxian=80");
            $sql="select * from clubwarehouse WHERE clubid = $clubplayer->clubid AND uclv >= $clubplayer->uclv";
            $ret = $dblj->query($sql);
            $retuid = $ret->fetchAll(PDO::FETCH_ASSOC);

            foreach ($retuid as $item) {
                $attribute = json_decode($item['attribute'], true);
                $duihuan = $encode->encode("cmd=club&canshu=cangku&sid=$sid&cwid={$item['cwid']}&ispay=1");
                switch ($item['type']) {
                    case "zb":
                        $zhuangbeicmd = $encode->encode("cmd=zbinfo&zbid={$attribute['zbid']}&sid=$sid&isstore=1");
                        $gongneng .= "[装备]<a href='?cmd=$zhuangbeicmd'>{$attribute['zbname']}</a> 兑换价格：{$item['price']} | <a href='?cmd=$duihuan'>兑换</a><br/>";
                        break;
                    case "dj":
                        $daojucmd = $encode->encode("cmd=djinfo&djid={$attribute['djid']}&sid=$sid&isstore=1");
                        $gongneng .= "[道具]<a href='?cmd=$daojucmd'>{$attribute['djname']}*{$item['num']}</a> 兑换价格：{$item['price']} | <a href='?cmd=$duihuan'>兑换</a><br/>";
                        break;
                    case "cw":
                        $chongwucmd = $encode->encode("cmd=chongwu&cwid=$attribute[cwid]&canshu=cwinfo&sid=$sid&isstore=1");
                        $gongneng .= "[宠物]<a href='?cmd=$chongwucmd'>{$attribute['cwname']}</a> 兑换价格：{$item['price']} | <a href='?cmd=$duihuan'>兑换</a><br/>";
                        break;
                }
            }

            $gongneng .= "<br/>";
            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "addcangku":
            if (isset($page)) {
                $zhuagnbei = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&type=zb&page=$page");
                $daojucmd = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&type=dj&page=$page");
                $chongwucmd = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&type=cw&page=$page");
                if (isset($type)) {
                    $where = [];
                    switch ($type) {
                        case 'zb':
                            $gongneng = "【装备|<a href='?cmd=$daojucmd'>道具</a>|<a href='?cmd=$chongwucmd'>宠物</a>】<br/>";
                            $where = ['sid' => $sid, 'zbnowid' => ['not_in' => [$player->tool1, $player->tool2, $player->tool3, $player->tool4, $player->tool5, $player->tool6]]];
                            $result = \player\getpage('playerzhuangbei', $page, 10, $where, $dblj);

                            foreach ($result->list as $item) {
                                $addck = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&wpid=$item[zbnowid]&type=$type");
                                $shangpin = $encode->encode("cmd=zbinfo&zbid=$item[zbid]&sid=$sid&isstore=1");
                                $gongneng .= "<a href='?cmd=$shangpin'>$item[zbname]</a> | <a href='?cmd=$addck'>加入仓库</a><br/>";
                            }
                            break;
                        case 'dj':
                            $gongneng = "【<a href='?cmd=$zhuagnbei'>装备</a>|道具|<a href='?cmd=$chongwucmd'>宠物</a>】<br/>";
                            $where = ['sid' => $sid];
                            $result = \player\getpage('playerdaoju', $page, 10, $where, $dblj);

                            foreach ($result->list as $item) {
                                $addck = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&wpid=$item[djid]&type=$type");
                                $shangpin = $encode->encode("cmd=djinfo&djid=$item[djid]&sid=$sid&isstore=1");
                                $gongneng .= "<a href='?cmd=$shangpin'>{$item['djname']}*{$item['djsum']}</a> | <a href='?cmd=$addck'>加入仓库</a><br/>";
                            }
                            break;
                        case 'cw':
                            $gongneng = "【<a href='?cmd=$zhuagnbei'>装备</a>|<a href='?cmd=$daojucmd'>道具</a>|宠物】<br/>";
                            $where = ['sid' => $sid, 'cwid' => ['value' => $player->cw, 'operator' => '!=']];
                            $result = \player\getpage('playerchongwu', $page, 10, $where, $dblj);

                            foreach ($result->list as $item) {
                                $addck = $encode->encode("cmd=club&canshu=addcangku&sid=$sid&wpid=$item[cwid]&type=$type");
                                $chongwu = $encode->encode("cmd=chongwu&cwid=$item[cwid]&canshu=cwinfo&sid=$sid&isstore=1");
                                $gongneng .= "<a href='?cmd=$chongwu'>$item[cwname]</a> | <a href='?cmd=$addck'>加入仓库</a><br/>";
                            }
                            break;
                    }
                }
            }
            if (isset($wpid) && isset($type)) {
                $gongneng = "=========添加物品=========<br/><br/>";

                switch ($type) {
                    case 'zb':
                        $shangpin = $encode->encode("cmd=zbinfo&zbid=$wpid&sid=$sid&isstore=1");
                        $wupin = \player\getzb($wpid, $dblj);
                        $gongneng .= "正在添加：<a href='?cmd=$shangpin'>{$wupin->zbname}</a><br/><br/>";
                        $gongnenghtml = "<input type='hidden' name='num' value='1'/>";
                        $wpid = $wupin->zbnowid;
                        break;
                    case 'dj':
                        $shangpin = $encode->encode("cmd=djinfo&djid=$wpid&sid=$sid&isstore=1");
                        $wupin = \player\getplayerdaoju($sid, $wpid, $dblj);
                        $gongneng .= "正在添加：<a href='?cmd=$shangpin'>{$wupin->djname}*{$wupin->djsum}</a><br/><br/>";
                        $gongnenghtml = "添加数量: <input type='text' name='num'/><br/>";
                        $wpid = $wupin->djnowid;
                        break;
                    case 'cw':
                        $shangpin = $encode->encode("cmd=chongwu&cwid=$wpid&canshu=cwinfo&sid=$sid&isstore=1");
                        $wupin = \player\getchongwu($wpid, $dblj);
                        $gongneng .= "正在添加：<a href='?cmd=$shangpin'>{$wupin->cwname}</a><br/><br/>";
                        $gongnenghtml = "<input type='hidden' name='num' value='1'/>";
                        $wpid = $wupin->cwid;
                        break;
                }

                if (isset($price) && isset($num)) {
                    try {
                        $dblj->setAttribute(PDO::ATTR_AUTOCOMMIT, 0);
                        $dblj->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                        $dblj->beginTransaction();

                        $attribute = str_replace('\\', '\\\\', json_encode($wupin, true));
                        $sql = "insert into `clubwarehouse` (`clubid`, `type`, `num`, `price`, `uclv`, `attribute`) VALUES ($clubplayer->clubid, '{$type}', $num, $price, 6, '{$attribute}')";
                        $affected_rows = $dblj->exec($sql);
                        if (!$affected_rows){
                            throw new PDOException("添加进仓库失败！<br/>");//那个错误抛出异常
                        }

                        switch ($type) {
                            case 'zb':
                                $sql="UPDATE `playerzhuangbei` SET sid='', uid=0 WHERE zbnowid = $wpid";
                                $affected_rows=$dblj->exec($sql);
                                if (!$affected_rows){
                                    throw new PDOException("装备传送失败<br/>");//那个错误抛出异常
                                }
                                break;
                            case 'dj':
                                $sql = "update `playerdaoju` set djsum= djsum - $num WHERE djnowid = $wpid AND djsum >= $num AND uid = $player->uid AND sid='$sid'";
                                $affected_rows=$dblj->exec($sql);
                                if (!$affected_rows){
                                    throw new PDOException("<div class='warn'>你身上的道具不足</div><br/>");//那个错误抛出异常
                                }
                                break;
                            case 'cw':
                                $sql="UPDATE `playerchongwu` SET sid='' WHERE cwid = $wpid";
                                $affected_rows=$dblj->exec($sql);
                                if (!$affected_rows){
                                    throw new PDOException("宠物传送失败<br/>");//那个错误抛出异常
                                }
                                break;
                        }

                        echo "添加成功<br/>";
                        $dblj->commit();
                    } catch (PDOException $e) {
                        echo $e->getMessage();
                        $dblj->rollBack();
                    }
                    $dblj->setAttribute(PDO::ATTR_AUTOCOMMIT, 1);//关闭
                }

                $gongneng .= "<form>";
                $gongneng .= "<input type='hidden' name='cmd' value='club'/>";
                $gongneng .= "<input type='hidden' name='canshu' value='addcangku'/>";
                $gongneng .= "<input type='hidden' name='sid' value='$sid'/>";
                $gongneng .= "<input type='hidden' name='type' value='$type'/>";
                $gongneng .= "<input type='hidden' name='wpid' value='$wpid'/>";
                $gongneng .= $gongnenghtml;
                $gongneng .= "兑换价格: <input type='text' name='price'/>";
                $gongneng .= "<br/><br/>";
                $gongneng .= "<input type='submit' value='加入仓库'>";
                $gongneng .= "</form>";

                $gongneng .= "<br/>";
            }
            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "xujing":
            $gongneng = "=========虚境=========<br/><br/>";

            $club = \player\getclub($clubplayer->clubid,$dblj);
            $clubxujing = \player\getclubxujing_all($club->clublv, $dblj);

            foreach ($clubxujing as $item) {
                $goxujing = $encode->encode("cmd=club&canshu=goxujing&sid=$sid&xjid={$item['xjid']}");
                $gongneng .= "<a href='?cmd=$goxujing'>{$item['xjname']}</a><br/>";
            }

            $gongneng .= "<br/>";

            $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
            exit($gongneng);
        case "goxujing":
            if (isset($xjid)) {
                $clubxujing = \player\getclubxujing($xjid, $dblj);
                $gongneng = "========={$clubxujing->xjname}=========<br/><br/>";

                $date = date("Y-m-d");
                $clubxujingplayer = \player\getclubxujingplayer($sid, $xjid, $dblj);
                if ((($clubxujingplayer->date != $date || ($clubxujingplayer->num < $clubxujing->challenge && $clubxujing->challenge > 0)) && $clubxujing->duplicates == 0) ||
                    ($clubxujing->duplicates == 1 && !$clubxujingplayer)) {
                    if (!$clubxujingplayer) {
                        $clubxujingplayer->num = 0;
                    }
                    if($clubxujing->challenge > 1) {
                        $gongneng .= "({$clubxujingplayer->num}/{$clubxujing->challenge})</br>";
                    }
                    $goxujing = $encode->encode("cmd=club&canshu=xujingplayer&sid=$sid&xjid={$xjid}&xujing=1");
                    $gongneng .= "<a href='?cmd=$goxujing'>进入虚境</a>";
                } else {
                    if ($clubxujing->duplicates == 0) {
                        $gongneng .= "今天";
                    }
                    $gongneng .= "已经挑战过秘境!<br/><br/>";
                }

                $gongneng .= "<div style='width: 180px;margin:auto;'>{$clubxujing->xjinfo}</div><br/>";

                $gongneng .= "<button onClick='javascript :history.back(-1);'>返回上一页</button><br/><a href='?cmd=$gonowmid'>返回游戏</a>";
                exit($gongneng);
            }
            break;
        case "xujingplayer":
            if (isset($xjid)) {
                $clubxujingplayer = \player\getclubxujingplayer($sid, $xjid, $dblj);
                if (isset($xujing) && $xujing == 1) {
                    $date = date('Y-m-d');
                    if (!$clubxujingplayer) {
                        $sql = "insert into `clubxujingplayer` (`sid`, `xjid`, `step`, `date`, `num`) VALUES  ('$sid', $xjid, 1, '{$date}', 1)";
                        $dblj->exec($sql);
                    } else {
                        if ($clubxujingplayer->date == $date) {
                            $num = $clubxujingplayer->num + 1;
                            $step = $clubxujingplayer->step;
                        } else {
                            $num = 1;
                            $step = 1;
                        }
                        $sql = "update `clubxujingplayer` set date='{$date}', num = {$num}, step = {$step} where sid = '{$sid}' AND xjid = $xjid";
                        $dblj->exec($sql);
                    }
                    $clubxujingplayer = \player\getclubxujingplayer($sid, $xjid, $dblj);
                }

                $clubxujinginfo = \player\getclubxujinginfo($xjid, $dblj, $clubxujingplayer->step);
                if ($clubxujinginfo->menu) {
                    $muban = iconv('UTF-8','UTF-8',$clubxujinginfo->menu);
                    if (file_exists("./game/menu/{$clubxujinginfo->menu}")){
                        include "./game/menu/{$clubxujinginfo->menu}";
                    }
                }

                switch ($clubxujinginfo->type) {
                    case "boss":
                        break;
                    case "renwu":
                        $tasklist = explode(',', $clubxujinginfo->xjsj);
                        $tasknum = mt_rand(0 ,count($tasklist) - 1);
                        $rwcmd = $encode->encode("cmd=task&canshu=jieshou&rwid={$tasklist[$tasknum]}&sid=$sid&nid=0");
                        header("Location: ?cmd=$rwcmd");
                        break;
                    case "mid":
                        $gomid = $encode->encode("cmd=gomid&newmid={$clubxujinginfo->xjsj}&sid=$sid");;
                        header("Location: ?cmd=$gomid");
                        break;
                }
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