<?php
$player =  \player\getplayer($sid,$dblj);
$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$imlist = '';

parse_str($Dcmd, $Scmd);
if (isset($Scmd['autozd']) && $Scmd['autozd'] != $player->autozd) {
    \player\addautozd($sid,$Scmd['autozd'],$dblj);
    $player =  \player\getplayer($sid,$dblj);
}
if (isset($Scmd['autoxg']) && $Scmd['autoxg'] != $player->autoxg) {
    \player\addautoxg($sid,$Scmd['autoxg'],$dblj);
    $player =  \player\getplayer($sid,$dblj);
}

$enable = $encode->encode("cmd=setting&autozd=1&sid=$sid");
$disable = $encode->encode("cmd=setting&autozd=0&sid=$sid");
if ($player->autozd == 1) {
    $pagezd = "开 / <a href='?cmd={$disable}'>关</a>";
} else {
    $pagezd = "<a href='?cmd={$enable}'>开</a> / 关";
}
$enable = $encode->encode("cmd=setting&autoxg=1&sid=$sid");
$disable = $encode->encode("cmd=setting&autoxg=0&sid=$sid");
if ($player->autoxg == 1) {
    $pagexg = "开 / <a href='?cmd={$disable}'>关</a>";
} else {
    $pagexg = "<a href='?cmd={$enable}'>开</a> / 关";
}

$imhtml =<<<HTML
=======设置=======<br/>
<br/>
自动攻击：{$pagezd}<br/>
自动寻怪：{$pagexg}<br/>
<br/>
<button onClick="javascript:history.back(-1);">返回上一页</button><br/>
<a href="?cmd=$gonowmid">返回游戏</a>
HTML;
echo $imhtml;