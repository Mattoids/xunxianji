<?php
namespace player;
class player
{
    var $uname;//昵称
    var $uid;
    var $sid;//sid
    var $ulv;//等级
    var $uyxb;//游戏币
    var $uczb;//充值币
    var $uexp;//经验
    var $umaxexp;//经验上限
    var $uhp;//生命
    var $umaxhp;//生命
    var $ugj;//攻击
    var $ufy;//防御
    var $ubj;//暴击
    var $uxx;//吸血
    var $uwx;//五行
    var $usex;//性别
    var $vip;//vip
    var $nowmid;//当前地图
    var $endtime;
    var $tool1;
    var $tool2;
    var $tool3;
    var $tool4;
    var $tool5;
    var $tool6;
    var $jingjie;
    var $sfxl;
    var $sfzx;
    var $xiuliantime;
    var $yp1;
    var $yp2;
    var $yp3;
    var $cw;
    var $jn1;
    var $jn2;
    var $jn3;
    var $ispvp;
    var $cengci;
    var $autozd;
    var $autoxg;
    var $autoxc;
}
function getplayer($sid,$dblj){
    $player = new player();
    $sql="select * from game1 where sid='$sid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('uname',$player->uname);
    $cxjg->bindColumn('sid',$player->sid);
    $cxjg->bindColumn('uid',$player->uid);
    $cxjg->bindColumn('ulv',$player->ulv);
    $cxjg->bindColumn('uyxb',$player->uyxb);
    $cxjg->bindColumn('uczb',$player->uczb);
    $cxjg->bindColumn('uexp',$player->uexp);
    $cxjg->bindColumn('uhp',$player->uhp);
    $cxjg->bindColumn('umaxhp',$player->umaxhp);
    $cxjg->bindColumn('ugj',$player->ugj);
    $cxjg->bindColumn('ufy',$player->ufy);
    $cxjg->bindColumn('ubj',$player->ubj);
    $cxjg->bindColumn('uxx',$player->uxx);
    $cxjg->bindColumn('uwx',$player->uwx);
    $cxjg->bindColumn('usex',$player->usex);
    $cxjg->bindColumn('vip',$player->vip);
    $cxjg->bindColumn('nowmid',$player->nowmid);
    $cxjg->bindColumn('endtime',$player->endtime);
    $cxjg->bindColumn('tool1',$player->tool1);
    $cxjg->bindColumn('tool2',$player->tool2);
    $cxjg->bindColumn('tool3',$player->tool3);
    $cxjg->bindColumn('tool4',$player->tool4);
    $cxjg->bindColumn('tool5',$player->tool5);
    $cxjg->bindColumn('tool6',$player->tool6);
    $cxjg->bindColumn('sfxl',$player->sfxl);
    $cxjg->bindColumn('xiuliantime',$player->xiuliantime);
    $cxjg->bindColumn('yp1',$player->yp1);
    $cxjg->bindColumn('yp2',$player->yp2);
    $cxjg->bindColumn('yp3',$player->yp3);
    $cxjg->bindColumn('jn1',$player->jn1);
    $cxjg->bindColumn('jn2',$player->jn2);
    $cxjg->bindColumn('jn3',$player->jn3);
    $cxjg->bindColumn('cw',$player->cw);
    $cxjg->bindColumn('sfzx',$player->sfzx);
    $cxjg->bindColumn('ispvp',$player->ispvp);
    $cxjg->bindColumn('autozd',$player->autozd);
    $cxjg->bindColumn('autoxg',$player->autoxg);
    $cxjg->bindColumn('autoxc',$player->autoxc);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    if ($player->tool1!=0){
        $zhuangbei = getzb($player->tool1,$dblj);
        $player->ugj = $player->ugj + $zhuangbei->zbgj;
        $player->ufy = $player->ufy + $zhuangbei->zbfy;
        $player->ubj = $player->ubj + $zhuangbei->zbbj;
        $player->uxx = $player->uxx + $zhuangbei->zbxx;
        $player->umaxhp = $player->umaxhp + $zhuangbei->zbhp;
    }
    if ($player->tool2!=0){
        $zhuangbei = getzb($player->tool2,$dblj);
        $player->ugj = $player->ugj + $zhuangbei->zbgj;
        $player->ufy = $player->ufy + $zhuangbei->zbfy;
        $player->ubj = $player->ubj + $zhuangbei->zbbj;
        $player->uxx = $player->uxx + $zhuangbei->zbxx;
        $player->umaxhp = $player->umaxhp + $zhuangbei->zbhp;
    }
    if ($player->tool3!=0){
        $zhuangbei = getzb($player->tool3,$dblj);
        $player->ugj = $player->ugj + $zhuangbei->zbgj;
        $player->ufy = $player->ufy + $zhuangbei->zbfy;
        $player->ubj = $player->ubj + $zhuangbei->zbbj;
        $player->uxx = $player->uxx + $zhuangbei->zbxx;
        $player->umaxhp = $player->umaxhp + $zhuangbei->zbhp;
    }
    if ($player->tool4!=0){
        $zhuangbei = getzb($player->tool4,$dblj);
        $player->ugj = $player->ugj + $zhuangbei->zbgj;
        $player->ufy = $player->ufy + $zhuangbei->zbfy;
        $player->ubj = $player->ubj + $zhuangbei->zbbj;
        $player->uxx = $player->uxx + $zhuangbei->zbxx;
        $player->umaxhp = $player->umaxhp + $zhuangbei->zbhp;
    }
    if ($player->tool5!=0){
        $zhuangbei = getzb($player->tool5,$dblj);
        $player->ugj = $player->ugj + $zhuangbei->zbgj;
        $player->ufy = $player->ufy + $zhuangbei->zbfy;
        $player->ubj = $player->ubj + $zhuangbei->zbbj;
        $player->uxx = $player->uxx + $zhuangbei->zbxx;
        $player->umaxhp = $player->umaxhp + $zhuangbei->zbhp;
    }
    if ($player->tool6!=0){
        $zhuangbei = getzb($player->tool6,$dblj);
        $player->ugj = $player->ugj + $zhuangbei->zbgj;
        $player->ufy = $player->ufy + $zhuangbei->zbfy;
        $player->ubj = $player->ubj + $zhuangbei->zbbj;
        $player->uxx = $player->uxx + $zhuangbei->zbxx;
        $player->umaxhp = $player->umaxhp + $zhuangbei->zbhp;
    }
    if ($player->cw!=0) {
        $cw = getchongwu($player->cw,$dblj);
        $player->uxx = $player->uxx + $cw->cwxx;
    }
    $rangeslv = array(0, 30, 50, 70, 80, 90, 100, 110);
    $rangesexp = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);
    $playernextlv = $player->ulv + 1;
    $rangesjj = array('练气', '筑基', '金丹', '元婴', '化神', '炼虚', '合体', '大乘');
    for ($i=0;$i < count($rangeslv);$i++){
        if ($player->ulv >= $rangeslv[$i] && $player->ulv < $rangeslv[$i+1]){
            $rangesjd = array('一','二','三','四','五','六','七','八','九','十');
            $djc = $player->ulv - $rangeslv[$i];
            $jds = ($rangeslv[$i+1]-$rangeslv[$i])/10;
            $jieduan = floor($djc/$jds);
            $jd = $rangesjd[$jieduan];
            $player->jingjie = $rangesjj[$i];
            $player->cengci = $jd.'层';
            $player->umaxexp = $playernextlv*($playernextlv+round($playernextlv/2))*12*$rangesexp[$i]+$playernextlv;
            break;
        }

    }
    return $player;
}
function getplayer1($uid,$dblj){
    $player = new player();
    $sql="select * from game1 where uid='$uid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('sid',$player->sid);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    $player = getplayer($player->sid,$dblj);
    return $player;
}

class guaiwu
{
    var $gname;//昵称
    var $ginfo;
    var $gsex;
    var $gzb;//装备
    var $dljv;//装备几率
    var $gdj;//道具
    var $djjv;//道具几率
    var $gyp;//药品
    var $ypjv;//药品几率
    var $gid;
    var $sid;
    var $glv;
    var $gexp;//经验
    var $cwgexp;//经验
    var $ghp;//生命
    var $gmaxhp;
    var $ggj;//攻击
    var $gfy;//防御
    var $gbj;//暴击
    var $gxx;//吸血
    var $gyid;
    var $jingjie;
}

function getguaiwu($gid,$dblj){//获取怪物
    $guaiwu = new guaiwu();

    $sql = "select * from midguaiwu where id = $gid";
    $cxjg = $dblj->query($sql);

    $cxjg->bindColumn('gname',$guaiwu->gname);
    $cxjg->bindColumn('id',$guaiwu->gid);
    $cxjg->bindColumn('sid',$guaiwu->sid);
    $cxjg->bindColumn('glv',$guaiwu->glv);
    $cxjg->bindColumn('gexp',$guaiwu->gexp);
    $cxjg->bindColumn('ghp',$guaiwu->ghp);
    $cxjg->bindColumn('gmaxhp',$guaiwu->gmaxhp);
    $cxjg->bindColumn('ggj',$guaiwu->ggj);
    $cxjg->bindColumn('gfy',$guaiwu->gfy);
    $cxjg->bindColumn('gbj',$guaiwu->gbj);
    $cxjg->bindColumn('gxx',$guaiwu->gxx);
    $cxjg->bindColumn('gyid',$guaiwu->gyid);
    $cxjg->fetch(\PDO::FETCH_ASSOC);

    $rangeslv = array(0, 30, 50, 70, 80, 90, 100, 110);
    $rangesjj = array('练气', '筑基', '金丹', '元婴', '化神', '炼虚', '合体', '大乘');
    for ($i=0;$i < count($rangeslv);$i++){
        if ($guaiwu->glv >= $rangeslv[$i] && $guaiwu->glv < $rangeslv[$i+1]){
            $rangesjd = array('一','二','三','四','五','六','七','八','九','十');
            $djc = $guaiwu->glv - $rangeslv[$i];
            $jds = ($rangeslv[$i+1]-$rangeslv[$i])/10;
            $jieduan = floor($djc/$jds);
            $jd = $rangesjd[$jieduan];
            $guaiwu->jingjie = $rangesjj[$i].$jd.'层';
            break;
        }
    }

    return $guaiwu;
}
function getyguaiwu($gyid,$dblj){//获取怪物库怪物
    $guaiwu = new guaiwu();
    $sql = "select * from guaiwu where id=$gyid";
    $cxjg = $dblj->query($sql);
    if ($cxjg){
        $cxjg->bindColumn('gname',$guaiwu->gname);
        $cxjg->bindColumn('ginfo',$guaiwu->ginfo);
        $cxjg->bindColumn('gsex',$guaiwu->gsex);
        $cxjg->bindColumn('glv',$guaiwu->glv);
        $cxjg->bindColumn('gzb',$guaiwu->gzb);
        $cxjg->bindColumn('gdj',$guaiwu->gdj);
        $cxjg->bindColumn('ghp',$guaiwu->ghp);
        $cxjg->bindColumn('ggj',$guaiwu->ggj);
        $cxjg->bindColumn('gfy',$guaiwu->gfy);
        $cxjg->bindColumn('gbj',$guaiwu->gbj);
        $cxjg->bindColumn('gxx',$guaiwu->gxx);
        $cxjg->bindColumn('gyp',$guaiwu->gyp);
        $cxjg->bindColumn('dljv',$guaiwu->dljv);
        $cxjg->bindColumn('ypjv',$guaiwu->ypjv);
        $cxjg->bindColumn('djjv',$guaiwu->djjv);
        $cxjg->fetch(\PDO::FETCH_ASSOC);
    }
    return $guaiwu;
}


class clmid
{
    var $mname;//
    var $mgid;
    var $mid;//
    var $mnpc;//经验
    var $upmid;
    var $downmid;
    var $leftmid;
    var $rightmid;
    var $mgtime;
    var $midboss;
    var $ms;
    var $midinfo;
    var $mqy;
    var $playerinfo;
    var $ispvp;
}

function getmid($mid,$dblj){
    $clmid = new clmid();
    $sql = "select * from mid where mid='$mid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('mname',$clmid->mname);
    $cxjg->bindColumn('mgid',$clmid->mgid);
    $cxjg->bindColumn('mid',$clmid->mid);
    $cxjg->bindColumn('mup',$clmid->upmid);
    $cxjg->bindColumn('mdown',$clmid->downmid);
    $cxjg->bindColumn('mleft',$clmid->leftmid);
    $cxjg->bindColumn('mright',$clmid->rightmid);
    $cxjg->bindColumn('mnpc',$clmid->mnpc);
    $cxjg->bindColumn('mgtime',$clmid->mgtime);
    $cxjg->bindColumn('midboss',$clmid->midboss);
    $cxjg->bindColumn('ms',$clmid->ms);
    $cxjg->bindColumn('midinfo',$clmid->midinfo);
    $cxjg->bindColumn('mqy',$clmid->mqy);
    $cxjg->bindColumn('playerinfo',$clmid->playerinfo);
    $cxjg->bindColumn('ispvp',$clmid->ispvp);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $clmid;
}
function istupo($sid,$dblj){
    $player = getplayer($sid,$dblj);
    $rangeslv = array(0, 30, 50, 70, 80, 90, 100, 110);
    $playernextlv = $player->ulv + 1;
    $rangesjj = array('练气', '筑基', '金丹', '元婴', '化神', '炼虚', '合体', '大乘');
    for ($i=0;$i < count($playernextlv);$i++){
        if ($playernextlv >= $rangeslv[$i] && $playernextlv < $rangeslv[$i+1]){
            
            if($player->jingjie != $rangesjj[$i]){
                return 1;//阶段突破
            }
            $rangesjd = array('一','二','三','四','五','六','七','八','九','十');
            $djc = $playernextlv - $rangeslv[$i];
            $jds = ($rangeslv[$i+1]-$rangeslv[$i])/10;
            $jieduan = floor($djc/$jds);
            $jd = $rangesjd[$jieduan];
            if($player->cengci != $jd.'层'){
                return 2;//层次突破
            }
            return 0;
        }
    }
}
function changeexp($sid,$dblj,$exp){
    if (istupo($sid,$dblj) != 0){
        $player = getplayer($sid,$dblj);
        if($player->uexp >= $player->umaxexp){
            return;
        }
    }
    $sql = "update game1 set uexp = uexp + $exp where sid='$sid'";
    $ret = $dblj->exec($sql);
    if (istupo($sid,$dblj) == 0){
        upplayerlv($sid,$dblj);
    }
}

function clubchangeexp($sid,$dblj,$exp) {
    $clubplayer = getclubplayer_once($sid, $dblj);
    if (!$clubplayer) {
        return false;
    }
    $sql = "update `clubplayer` set clubexp = clubexp + $exp where sid='$sid'";
    $ret = $dblj->exec($sql);
    if (!$ret) {
        return false;
    }

    $club = getclub($clubplayer->clubid,$dblj);
    if (!$club) {
        return false;
    }
    $sql = "update `club` set clubexp = clubexp + $exp where clubid={$clubplayer->clubid}";
    $ret = $dblj->exec($sql);
    if (!$ret) {
        return false;
    }

    return true;
}

function upplayerlv($sid,$dblj){
    $player = getplayer($sid,$dblj);
    if ($player->uexp >= $player->umaxexp){
        $sql = "update game1 set uexp = uexp - $player->umaxexp where sid='$sid'";
        $dblj->exec($sql);

        $rangeslv = array(1, 30, 50, 70, 80, 90, 100, 110);
        $rangesgj = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);
        $rangesfy = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);
        $rangeswx = array(2, 4, 6, 8, 10, 12, 14);
        $rangeshp = array(30, 50, 70, 90, 110, 130, 170);
        $playernextlv = $player->ulv + 1;

        for ($i=0;$i<count($rangeslv)-1;$i++){
            if ($playernextlv >= $rangeslv[$i] && $playernextlv < $rangeslv[$i+1]){
                $sql = "update game1 set ulv = ulv + 1,
                                           umaxhp = umaxhp + $rangeshp[$i],
                                           ugj = ugj + $rangesgj[$i],
                                           ufy = ufy + $rangesfy[$i],
                                           uwx = uwx + $rangeswx[$i]
                                           where sid='$sid'";
                break;
            }
        }
        $dblj->exec($sql);
    }
}

class npc{
    var $nid;
    var $nname;
    var $nsex;
    var $ninfo;
    var $taskid;
    var $muban;
}

function getnpc($nid,$dblj){
    $npc = new npc();
    $sql = "select * from npc where id = $nid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('nname',$npc->nname);
    $cxjg->bindColumn('id',$npc->nid);
    $cxjg->bindColumn('nsex',$npc->nsex);
    $cxjg->bindColumn('ninfo',$npc->ninfo);
    $cxjg->bindColumn('taskid',$npc->taskid);
    $cxjg->bindColumn('muban',$npc->muban);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $npc;
}
class zhuangbei{
    var $zbname;
    var $zbinfo;
    var $zbgj;
    var $zbfy;
    var $zbbj;
    var $zbxx;
    var $zbid;
    var $uid;
    var $zbnowid;
    var $qianghua;
    var $zbhp;
    var $zblv;
    var $tool;
}
function getzb($zbnowid,$dblj){
    $zhuangbei = new zhuangbei();
    $sql = "select * from playerzhuangbei where zbnowid = $zbnowid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('zbname',$zhuangbei->zbname);
    $cxjg->bindColumn('zbinfo',$zhuangbei->zbinfo);
    $cxjg->bindColumn('zbgj',$zhuangbei->zbgj);
    $cxjg->bindColumn('zbfy',$zhuangbei->zbfy);
    $cxjg->bindColumn('zbhp',$zhuangbei->zbhp);
    $cxjg->bindColumn('zbbj',$zhuangbei->zbbj);
    $cxjg->bindColumn('zbxx',$zhuangbei->zbxx);
    $cxjg->bindColumn('zbid',$zhuangbei->zbid);
    $cxjg->bindColumn('uid',$zhuangbei->uid);
    $cxjg->bindColumn('zbnowid',$zhuangbei->zbnowid);
    $cxjg->bindColumn('qianghua',$zhuangbei->qianghua);
    $cxjg->bindColumn('zblv',$zhuangbei->zblv);
    $cxjg->bindColumn('zbtool',$zhuangbei->tool);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $zhuangbei;
}
function getzbkzb($zbid,$dblj){
    $zb = new zhuangbei();
    $sql = "select * from zhuangbei WHERE zbid = $zbid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('zbname',$zb->zbname);
    $cxjg->bindColumn('zbinfo',$zb->zbinfo);
    $cxjg->bindColumn('zbgj',$zb->zbgj);
    $cxjg->bindColumn('zbfy',$zb->zbfy);
    $cxjg->bindColumn('zbhp',$zb->zbhp);
    $cxjg->bindColumn('zbbj',$zb->zbbj);
    $cxjg->bindColumn('zbxx',$zb->zbxx);
    $cxjg->bindColumn('zbid',$zb->zbid);
    $cxjg->bindColumn('zbtool',$zb->tool);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $zb;
}
function addzb($sid,$zbid,$dblj){
    $player = getplayer($sid,$dblj);
    $zb = getzbkzb($zbid,$dblj);
    $sql = "insert into playerzhuangbei(zbname,zbinfo,zbgj,zbfy,zbhp,zbbj,zbxx,zbid,uid,sid,zbtool) VALUES ('$zb->zbname','$zb->zbinfo','$zb->zbgj','$zb->zbfy','$zb->zbhp','$zb->zbbj','$zb->zbxx','$zb->zbid','$player->uid','$sid',$zb->tool)";
    $dblj->exec($sql);
    $ret = $dblj->lastInsertId();
    return $ret;
}


class daoju{
    var $djnowid;
    var $djname;
    var $djzl;
    var $djinfo;
    var $djid;
    var $djsum;//playerdaoju
    var $djyxb;
}
function adddj($sid,$djid,$djsum,$dblj){
    $player = getplayer($sid,$dblj);
    $sql = "select * from playerdaoju where sid='$sid' and djid = $djid";
    $cxjg = $dblj->query($sql);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    if ($ret){
        $sql = "update playerdaoju set djsum = djsum + $djsum where sid='$sid' and djid = $djid";
        $dblj->exec($sql);
    }else{
        $daoju = getdaoju($djid,$dblj);
        if ($daoju){
            $sql = "insert into playerdaoju(djname,djinfo,djzl,djid,djsum,sid,uid) VALUES ('$daoju->djname','$daoju->djinfo','$daoju->djzl','$daoju->djid',$djsum,'$sid','$player->uid')";
            $dblj->exec($sql);
        }
    }
    changerwyq1(1,$djid,$djsum,$sid,$dblj);
}

function changerwyq1($rwzl,$rwyq,$gaibian,$sid,$dblj){
    if ($rwzl == 1){
        $daoju = getplayerdaoju($sid,$rwyq,$dblj);
        $sql = "update playerrenwu set rwnowcount = $daoju->djsum WHERE sid='$sid' AND rwyq = $rwyq AND $rwzl = $rwzl AND rwzt = 1";
        $rwt = $dblj->exec($sql);
    }elseif($rwzl == 2){
        $sql="update playerrenwu set rwnowcount = rwnowcount + $gaibian WHERE sid = '$sid' AND rwyq = $rwyq AND $rwzl = $rwzl AND rwzt = 1";
        $rwt = $dblj->exec($sql);
    }
    $sql = "update playerrenwu set rwzt = 2 WHERE sid = '$sid' AND rwyq = '$rwyq' AND $rwzl= $rwzl AND rwnowcount >= rwcount AND rwzt = 1";
    $dblj->exec($sql);
}



function getplayerdaoju($sid,$djid,$dblj){
    $daoju = new daoju();
    $sql = "select * from playerdaoju where djid = $djid AND sid='$sid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('djname',$daoju->djname);
    $cxjg->bindColumn('djzl',$daoju->djzl);
    $cxjg->bindColumn('djinfo',$daoju->djinfo);
    $cxjg->bindColumn('djid',$daoju->djid);
    $cxjg->bindColumn('djsum',$daoju->djsum);
    $cxjg->bindColumn('djnowid',$daoju->djnowid);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    
    if ($ret){
        return $daoju;
    }else{
        return false;
    }

}

function deledjsum($djid,$djsum,$sid,$dblj){
    $daoju = \player\getplayerdaoju($sid,$djid,$dblj);

    if ($daoju){
        if ($daoju->djsum >= $djsum){
            $sql = "update playerdaoju set djsum = djsum - $djsum where sid='$sid' and djid = $djid";
            $dblj->exec($sql);
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

function getdaoju($djid,$dblj){
    $daoju = new daoju();
    $sql = "select * from daoju where djid = $djid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('djname',$daoju->djname);
    $cxjg->bindColumn('djzl',$daoju->djzl);
    $cxjg->bindColumn('djinfo',$daoju->djinfo);
    $cxjg->bindColumn('djid',$daoju->djid);
    $cxjg->bindColumn('djyxb',$daoju->djyxb);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    if ($ret){
        return $daoju;
    }else{
        return false;
    }
}
function changezbsx($upsx,$changeint,$zbnowid,$dblj){
    $sql = "update playerzhuangbei set $upsx= $upsx + $changeint WHERE zbnowid=$zbnowid";
    $dblj->exec($sql);
}

function upzbsx($zbnowid,$upsx,$sid,$dblj){
    $zbsx = '';
    $zbqh = '';
    $sql = "select * from playerzhuangbei WHERE zbnowid=$zbnowid AND sid='$sid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn("$upsx",$zbsx);
    $cxjg->bindColumn("qianghua",$zbqh);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    $djsum = $zbqh *3+1;
    $ret = \player\deledjsum(1,$djsum,$sid,$dblj);
    if ($ret){
        $upint = round($zbsx*0.05);
        if ($upint<1){
            $upint = 1;
        }
        $sjs = mt_rand(1,35);
        if ($sjs <= $zbqh){
            return 0;//失败
        }
        $sjs = mt_rand(1,30);
        if ($zbqh <= $sjs){
            \player\changezbsx($upsx,$upint,$zbnowid,$dblj);
            changezbsx('qianghua',1,$zbnowid,$dblj);
            return 1;
        }else{
            return 0;//失败
        }
    }else{
        return -1;//不足
    }
}
class yaopin{
    var $ypname;
    var $ypid;
    var $yphp;
    var $ypgj;
    var $ypfy;
    var $ypjg;
    var $ypbj;
    var $ypxx;
    var $ypsum;
    var $isyg;
}
function getyaopin($dblj){
    $sql = "select * from yaopin";
    $cxjg = $dblj->query($sql);
    $yaopin = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
    return $yaopin;
//    $cxjg->bindColumn('ypname',$yaopin->ypname);
//    $cxjg->bindColumn('yphp',$yaopin->yphp);
//    $cxjg->bindColumn('ypgj',$yaopin->ypgj);
//    $cxjg->bindColumn('ypfy',$yaopin->ypfy);
//    $cxjg->bindColumn('ypjg',$yaopin->ypjg);
//    $cxjg->bindColumn('ypbj',$yaopin->ypbj);
//    $cxjg->bindColumn('ypxx',$yaopin->ypxx);
}
function getyaopinonce($ypid,$dblj){
    $yaopin = new yaopin();
    $sql = "select * from yaopin WHERE ypid=$ypid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('ypname',$yaopin->ypname);
    $cxjg->bindColumn('yphp',$yaopin->yphp);
    $cxjg->bindColumn('ypgj',$yaopin->ypgj);
    $cxjg->bindColumn('ypfy',$yaopin->ypfy);
    $cxjg->bindColumn('ypxx',$yaopin->ypxx);
    $cxjg->bindColumn('ypjg',$yaopin->ypjg);
    $cxjg->bindColumn('ypbj',$yaopin->ypbj);
    $cxjg->bindColumn('ypid',$yaopin->ypid);
    $cxjg->bindColumn('isyg',$yaopin->isyg);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $yaopin;
}

function getplayeryaopin($ypid,$sid,$dblj){
    $yaopin = new yaopin();
    $sql = "select * from playeryaopin WHERE ypid=$ypid AND sid='$sid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('ypname',$yaopin->ypname);
    $cxjg->bindColumn('yphp',$yaopin->yphp);
    $cxjg->bindColumn('ypgj',$yaopin->ypgj);
    $cxjg->bindColumn('ypfy',$yaopin->ypfy);
    $cxjg->bindColumn('ypjg',$yaopin->ypjg);
    $cxjg->bindColumn('ypbj',$yaopin->ypbj);
    $cxjg->bindColumn('ypxx',$yaopin->ypxx);
    $cxjg->bindColumn('ypsum',$yaopin->ypsum);
    $cxjg->bindColumn('isyg',$yaopin->isyg);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    if ($ret){
        return $yaopin;
    }else{
        return false;
    }
}

function getplayeryaopinxc($sid,$dblj){
    $yaopin = new yaopin();
    $sql = "select * from playeryaopin WHERE sid='$sid' AND isyg = 1 order by yphp asc limit 1";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('ypid',$yaopin->ypid);
    $cxjg->bindColumn('ypname',$yaopin->ypname);
    $cxjg->bindColumn('yphp',$yaopin->yphp);
    $cxjg->bindColumn('ypgj',$yaopin->ypgj);
    $cxjg->bindColumn('ypfy',$yaopin->ypfy);
    $cxjg->bindColumn('ypjg',$yaopin->ypjg);
    $cxjg->bindColumn('ypbj',$yaopin->ypbj);
    $cxjg->bindColumn('ypxx',$yaopin->ypxx);
    $cxjg->bindColumn('ypsum',$yaopin->ypsum);
    $cxjg->bindColumn('isyg',$yaopin->isyg);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    if ($ret){
        return $yaopin;
    }else{
        return false;
    }
}

function getplayeryaopinall($sid,$dblj){
    $sql = "select * from playeryaopin WHERE sid='$sid'";
    $cxjg = $dblj->query($sql);
    if ($cxjg){
        $ret = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
        return $ret;
    }else{
        return false;
    }

}

function addyaopin($sid,$ypid,$ypsum,$dblj){
    $yaopin = getplayeryaopin($ypid,$sid,$dblj);
    if ($yaopin){
        $sql = "update playeryaopin set ypsum = ypsum + $ypsum WHERE ypid=$ypid AND sid='$sid'";
        $dblj->exec($sql);
    }else{
        $yaopin = getyaopinonce($ypid,$dblj);
        $sql = "insert into playeryaopin(ypname,yphp,ypgj,ypfy,ypbj,ypxx,ypid,ypjg,ypsum,sid, isyg) VALUES('$yaopin->ypname','$yaopin->yphp','$yaopin->ypgj','$yaopin->ypfy','$yaopin->ypbj','$yaopin->ypxx',$ypid,'$yaopin->ypjg','$ypsum','$sid', '$yaopin->isyg')";
        $ret = $dblj->exec($sql);
    }
}

function deleyaopin($sid,$ypid,$ypsum,$dblj){
    $yaopin = getplayeryaopin($ypid,$sid,$dblj);

    if ($yaopin){
        if ($yaopin->isyg == 0 || $yaopin->yphp <= 0) {
            if ($yaopin->ypsum>=$ypsum){
                $sql = "update playeryaopin set ypsum = ypsum - $ypsum WHERE ypid=$ypid AND sid='$sid'";
                $dblj->exec($sql);
                return true;
            }else{
                return false;
            }
        }
        return true;
    }else{
        return false;
    }
}

function deleyaopinhp($sid,$ypid,$hpc,$dblj){
    $inityappin = getyaopinonce($ypid,$dblj);
    $yaopin = getplayeryaopin($ypid,$sid,$dblj);
    if ($yaopin){
        if ($yaopin->yphp > $hpc) {
            $sql = "update playeryaopin set yphp = yphp - $hpc WHERE ypid=$ypid AND sid='$sid'";
            $dblj->exec($sql);
        } else if($yaopin->ypsum > 1) {
            $sql = "update playeryaopin set yphp = $inityappin->yphp - $hpc - $yaopin->yphp, ypsum = ypsum - 1 WHERE ypid=$ypid AND sid='$sid'";
            $dblj->exec($sql);
        } else {
            $sql = "update playeryaopin set yphp = $inityappin->yphp, ypsum = ypsum - 1 WHERE ypid=$ypid AND sid='$sid'";
            $dblj->exec($sql);
        }
        return true;
    }
    return false;
}

function changeplayersx($sx,$gaibian,$sid,$dblj){
    $sql = "update game1 set $sx = '$gaibian' WHERE sid='$sid'";//改变玩家属性
    $ret = $dblj->exec($sql);
}
function changecwsx($sx,$gaibian,$cwid,$dblj){
    $sql = "update playerchongwu set $sx = '$gaibian' WHERE cwid='$cwid'";//改变宠物属性
    $ret = $dblj->exec($sql);
}

function addplayersx($sx,$gaibian,$sid,$dblj){
    $sql = "update game1 set $sx = $sx + '$gaibian' WHERE sid='$sid'";//增加玩家属性
    $ret = $dblj->exec($sql);
}
function addcwsx($sx,$gaibian,$cwid,$dblj){
    $sql = "update playerchongwu set $sx = $sx + '$gaibian' WHERE cwid='$cwid'";//增加cw属性
    $ret = $dblj->exec($sql);
}

function changeyxb($lx,$gaibian,$sid,$dblj){//改变货币
    $player = getplayer($sid,$dblj);
    if ($lx==1){
        $sql = "update game1 set uyxb = uyxb + $gaibian WHERE sid='$sid'";
        $dblj->exec($sql);
        return true;
    }elseif($lx==2){
        if ($player->uyxb - $gaibian >= 0){
            $sql = "update game1 set uyxb = uyxb - $gaibian WHERE sid='$sid' AND uyxb >= $gaibian";
            $affected_rows = $dblj->exec($sql);
            if ($affected_rows) {
                return true;
            }
            return false;
        }
        return false;
    }
    return false;
}

function clubchangeyxb($gaibian,$sid,$dblj, $lx = '+') {
    $clubplayer = getclubplayer_once($sid, $dblj);
    if (!$clubplayer) {
        return false;
    }

    $club = getclub($clubplayer->clubid,$dblj);
    if (!$club) {
        return false;
    }

    $where = '';
    if ($lx == '-') {
        $where = 'AND clubyxb >= $gaibian';
    }

    $sql = "update `club` set clubyxb = clubyxb {$lx} {$gaibian} WHERE clubid={$clubplayer->clubid} {$where}";
    $affected_rows = $dblj->exec($sql);
    if (!$affected_rows) {
        return false;
    }

    return true;
}

function changeczb($lx,$gaibian,$sid,$dblj){//改变货币
    $player = getplayer($sid,$dblj);
    if ($lx==1){
        $sql = "update game1 set uczb = uczb + $gaibian WHERE sid='$sid'";
        $dblj->exec($sql);
        return true;
    }elseif($lx==2){
        if ($player->uczb - $gaibian >= 0){
            $sql = "update game1 set uczb = uczb - $gaibian WHERE sid='$sid' AND uczb >= $gaibian";
            $affected_rows = $dblj->exec($sql);
            if ($affected_rows) {
                return true;
            }
            return false;
        }
        return false;
    }
    return false;
}

function clubchangeczb($gaibian,$clubid,$dblj, $lx = '+') {
    $club = getclub($clubid, $dblj);
    if (!$club) {
        return false;
    }

    $where = '';
    if ($lx == '-') {
        $where = "AND clubczb >= {$gaibian}";
    }

    $sql = "update `club` set clubczb = clubczb {$lx} {$gaibian} WHERE clubid={$clubid} {$where}";
    if (!$dblj->exec($sql)) {
        return false;
    }

    return true;
}

function changclubexp($lx, $gaibian, $sid, $dblj) {
    $clubplayer = getclubplayer_once($sid, $dblj);
    if ($lx==1){
        $sql = "update clubplayer set clubexp = clubexp + $gaibian WHERE sid='$sid'";
        $dblj->exec($sql);
        return true;
    }elseif($lx==2){
        if ($clubplayer->clubexp - $gaibian >= 0){
            $sql = "update clubplayer set clubexp = clubexp - $gaibian WHERE sid='$sid' AND clubexp >= $gaibian";
            $affected_rows = $dblj->exec($sql);
            if ($affected_rows) {
                return true;
            }
            return false;
        }
        return false;
    }
    return false;
}

class task{
    var $rwname;
    var $rwinfo;
    var $rwid;
    var $rwzl;
    var $rwyq;
    var $rwdj;
    var $rwzb;
    var $rwexp;
    var $rwyxb;
    var $sid;
    var $rwzt;//状态
    var $rwcount;
    var $rwyp;
    var $rwlx;
    var $rwnowcount;
    var $lastrwid;
}
function getplayerrenwu($sid,$dblj){
    $sql = "select * from playerrenwu WHERE sid='$sid'";
    $cxjg = $dblj->query($sql);
//    $cxjg->bindColumn("rwname",$task->rwname);
//    $cxjg->bindColumn("rwinfo",$task->rwinfo);
//    $cxjg->bindColumn("rwid",$task->rwid);
//    $cxjg->bindColumn("rwzl",$task->rwzl);
//    $cxjg->bindColumn("rwyq",$task->rwyq);
//    $cxjg->bindColumn("rwdj",$task->rwdj);
//    $cxjg->bindColumn("rwzb",$task->rwzb);
//    $cxjg->bindColumn("rwexp",$task->rwexp);
//    $cxjg->bindColumn("rwyxb",$task->rwyxb);
//    $cxjg->bindColumn("rwzt",$task->rwzt);
//    $cxjg->bindColumn("rwcount",$task->rwcount);
    $task = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
    return $task;
}
function gettask($rwid,$dblj){
    $task = new task();
    $sql = "select * from renwu WHERE rwid='$rwid'";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn("rwname",$task->rwname);
    $cxjg->bindColumn("rwinfo",$task->rwinfo);
    $cxjg->bindColumn("rwzl",$task->rwzl);
    $cxjg->bindColumn("rwid",$task->rwid);
    $cxjg->bindColumn("rwyq",$task->rwyq);
    $cxjg->bindColumn("rwdj",$task->rwdj);
    $cxjg->bindColumn("rwzb",$task->rwzb);
    $cxjg->bindColumn("rwexp",$task->rwexp);
    $cxjg->bindColumn("rwyxb",$task->rwyxb);
    $cxjg->bindColumn("rwcount",$task->rwcount);
    $cxjg->bindColumn("rwlx",$task->rwlx);
    $cxjg->bindColumn("rwyp",$task->rwyp);
    $cxjg->bindColumn("lastrwid",$task->lastrwid);
    $cxjg->fetchAll(\PDO::FETCH_ASSOC);
    return $task;
}
function getplayerrenwuonce($sid,$rwid,$dblj){
    $task = new task();
    $sql = "select * from playerrenwu WHERE sid='$sid' AND rwid=$rwid";
    $cxjg = $dblj->query($sql);

    $cxjg->bindColumn("rwname",$task->rwname);
    $cxjg->bindColumn("rwid",$task->rwid);
    $cxjg->bindColumn("rwzl",$task->rwzl);
    $cxjg->bindColumn("rwyq",$task->rwyq);
    $cxjg->bindColumn("rwdj",$task->rwdj);
    $cxjg->bindColumn("rwzb",$task->rwzb);
    $cxjg->bindColumn("rwexp",$task->rwexp);
    $cxjg->bindColumn("rwyxb",$task->rwyxb);
    $cxjg->bindColumn("rwzt",$task->rwzt);
    $cxjg->bindColumn("rwcount",$task->rwcount);
    $cxjg->bindColumn("rwnowcount",$task->rwnowcount);
    $cxjg->bindColumn("rwlx",$task->rwlx);
    $cxjg->bindColumn("rwyp",$task->rwyp);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    if (!$ret){
        return false;
    }
    return $task;
}
class boss{
    var $bossname;
    var $bosslv;
    var $bossid;
    var $bosstime;
    var $bs;
    var $bossinfo;
    var $bosshp;
    var $bossmaxhp;
    var $bossgj;
    var $bossfy;
    var $bossbj;
    var $bossxx;
    var $bossdj;
    var $bosszb;
}
function getboss($bossid,$dblj){
    $boss = new boss();
    $sql = "select * from boss WHERE bossid=$bossid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('bossname',$boss->bossname);
    $cxjg->bindColumn('bossid',$boss->bossid);
    $cxjg->bindColumn('bosstime',$boss->bosstime);
    $cxjg->bindColumn('bs',$boss->bs);
    $cxjg->bindColumn('bossinfo',$boss->bossinfo);
    $cxjg->bindColumn('bosshp',$boss->bosshp);
    $cxjg->bindColumn('bosslv',$boss->bosslv);
    $cxjg->bindColumn('bossgj',$boss->bossgj);
    $cxjg->bindColumn('bossfy',$boss->bossfy);
    $cxjg->bindColumn('bossbj',$boss->bossbj);
    $cxjg->bindColumn('bossxx',$boss->bossxx);
    $cxjg->bindColumn('bossdj',$boss->bossdj);
    $cxjg->bindColumn('bosszb',$boss->bosszb);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $boss;
}
function useyaopin($ypid,$ypsum,$sid,$dblj){
    $player = getplayer($sid,$dblj);
    if ($player->uhp<=0){
        return false;
    }
    $yaopin = getplayeryaopin($ypid,$sid,$dblj);
    if ($yaopin->ypsum <= 0) {
        return false;
    }
    $ret = deleyaopin($sid,$ypid,$ypsum,$dblj);
    if ($ret){

        $hpc = $player->umaxhp - $player->uhp;
        deleyaopinhp($sid,$ypid,$hpc,$dblj);
        if ($yaopin->yphp >= $hpc){
            addplayersx('uhp',$hpc,$sid,$dblj);
        }else{
            addplayersx('uhp',$yaopin->yphp,$sid,$dblj);
        }
        addplayersx('ugj',$yaopin->ypgj,$sid,$dblj);
        addplayersx('ufy',$yaopin->ypfy,$sid,$dblj);
        addplayersx('ugj',$yaopin->ypbj,$sid,$dblj);
        addplayersx('ugj',$yaopin->ypxx,$sid,$dblj);
    }
    return $ret;
}

class chongwu{
    var $cwid;
    var $cwname;
    var $cwlv;
    var $cwexp;
    var $cwmaxexp;
    var $cwhp;
    var $cwmaxhp;
    var $cwgj;
    var $cwfy;
    var $cwbj;
    var $cwxx;
    var $uphp;
    var $upgj;
    var $upfy;
    var $cwpz;
    var $tool1;
    var $tool2;
    var $tool3;
    var $tool4;
    var $tool5;
    var $tool6;
}

/**
 * @param $cwid
 * @param $dblj
 * @return chongwu
 */
function getchongwu($cwid, $dblj){
    $chongwu = new chongwu();
    $rangeslv = array(0, 30, 50, 70, 80, 90, 100, 110);
    $rangesgj = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);
    $rangesfy = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);
    $rangeshp = array(30, 50, 70, 90, 110, 130, 170);
    $rangesexp = array(2, 4, 6, 9, 12.5, 15, 17.5);
    $sql = "select * from playerchongwu WHERE cwid = $cwid ";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn("cwid",$chongwu->cwid);
    $cxjg->bindColumn("cwname",$chongwu->cwname);
    $cxjg->bindColumn("cwlv",$chongwu->cwlv);
    $cxjg->bindColumn("cwexp",$chongwu->cwexp);
    $cxjg->bindColumn("cwhp",$chongwu->cwhp);
    $cxjg->bindColumn("cwmaxhp",$chongwu->cwmaxhp);
    $cxjg->bindColumn("cwgj",$chongwu->cwgj);
    $cxjg->bindColumn("cwfy",$chongwu->cwfy);
    $cxjg->bindColumn("cwbj",$chongwu->cwbj);
    $cxjg->bindColumn("cwxx",$chongwu->cwxx);
    $cxjg->bindColumn("uphp",$chongwu->uphp);
    $cxjg->bindColumn("upgj",$chongwu->upgj);
    $cxjg->bindColumn("upfy",$chongwu->upfy);
    $cxjg->bindColumn("cwpz",$chongwu->cwpz);
    $cxjg->bindColumn("tool1",$chongwu->tool1);
    $cxjg->bindColumn("tool2",$chongwu->tool2);
    $cxjg->bindColumn("tool3",$chongwu->tool3);
    $cxjg->bindColumn("tool4",$chongwu->tool4);
    $cxjg->bindColumn("tool5",$chongwu->tool5);
    $cxjg->bindColumn("tool6",$chongwu->tool6);


    if ($chongwu->tool1!=0){
        $zhuangbei = getzb($chongwu->tool1,$dblj);
        $chongwu->ugj = $chongwu->cwgj + $zhuangbei->zbgj;
        $chongwu->ufy = $chongwu->cwfy + $zhuangbei->zbfy;
        $chongwu->ubj = $chongwu->cwbj + $zhuangbei->zbbj;
        $chongwu->uxx = $chongwu->cwxx + $zhuangbei->zbxx;
        $chongwu->umaxhp = $chongwu->cwmaxhp + $zhuangbei->zbhp;
    }
    if ($chongwu->tool2!=0){
        $zhuangbei = getzb($chongwu->tool2,$dblj);
        $chongwu->ugj = $chongwu->cwgj + $zhuangbei->zbgj;
        $chongwu->ufy = $chongwu->cwfy + $zhuangbei->zbfy;
        $chongwu->ubj = $chongwu->cwbj + $zhuangbei->zbbj;
        $chongwu->uxx = $chongwu->cwxx + $zhuangbei->zbxx;
        $chongwu->umaxhp = $chongwu->cwmaxhp + $zhuangbei->zbhp;
    }
    if ($chongwu->tool3!=0){
        $zhuangbei = getzb($chongwu->tool3,$dblj);
        $chongwu->ugj = $chongwu->cwgj + $zhuangbei->zbgj;
        $chongwu->ufy = $chongwu->cwfy + $zhuangbei->zbfy;
        $chongwu->ubj = $chongwu->cwbj + $zhuangbei->zbbj;
        $chongwu->uxx = $chongwu->cwxx + $zhuangbei->zbxx;
        $chongwu->umaxhp = $chongwu->cwmaxhp + $zhuangbei->zbhp;
    }
    if ($chongwu->tool4!=0){
        $zhuangbei = getzb($chongwu->tool4,$dblj);
        $chongwu->ugj = $chongwu->cwgj + $zhuangbei->zbgj;
        $chongwu->ufy = $chongwu->cwfy + $zhuangbei->zbfy;
        $chongwu->ubj = $chongwu->cwbj + $zhuangbei->zbbj;
        $chongwu->uxx = $chongwu->cwxx + $zhuangbei->zbxx;
        $chongwu->umaxhp = $chongwu->cwmaxhp + $zhuangbei->zbhp;
    }
    if ($chongwu->tool5!=0){
        $zhuangbei = getzb($chongwu->tool5,$dblj);
        $chongwu->ugj = $chongwu->cwgj + $zhuangbei->zbgj;
        $chongwu->ufy = $chongwu->cwfy + $zhuangbei->zbfy;
        $chongwu->ubj = $chongwu->cwbj + $zhuangbei->zbbj;
        $chongwu->uxx = $chongwu->cwxx + $zhuangbei->zbxx;
        $chongwu->umaxhp = $chongwu->cwmaxhp + $zhuangbei->zbhp;
    }
    if ($chongwu->tool6!=0){
        $zhuangbei = getzb($chongwu->tool6,$dblj);
        $chongwu->ugj = $chongwu->cwgj + $zhuangbei->zbgj;
        $chongwu->ufy = $chongwu->cwfy + $zhuangbei->zbfy;
        $chongwu->ubj = $chongwu->cwbj + $zhuangbei->zbbj;
        $chongwu->uxx = $chongwu->cwxx + $zhuangbei->zbxx;
        $chongwu->umaxhp = $chongwu->cwmaxhp + $zhuangbei->zbhp;
    }

    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    for ($i=0;$i<$rangeslv;$i++){
        if ($chongwu->cwlv>=$rangeslv[$i] && $chongwu->cwlv<$rangeslv[$i+1]){
            $cwnextlv = $chongwu->cwlv + 1;
            $chongwu->cwmaxexp = $cwnextlv *($cwnextlv+round($cwnextlv/2))*10*$rangesexp[$i]+$cwnextlv;
            break;
        }
    }
    return $chongwu;
}

function getchongwuall($sid,$dblj){
    $sql = "select * from playerchongwu WHERE sid = '$sid'";
    $cxjg = $dblj->query($sql);
    if ($cxjg){
        $ret = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
        return $ret;
    }else{
        return false;
    }
}

function addchongwu($sid,$dblj){
    $cw1 = array('句芒','禺疆','神荼', '烛龙','白泽');
    $cw2 = array('青龙','白虎','朱雀','玄武');
    $cw3 = array('饕餮','寿杌','混沌','穷奇');
    $cw4 = array('伶俐鼠','笨笨牛','威威虎', '跳跳兔','酷酷龙','花花蛇','溜溜马','咩咩羊','帅帅猴','蛋蛋鸡','乖乖狗','招财猪');
    $uphp = mt_rand(8,25);
    $upgj = mt_rand(2,5);
    $upfy = mt_rand(3,8);
    $cwpz = mt_rand(0,500);
    if ($cwpz<200){
        $cwpz=0;
    }elseif ($cwpz<350){
        $cwpz=1;
    }elseif ($cwpz<430){
        $cwpz=2;
    }elseif ($cwpz<470){
        $cwpz=3;
    }elseif ($cwpz<495){
        $cwpz=4;
    }elseif ($cwpz<500){
        $cwpz=5;
    }

    $cwlv = 1;
    $cwmaxhp = 100;
    $cwhp = 100;
    $cwgj = 6;
    $cwfy = 4;
    $sjs = mt_rand(0,11);
    $sql = "insert into playerchongwu(cwname,cwlv,cwhp,cwmaxhp,cwgj,cwfy,uphp,upgj,upfy,cwpz,sid) VALUES ('$cw4[$sjs]','$cwlv','$cwhp','$cwmaxhp','$cwgj','$cwfy','$uphp','$upgj','$upfy','$cwpz','$sid')";
    $cxjg = $dblj->exec($sql);
}

function delechongwu($cwid,$sid,$dblj){
    $sql = "delete from `playerchongwu` WHERE cwid=$cwid AND sid='$sid'";
    $dblj->exec($sql);
}

function changecwexp($cwid,$exp,$dblj){
    $sql = "update playerchongwu set cwexp = cwexp + $exp where cwid='$cwid'";
    $ret = $dblj->exec($sql);
    $cw = getchongwu($cwid,$dblj);
    if ($cw->cwexp >= $cw->cwmaxexp){
        $sql = "update playerchongwu set cwexp = cwexp - $cw->cwmaxexp where cwid='$cwid'";
        $dblj->exec($sql);

        $rangeslv = array(1, 30, 50, 70, 80, 90, 100, 110);
        $playernextlv = $cw->cwlv + 1;
        for ($i=0;$i<count($rangeslv)-1;$i++){
            if ($playernextlv >= $rangeslv[$i] && $playernextlv < $rangeslv[$i+1]){

                $rangeshp = array(20, 30, 50, 70, 90, 110, 140);
                $rangesgj = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);
                $rangesfy = array(2.5, 5, 7.5, 10, 12.5, 15, 17.5);

                $uphp = $cw->uphp * (1 + ($cw->cwpz/10));
                $upgj = $cw->upgj * (1 + ($cw->cwpz/10));
                $upfy = $cw->upfy * (1 + ($cw->cwpz/10));
                $sql = "update playerchongwu set cwlv = cwlv + 1,
                                           cwmaxhp = cwmaxhp + $uphp,
                                           cwgj = cwgj + $upgj,  
                                           cwfy = cwfy + $upfy
                                           where cwid = '$cwid'";
                $ret = $dblj->exec($sql);
                break;
            }
        }
    }
}

class jineng{
    var $jnname;
    var $jnid;
    var $jngj;
    var $jnfy;
    var $jnbj;
    var $jnxx;
    var $jndj;
    var $djcount;
    var $jncount;
}

function getjineng_all($dblj){
    $sql = "select * from jineng";
    $cxjg = $dblj->query($sql);
    $retjn = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
    return $retjn;
}
function getplayerjineng_all($sid,$dblj){
    $sql = "select * from playerjineng WHERE sid='$sid'";
    $cxjg = $dblj->query($sql);
    $retjn = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
    return $retjn;
}
function getjineng_once($jnid,$dblj){
    $jineng = new jineng();
    $sql = "select * from jineng WHERE jnid=$jnid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn("jnname",$jineng->jnname);
    $cxjg->bindColumn("jnid",$jineng->jnid);
    $cxjg->bindColumn("jngj",$jineng->jngj);
    $cxjg->bindColumn("jnfy",$jineng->jnfy);
    $cxjg->bindColumn("jnbj",$jineng->jnbj);
    $cxjg->bindColumn("jnxx",$jineng->jnxx);
    $cxjg->bindColumn("jndj",$jineng->jndj);
    $cxjg->bindColumn("djcount",$jineng->djcount);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $jineng;
}

function getplayerjineng($jnid,$sid,$dblj){
    $jineng = new jineng();
    $sql = "select * from playerjineng WHERE jnid=$jnid and sid='$sid'";
    $cxjg = $dblj->query($sql);

    $cxjg->bindColumn("jnname",$jineng->jnname);
    $cxjg->bindColumn("jnid",$jineng->jnid);
    $cxjg->bindColumn("jngj",$jineng->jngj);
    $cxjg->bindColumn("jnfy",$jineng->jnfy);
    $cxjg->bindColumn("jnbj",$jineng->jnbj);
    $cxjg->bindColumn("jnxx",$jineng->jnxx);
    $cxjg->bindColumn("jncount",$jineng->jncount);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);

    if ($ret){
        return $jineng;
    }
    return $ret;
}

function addjineng($jnid,$jncount,$sid,$dblj){
    $jineng = getjineng_once($jnid,$dblj);
    $ret = getplayerjineng($jnid,$sid,$dblj);
    if ($ret){
        $sql = "update `playerjineng` set jncount= jncount + $jncount WHERE jnid = $jnid AND sid='$sid'";
    }else{
        $sql = "insert into `playerjineng`(jnname,jnid,jngj,jnfy,jnbj,jnxx,sid,jncount) VALUES ('$jineng->jnname','$jineng->jnid','$jineng->jngj','$jineng->jnfy','$jineng->jnbj','$jineng->jnxx','$sid','$jncount')";
    }
    $ret = $dblj->exec($sql);
}

function delejnsum($jnid,$jnsum,$sid,$dblj){
    $jnneng = getplayerjineng($jnid,$sid,$dblj);
    if ($jnneng){
        if ($jnneng->jncount >= $jnsum && $jnsum > 0){
            $sql = "update playerjineng set jncount = jncount - $jnsum where sid='$sid' and jnid = $jnid";
            $dblj->exec($sql);
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}
class mqy{
    var $qyname;
    var $qyid;
    var $mid;
}

function getqy($qyid,$dblj){
    $qy = new mqy();
    $sql = "select * from `qy` WHERE qyid=$qyid";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('qyname',$qy->qyname);
    $cxjg->bindColumn('qyid',$qy->qyid);
    $cxjg->bindColumn('mid',$qy->mid);
    $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $qy;
}
function getqy_all($dblj){
    $sql = "select * from `qy`";
    $cxjg = $dblj->query($sql);
    $ret = $cxjg->fetchAll(\PDO::FETCH_ASSOC);
    return $ret;
}
class gameconfig{
    var $firstmid;
}
function getgameconfig($dblj){
    $gameconfig = new gameconfig();
    $sql = "select * from `gameconfig`";
    $cxjg = $dblj->query($sql);
    $cxjg->bindColumn('firstmid',$gameconfig->firstmid);
    $ret = $cxjg->fetch(\PDO::FETCH_ASSOC);
    return $gameconfig;
}

class fangshi_dj{
    var $djid;
    var $djname;
    var $pay;
    var $uid;
    var $djcount;
    var $payid;
    var $djinfo;
}

/**
 * @property  djid
 */
class fangshi_zb{
    var $zbnowid;
    var $pay;
    var $payid;
    var $uid;
}

class fangshi_cw {
    var $payid;
    var $pay;
    var $uid;
    var $cwid;
}

function getfangshi_once($lx,$payid,$dblj){
    switch ($lx){
        case "daoju":
            $fsdj = new fangshi_dj();
            $sql = "select * from `fangshi_dj` WHERE payid = $payid";
            $redj = $dblj->query($sql);
            $redj->bindColumn('djid',$fsdj->djid);
            $redj->bindColumn('djname',$fsdj->djname);
            $redj->bindColumn('pay',$fsdj->pay);
            $redj->bindColumn('uid',$fsdj->uid);
            $redj->bindColumn('djcount',$fsdj->djcount);
            $redj->bindColumn('payid',$fsdj->payid);
            $redj->bindColumn('djinfo',$fsdj->djinfo);
            $dj = $redj->fetch(\PDO::FETCH_ASSOC);
            if ($dj){
                return $fsdj;
            }
            return $dj;
        case "zhuangbei":
            $fszb = new fangshi_zb();
            $sql = "select * from `fangshi_zb` WHERE payid = $payid";
            $redj = $dblj->query($sql);
            $redj->bindColumn('zbnowid',$fszb->zbnowid);
            $redj->bindColumn('payid',$fszb->payid);
            $redj->bindColumn('uid',$fszb->uid);
            $redj->bindColumn("pay",$fszb->pay);
            $zb = $redj->fetch(\PDO::FETCH_ASSOC);
            if ($zb){
                return $fszb;
            }
            return $zb;
        case "chongwu":
            $fscw = new fangshi_cw();
            $sql = "select * from `fangshi_cw` WHERE payid = $payid";
            $redj = $dblj->query($sql);
            $redj->bindColumn('cwid',$fscw->cwid);
            $redj->bindColumn('payid',$fscw->payid);
            $redj->bindColumn('uid',$fscw->uid);
            $redj->bindColumn("pay",$fscw->pay);
            $cw = $redj->fetch(\PDO::FETCH_ASSOC);
            if ($cw){
                return $fscw;
            }
            return $cw;
    }

}

/**
 * @param $lx
 * @param $dblj
 * @return mixed
 */
function getfangshi_all($lx, $dblj){
    switch ($lx){
        case "daoju":
            $sql = "select * from `fangshi_dj`";
            $redj = $dblj->query($sql);
            $dj = $redj->fetchAll(\PDO::FETCH_ASSOC);
            return $dj;
        case "zhuangbei":
            $sql = "select * from `fangshi_zb`";
            $redj = $dblj->query($sql);
            $dj = $redj->fetchAll(\PDO::FETCH_ASSOC);
            return $dj;
        case "chongwu":
            $sql = "select * from `fangshi_cw`";
            $redj = $dblj->query($sql);
            $cw = $redj->fetchAll(\PDO::FETCH_ASSOC);
            return $cw;
    }
}

class club{
    var $clubname;
    var $clubid;
    var $clublv;
    var $clubexp;
    var $clubno1;
    var $clubinfo;
    var $clubyxb;
    var $clubczb;
    var $clubautosh;
    var $clubupexp;
    var $clubmxsum;
}
function getclub($clubid,$dblj){
    $club = new club();
    $sql = "select * from `club` WHERE clubid = $clubid ";
    $retc = $dblj->query($sql);
    $retc->bindColumn("clubname",$club->clubname);
    $retc->bindColumn("clubinfo",$club->clubinfo);
    $retc->bindColumn("clublv",$club->clublv);
    $retc->bindColumn("clubexp",$club->clubexp);
    $retc->bindColumn("clubid",$club->clubid);
    $retc->bindColumn("clubno1",$club->clubno1);
    $retc->bindColumn("clubyxb",$club->clubyxb);
    $retc->bindColumn("clubczb",$club->clubczb);
    $retc->bindColumn("clubautosh",$club->clubautosh);
    $retc->bindColumn("clubupexp",$club->clubupexp);
    $retc->bindColumn("clubmxsum",$club->clubmxsum);
    $retc->fetch(\PDO::FETCH_ASSOC);
    return $club;
}

function getclub_all($dblj){
    $sql = "select * from `club`";
    $retc = $dblj->query($sql);
    $club = $retc->fetchAll(\PDO::FETCH_ASSOC);
    return $club;
}

class clubplayer{
    var $clubid;
    var $uid;
    var $sid;
    var $uclv;
    var $qiandao;
    var $clubexp;
    var $gongxian;
}

/**
 * @param $sid
 * @param $dblj
 * @return clubplayer
 */
function getclubplayer_once($sid, $dblj){
    $clubplayer = new clubplayer();
    $sql = "select * from `clubplayer` WHERE sid = '$sid'";
    $retc = $dblj->query($sql);
    $retc->bindColumn('clubid',$clubplayer->clubid);
    $retc->bindColumn('uid',$clubplayer->uid);
    $retc->bindColumn('uid',$clubplayer->uid);
    $retc->bindColumn('uclv',$clubplayer->uclv);
    $retc->bindColumn('qiandao',$clubplayer->qiandao);
    $retc->bindColumn('clubexp',$clubplayer->clubexp);
    $retc->bindColumn('gongxian',$clubplayer->gongxian);
    $ret = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$ret){
        return $ret;
    }
    return $clubplayer;
}

function getclubplayer_count($clubid,$dblj){
    $sql="select clubid from clubplayer WHERE clubid = $clubid";
    $ret = $dblj->query($sql);
    $row = $ret->rowCount();
    return $row;
}

class duihuan{
    var $dhid;
    var $dhm;
    var $dhzb;
    var $dhdj;
    var $dhyp;
    var $dhyxb;
    var $dhczb;
    var $dhname;
    var $dhexp;
    var $dhjiu;
}

function getduihuan($dhm,$dblj){
    $duihuan = new duihuan();
    $sql = "select * from duihuan WHERE dhm = '$dhm'";
    $ret = $dblj->query($sql);
    $ret->bindColumn('dhid',$duihuan->dhid);
    $ret->bindColumn('dhm',$duihuan->dhm);
    $ret->bindColumn('dhzb',$duihuan->dhzb);
    $ret->bindColumn('dhdj',$duihuan->dhdj);
    $ret->bindColumn('dhyp',$duihuan->dhyp);
    $ret->bindColumn('dhyxb',$duihuan->dhyxb);
    $ret->bindColumn('dhczb',$duihuan->dhczb);
    $ret->bindColumn('dhname',$duihuan->dhname);
    $ret->bindColumn('dhexp',$duihuan->dhexp);
    $ret->bindColumn('dhjiu',$duihuan->dhjiu);
    $ret = $ret->fetch(\PDO::FETCH_ASSOC);
    if ($ret){
        return $duihuan;
    }
    return $ret;
}
class im{
    var $imuid;
    var $uid;
    var $sid;
}
function isim($uid,$sid,$dblj){
    $sql="select imuid from im WHERE imuid = $uid AND sid = '$sid'";
    $ret = $dblj->query($sql);
    $row = $ret->rowCount();
    return $row;
}

function addim($imuid,$sid,$dblj){
    $player = getplayer($sid,$dblj);
    $sql = "insert into `im`(imuid, sid, uid) VALUES ($imuid,'$sid',$player->uid)";
    $dblj->exec($sql);
}

function addautozd($sid, $autozd, $dblj) {
    $sql = "update game1 set autozd = $autozd WHERE sid='$sid'";
    $ret = $dblj->exec($sql);
}

function addautoxg($sid, $autoxg, $dblj) {
    $sql = "update game1 set autoxg = $autoxg WHERE sid='$sid'";
    $ret = $dblj->exec($sql);
}

function addautoxc($sid, $autoxc, $dblj) {
    $sql = "update game1 set autoxc = $autoxc WHERE sid='$sid'";
    $ret = $dblj->exec($sql);
}

function shuaxinguaiwu($nowmid, $clmid, $dblj)
{
    $sql = "select * from midguaiwu where mid='$nowmid' AND sid = ''";//获取当前地图怪物
    $cxjg = $dblj->query($sql);
    $cxallguaiwu = $cxjg->rowCount();
    $nowdate = date('Y-m-d H:i:s');
    $second=floor((strtotime($nowdate)-strtotime($clmid->mgtime))%86400);//获取刷新间隔
    if ($second > $clmid->ms  && $cxallguaiwu== 0 && $clmid->mgid!=''){//刷新怪物

        $sql = "update mid set mgtime='$nowdate' WHERE mid='$nowmid'";
        $dblj->exec($sql);
        $retgw = explode(",",$clmid->mgid);
        foreach ($retgw as $itemgw){
            $gwinfo = explode("|",$itemgw);
            $guaiwu = \player\getyguaiwu($gwinfo[0],$dblj);
            $guaiwu->gyid = $gwinfo[0];
            $sjexp = mt_rand(6,8) + 0.5;
            $guaiwu->gexp = round($guaiwu->glv * $sjexp,0);
            for ($n=0;$n<$gwinfo[1];$n++){
                $sql = "insert into midguaiwu(mid,gname,glv,ghp,ggj,gfy,gbj,gxx,gexp,gyid,gmaxhp) 
                    values('$nowmid',
                    '$guaiwu->gname',
                    '$guaiwu->glv',
                    '$guaiwu->ghp',
                    '$guaiwu->ggj',
                    '$guaiwu->gfy',
                    '$guaiwu->gbj',
                    '$guaiwu->gxx',
                    '$guaiwu->gexp',
                    '$guaiwu->gyid',
                    '$guaiwu->ghp')";
                $cxjg = $dblj->exec($sql);
            }

        }
    }
}

function getclubplayerapply($clubid, $uid, $dblj){
    $clubplayer = new clubplayer();
    $sql = "select * from clubplayerapply WHERE clubid = $clubid AND uid = $uid";
    $retc = $dblj->query($sql);
    $retc->bindColumn('uid',$clubplayer->uid);
    $retc->bindColumn('sid',$clubplayer->sid);
    $retc->bindColumn('clubid',$clubplayer->clubid);
    $retc = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$retc){
        return $retc;
    }
    return $clubplayer;
}

class config{
    var $code;
    var $cdj;
    var $cyp;
    var $ccw;
    var $cexp;
    var $cxb;
    var $czb;
    var $cczb;
    var $title;
}

function getconfig($code, $dblj) {
    $config = new config();
    $sql = "select * from config WHERE code = '{$code}'";
    $retc = $dblj->query($sql);
    $retc->bindColumn('code',$config->code);
    $retc->bindColumn('cdj',$config->cdj);
    $retc->bindColumn('cyp',$config->cyp);
    $retc->bindColumn('ccw',$config->ccw);
    $retc->bindColumn('cexp',$config->cexp);
    $retc->bindColumn('cxb',$config->cxb);
    $retc->bindColumn('czb',$config->czb);
    $retc->bindColumn('cczb',$config->cczb);
    $retc->bindColumn('title',$config->title);
    $retc = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$retc){
        return $retc;
    }
    return $config;
}

function getconfigdata($code, $sid, $dblj, $ratio = 0, $isclub=0) {
    $encode = new \encode\encode();
    $config = getconfig($code, $dblj);
    if (!$config) {
        return '';
    }
    $html = '';
    $keylist = ['cexp', 'cxb', 'cczb', 'ccw', 'cyp', 'cdj', 'czb'];
    foreach ($keylist as $key) {
        if (isset($config->$key)) {
            foreach (explode(",", $config->$key) as $item) {
                $data = explode("|", $item);
                $wpid = $data[0];
                $wpnum = 0;
                if (isset($data[1])) {
                    $wpnum = $data[1];
                    $datanum = explode('-', $data[1]);
                    if (count($datanum) > 1) {
                        $wpnum =  mt_rand($datanum[0], $datanum[1]);
                    }

                    $probability = mt_rand(0, 9999);
                    if ($probability >= ($data[2] + $ratio)) {
                        $wpnum = 0;
                    }
                }

                if ($wpnum > 0) {
                    $html .= "获得：";
                    switch ($key) {
                        case 'cdj':
                            $daoju = getdaoju($wpid, $dblj);
                            adddj($sid, $wpid, $wpnum, $dblj);
                            $daojucmd = $encode->encode("cmd=djinfo&djid=$wpid&sid=$sid&isstore=1");
                            $html .= "[道具]<a href='$daojucmd'>{$daoju->djname}*{$wpnum}</a>";
                            break;
                        case 'cyp':
                            $yaopin = getyaopinonce($wpid, $dblj);
                            addyaopin($sid, $wpid, $wpnum, $dblj);
                            $shangpincmd = $encode->encode("cmd=ypinfo&ypid={$wpid}&sid=$sid&isstore=1");
                            $html .= "[药品]<a href='$shangpincmd'>{$yaopin->ypname}*{$wpnum}</a>";
                            break;
                        case 'ccw':
                            $chongwucmd = $encode->encode("cmd=chongwu&cwid=$wpid&canshu=cwinfo&sid=$sid&isstore=1");
                            $html .= "[宠物]<a href='$chongwucmd'>{宠物}</a>";
                            break;
                        case 'cexp':
                            if ($isclub == 1) {
                                clubchangeexp($sid, $dblj, $wpnum);
                                $html .= "贡献值*{$wpnum}";
                            } else {
                                changeexp($sid, $dblj, $wpnum);
                                $html .= "修为*{$wpnum}";
                            }
                            break;
                        case 'cxb':
                            if ($isclub == 1) {
                                clubchangeyxb($wpnum, $sid, $dblj);
                                $html .= "灵石*{$wpnum}";
                            } else {
                                changeyxb(1, $wpnum, $sid, $dblj);
                                $html .= "灵石*{$wpnum}";
                            }
                            break;
                        case 'czb':
                            $zhuangbei = getzbkzb($wpid, $dblj);
                            addzb($sid, $wpid, $dblj);
                            $zhuangbeicmd = $encode->encode("cmd=zbinfo&zbid={$wpid}&sid=$sid&isstore=1");
                            $html .= "[装备]<a href='$zhuangbeicmd'>{$zhuangbei->zbname}</a>";
                            break;
                        case 'cczb':
                            if ($isclub == 1) {
                                $clubplayer = getclubplayer_once($sid, $dblj);
                                clubchangeczb($wpnum, $clubplayer->clubid, $dblj);
                                $html .= "极品灵石*{$wpnum}";
                            } else {
                                changeczb(1, $wpnum, $sid, $dblj);
                                $html .= "极品灵石*{$wpnum}";
                            }
                            break;
                    }
                    $html .= "<br/>";
                }
            }
        }
    }

    $html .= "<br/>";

    return $html;
}

class clubstore {
    var $csid;
    var $wpid;
    var $type;
    var $price;
    var $clublv;
}

function getclubstore($csid, $dblj) {
    $clubstore = new clubstore();
    $sql = "select * from clubstore WHERE csid = $csid";
    $retc = $dblj->query($sql);
    $retc->bindColumn('csid',$clubstore->csid);
    $retc->bindColumn('wpid',$clubstore->wpid);
    $retc->bindColumn('type',$clubstore->type);
    $retc->bindColumn('price',$clubstore->price);
    $retc->bindColumn('clublv',$clubstore->clublv);
    $retc = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$retc){
        return $retc;
    }
    return $clubstore;
}

class clubwarehouse {
    var $cwid;
    var $clubid;
    var $type;
    var $num;
    var $price;
    var $uclv;
    var $attribute;
}

function getclubwarehouse($cwid, $dblj) {
    $clubwarehouse = new clubwarehouse();
    $sql = "select * from clubwarehouse WHERE cwid = $cwid";
    $retc = $dblj->query($sql);
    $retc->bindColumn('cwid',$clubwarehouse->cwid);
    $retc->bindColumn('clubid',$clubwarehouse->clubid);
    $retc->bindColumn('type',$clubwarehouse->type);
    $retc->bindColumn('num',$clubwarehouse->num);
    $retc->bindColumn('price',$clubwarehouse->price);
    $retc->bindColumn('uclv',$clubwarehouse->uclv);
    $retc->bindColumn('attribute',$clubwarehouse->attribute);
    $retc = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$retc){
        return $retc;
    }
    return $clubwarehouse;
}


class SqlWhereBuilder {
    private $conditions = [];

    public function __construct($input) {
        $this->parseInput($input);
    }

    private function parseInput($input) {
        foreach ($input as $key => $value) {
            if (is_array($value)) {
                // 处理数组条件
                $this->handleArrayCondition($key, $value);
            } elseif (is_object($value)) {
                // 处理对象条件
                $this->handleObjectCondition($key, $value);
            } else {
                // 处理简单条件
                $this->conditions[] = "$key = '" . addslashes($value) . "'";
            }
        }
    }

    private function handleArrayCondition($key, $value) {
        if (isset($value['operator'])) {
            // 处理带有操作符的条件
            $operator = strtoupper($value['operator']);
            $valueStr = addslashes($value['value']);
            $this->conditions[] = "$key $operator '$valueStr'";
        } elseif (isset($value['group'])) {
            // 处理组合条件
            $this->handleGroupCondition($value['group']);
        } elseif (isset($value['not_in'])) {
            // 处理 NOT IN 条件
            $values = array_map('addslashes', $value['not_in']);
            $valuesList = implode("', '", $values);
            $this->conditions[] = "$key NOT IN ('$valuesList')";
        } else {
            // 处理简单数组条件（IN）
            $values = array_map('addslashes', $value);
            $valuesList = implode("', '", $values);
            $this->conditions[] = "$key IN ('$valuesList')";
        }
    }

    private function handleGroupCondition($group) {
        $groupConditions = [];
        foreach ($group as $condition) {
            if (is_array($condition)) {
                // 递归处理条件
                $subCondition = $this->parseSubCondition($condition);
                if ($subCondition) {
                    $groupConditions[] = "($subCondition)";
                }
            }
        }
        $this->conditions[] = implode(' OR ', $groupConditions);
    }

    private function parseSubCondition($condition) {
        $subConditions = [];
        foreach ($condition as $key => $value) {
            if (is_array($value) && isset($value['operator'])) {
                // 处理带有操作符的条件
                $operator = strtoupper($value['operator']);
                $valueStr = addslashes($value['value']);
                $subConditions[] = "$key $operator '$valueStr'";
            } elseif (is_array($value) && isset($value['not_in'])) {
                // 处理 NOT IN 条件
                $values = array_map('addslashes', $value['not_in']);
                $valuesList = implode("', '", $values);
                $subConditions[] = "$key NOT IN ('$valuesList')";
            } else {
                // 处理简单条件
                $subConditions[] = "$key = '" . addslashes($value) . "'";
            }
        }
        return implode(' AND ', $subConditions);
    }

    private function handleObjectCondition($key, $value) {
        // 假设对象的属性是条件
        foreach ($value as $prop => $val) {
            $this->conditions[] = "$key.$prop = '" . addslashes($val) . "'";
        }
    }

    public function getWhereClause() {
        return empty($this->conditions) ? '' : 'WHERE ' . implode(' AND ', $this->conditions);
    }
}

class pagedate {
    var $list;
    var $count;
}
function getpage($table, $page, $size, $where, $dblj, $column = '*') {
    $page = ($page -1) * $size;
    $pagedate = new pagedate();
    $SqlWhereBuilder = new SqlWhereBuilder($where);
    $sql="select $column from `$table` {$SqlWhereBuilder->getWhereClause()} LIMIT $page, $size";
    $ret = $dblj->query($sql);
    $pagedate->list = $ret->fetchAll(\PDO::FETCH_ASSOC);

    $sql = "select count(*) from `$table` {$SqlWhereBuilder->getWhereClause()}";
    $cxjg = $dblj->query($sql);
    $pagedate->count = $cxjg->fetchColumn();

    return $pagedate;
}

class clubxujing{
    var $xjid;
    var $xjname;
    var $xjinfo;
    var $clublv;
    var $duplicates;
    var $challenge;
}

function getclubxujing_all($clublv, $dblj) {
    $sql="select * from `clubxujing` where clublv < $clublv";
    $ret = $dblj->query($sql);
    $list = $ret->fetchAll(\PDO::FETCH_ASSOC);
    return $list;
}

function getclubxujing($xjid, $dblj) {
    $clubxujing = new clubxujing();
    $sql = "select * from `clubxujing` WHERE xjid = $xjid";
    $retc = $dblj->query($sql);
    $retc->bindColumn('xjid',$clubxujing->xjid);
    $retc->bindColumn('xjname',$clubxujing->xjname);
    $retc->bindColumn('xjinfo',$clubxujing->xjinfo);
    $retc->bindColumn('clublv',$clubxujing->clublv);
    $retc->bindColumn('duplicates',$clubxujing->duplicates);
    $retc->bindColumn('challenge',$clubxujing->challenge);
    $ret = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$ret){
        return $ret;
    }
    return $clubxujing;
}

class clubxujinginfo {
    var $xjdid;
    var $xjid;
    var $type;
    var $xjsj;
    var $step;
    var $menu;
}

function getclubxujinginfo($xjid,$dblj,$step=1) {
    $clubxujinginfo = new clubxujinginfo();
    $sql = "select * from `clubxujinginfo` WHERE xjid = $xjid AND step = $step";
    $retc = $dblj->query($sql);
    $retc->bindColumn('xjdid',$clubxujinginfo->xjdid);
    $retc->bindColumn('xjid',$clubxujinginfo->xjid);
    $retc->bindColumn('type',$clubxujinginfo->type);
    $retc->bindColumn('xjsj',$clubxujinginfo->xjsj);
    $retc->bindColumn('step',$clubxujinginfo->step);
    $retc->bindColumn('menu',$clubxujinginfo->menu);
    $ret = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$ret){
        return $ret;
    }
    return $clubxujinginfo;
}

class clubxujingplayer {
    var $sid;
    var $xjid;
    var $date;
    var $step;
    var $num;
}

function getclubxujingplayer($sid, $xjid, $dblj) {
    $clubxujingplayer = new clubxujingplayer();
    $sql = "select * from `clubxujingplayer` WHERE sid = '$sid' AND xjid = $xjid";
    $retc = $dblj->query($sql);
    $retc->bindColumn('sid',$clubxujingplayer->sid);
    $retc->bindColumn('xjid',$clubxujingplayer->xjid);
    $retc->bindColumn('date',$clubxujingplayer->date);
    $retc->bindColumn('step',$clubxujingplayer->step);
    $retc->bindColumn('num',$clubxujingplayer->num);
    $ret = $retc->fetch(\PDO::FETCH_ASSOC);
    if (!$ret){
        return $ret;
    }
    return $clubxujingplayer;
}