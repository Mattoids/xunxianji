<?php
$player = \player\getplayer($sid,$dblj);
$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$cwhtml='';
$cwnamehtml= '';
$chouqucmd = $encode->encode("cmd=chongwu&canshu=chouqu&sid=$sid");

if (isset($canshu)){
    switch ($canshu) {
        case 'chouqu':
            if (\player\changeczb(2, 50, $sid, $dblj)) {
                \player\addchongwu($sid, $dblj);
            } else {
                echo "极品灵石不足<br/>";
            }
            break;
        case 'chuzhan':
            \player\changeplayersx('cw',$cwid,$sid,$dblj);
            $player = \player\getplayer($sid,$dblj);
            break;
        case 'shouhui':
            \player\changeplayersx('cw',0,$sid,$dblj);
            $player = \player\getplayer($sid,$dblj);
            break;
        case 'fangsheng':
            \player\delechongwu($cwid,$sid,$dblj);
            break;
        case 'cwinfo':
            $chushou = "";

            if ($player->cw != $cwid && !isset($isstore)) {
                $chushou .= "<form>";
                $chushou .= "<input type='hidden' name='cmd' value='chongwu'>";
                $chushou .= "<input type='hidden' name='canshu' value='cwinfo'>";
                $chushou .= "<input type='hidden' name='cwid' value='$cwid'>";
                $chushou .= "<input type='hidden' name='sid' value='$sid'>";
                $chushou .= "挂售单价：<input type='number' name='pay'>";
                $chushou .= "<input type='submit' value='挂售'>";
                $chushou .= "</form><br/><br/>";
            }

            $chongwu = \player\getchongwu($cwid, $dblj);
            if (isset($pay)) {
                try {
                    $dblj->setAttribute(PDO::ATTR_AUTOCOMMIT, 0);
                    $dblj->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $dblj->beginTransaction();

                    $sql = "insert into `fangshi_cw`(pay, uid, cwid, cwname, cwhp, cwmaxhp, cwgj, cwfy, cwbj, cwxx, 
                         cwlv, cwexp, tool1, tool2, tool3, tool4, tool5, tool6, uphp, upgj, upfy, cwpz) VALUES 
                         ($pay, $player->uid, $chongwu->cwid, '$chongwu->cwname','$chongwu->cwhp','$chongwu->cwmaxhp','$chongwu->cwgj','$chongwu->cwfy','$chongwu->cwbj','$chongwu->cwxx',
                          '$chongwu->cwlv','$chongwu->cwexp','$chongwu->tool1','$chongwu->tool2','$chongwu->tool3','$chongwu->tool4','$chongwu->tool5', '$chongwu->tool6',
                          '$chongwu->uphp','$chongwu->upgj','$chongwu->upfy','$chongwu->cwpz')";
                    $affected_rows = $dblj->exec($sql);
                    if (!$affected_rows){
                        throw new PDOException("宠物挂售失败<br/>");//那个错误抛出异常
                    }
                    $sql="UPDATE `playerchongwu` SET sid='' WHERE cwid = $cwid";
                    $affected_rows=$dblj->exec($sql);
                    if (!$affected_rows){
                        throw new PDOException("宠物传送失败<br/>");//那个错误抛出异常
                    }
                    echo "挂售成功！<br/>";
                    $dblj->commit();//交易成功就提交
                } catch (PDOException $e) {
                    echo $e->getMessage();
                    $dblj->rollBack();
                }
                $dblj->setAttribute(PDO::ATTR_AUTOCOMMIT, 1);//关闭
                $chongwu = \player\getchongwu($cwid, $dblj);
            }

            $pzarr = array('普通', '优秀', '卓越', '非凡', '完美', '逆天');
            $cwpz = $pzarr[$chongwu->cwpz];
            $chongwu->cwpz = $chongwu->cwpz * 10;
            $cwhtml = <<<HTML
            名字:[$chongwu->cwname]<br/>
            等级:$chongwu->cwlv<br/>
            品质:$cwpz<br/>
            经验:$chongwu->cwexp/$chongwu->cwmaxexp<br/>
            气血:($chongwu->cwhp/$chongwu->cwmaxhp)<br/>
            攻击:$chongwu->cwgj<br/>
            防御:$chongwu->cwfy<br/>
            暴击:$chongwu->cwbj<br/>
            吸血:$chongwu->cwxx<br/>
            <br/>
            气血成长:$chongwu->uphp<br/>
            攻击成长:$chongwu->upgj<br/>
            防御成长:$chongwu->upfy<br/>
            品质[$cwpz]在升级时加成$chongwu->cwpz%<br/>
            <br/><br/>
            $chushou
            <button onClick="javascript :history.back(-1);">返回上一页</button><br/>
            <a href="game.php?cmd=$gonowmid">返回游戏</a>
HTML;
            exit($cwhtml);
    }
}

$allcw = \player\getchongwuall($sid,$dblj);
if ($allcw){
    foreach ($allcw as $cw){
        $cwid = $cw['cwid'];
        $czcmd='';
        if ($cwid!=$player->cw){
            $czcmd = $encode->encode("cmd=chongwu&canshu=chuzhan&cwid=$cwid&sid=$sid");
            $fscmd = $encode->encode("cmd=chongwu&canshu=fangsheng&cwid=$cwid&sid=$sid");
            $czcmd = '<a href="?cmd='.$czcmd.'">出战<a/>';
            $fscmd = '<a href="?cmd='.$fscmd.'">放生<a/>';
            $gncmd = $czcmd.$fscmd;
        }else{
            $shcmd = $encode->encode("cmd=chongwu&canshu=shouhui&cwid=$cwid&sid=$sid");
            $shcmd = '<a href="?cmd='.$shcmd.'">收回<a/>';
            $gncmd = '(已出战)'.$shcmd;
        }
        $cwinfo = $encode->encode("cmd=chongwu&cwid=$cwid&canshu=cwinfo&sid=$sid");
        $cwnamehtml.="[宠物]".'<a href="?cmd='.$cwinfo.'">'.$cw['cwname'].'</a>'.$gncmd.'<br/>';
        
    }
}else{
    $cwnamehtml= '你当前没有宠物';
}
$cwhtml = <<<HTML
$cwnamehtml
<br/>
<a href="?cmd=$chouqucmd">抽取宠物[极品灵石50]</a>
<br/><br/>
<button onClick="javascript :history.back(-1);">返回上一页</button><br/>
<a href="game.php?cmd=$gonowmid">返回游戏</a>
HTML;
echo $cwhtml;