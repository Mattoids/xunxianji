<?php
$player =  \player\getplayer($sid,$dblj);
$gonowmid = $encode->encode("cmd=gomid&newmid=$player->nowmid&sid=$sid");
$imlist = '';

if (isset($autozd) && $autozd != $player->autozd) {
    \player\addautozd($sid,$autozd,$dblj);
    $player =  \player\getplayer($sid,$dblj);
}
if (isset($autoxg) && $autoxg != $player->autoxg) {
    \player\addautoxg($sid,$autoxg,$dblj);
    $player =  \player\getplayer($sid,$dblj);
}
if (isset($autoxc) && $autoxc != $player->autoxc) {
    \player\addautoxc($sid,$autoxc,$dblj);
    $player =  \player\getplayer($sid,$dblj);
}

$enablezd = $encode->encode("cmd=setting&autozd=1&sid=$sid");
$disablezd = $encode->encode("cmd=setting&autozd=0&sid=$sid");
if ($player->autozd == 1) {
    $pagezd = "开 / <a href='?cmd={$disablezd}'>关</a>";
} else {
    $pagezd = "<a href='?cmd={$enablezd}'>开</a> / 关";
}
$enablexg = $encode->encode("cmd=setting&autoxg=1&sid=$sid");
$disablexg = $encode->encode("cmd=setting&autoxg=0&sid=$sid");
if ($player->autoxg == 1) {
    $pagexg = "开 / <a href='?cmd={$disablexg}'>关</a>";
} else {
    $pagexg = "<a href='?cmd={$enablexg}'>开</a> / 关";
}
$enablexc = $encode->encode("cmd=setting&autoxc=1&sid=$sid");
$disablexc = $encode->encode("cmd=setting&autoxc=0&sid=$sid");
if ($player->autoxc == 1) {
    $pagexc = "开 / <a href='?cmd={$disablexc}'>关</a>";
} else {
    $pagexc = "<a href='?cmd={$enablexc}'>开</a> / 关";
}

$imhtml =<<<HTML
=======设置=======<br/>
<br/>
自动攻击：{$pagezd}<br/>
自动寻怪：{$pagexg}<br/>
使用血池：{$pagexc}<br/>
<br/>
<button onClick="javascript:history.back(-1);">返回上一页</button><br/>
<a href="?cmd=$gonowmid">返回游戏</a>
HTML;
echo $imhtml;