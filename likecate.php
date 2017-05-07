<?php

$db_host = '127.0.0.1';
$db_user = 'root';
$db_password = '';
$db_name = 'category';
$link = mysql_connect($db_host,$db_user,$db_password) or die(mysql_error());
mysql_select_db($db_name) or die(mysql_error());
mysql_query("set names utf8");


function display($path=''){
	$sql = 'select id,cate_name,path,concat(path,",",id) as fullpath from likecate order by  fullpath asc';
	$res = mysql_query($sql);
	$result = array();
    while($row = mysql_fetch_assoc($res)){
    	$deep = count(explode(',', trim($row['fullpath'], ',')));
    	$row['cate_name'] =  str_repeat('&nbsp;', $deep*10) . '|--' . $row['cate_name'];
        $result[] = $row;
    }
    return $result;
}
$res = display();
// echo '<pre>';
// print_r($res);
echo  "<select>";
foreach ($res as $k => $v) {
	echo "<option {$selectedstr}>{$v['cate_name']}</option>";
}
echo "</select>";

//==============================================================================//
function getCategoryPath($cid){
	$sql = "select *,concat(path,',',id) as fullpath from likecate where id = $cid";
	$res = mysql_query( $sql);
	$row = mysql_fetch_assoc($res);
	$ids = $row['fullpath'];

	$sql = "select * from likecate where id in ({$ids})";
	$res = mysql_query($sql);
	$result = array();
    while($row = mysql_fetch_assoc($res)){
        $result[] = $row;
    }
    return $result;
}

function displayLink($cid, $url='cate.php?cid='){	
	$res = getCategoryPath($cid);
	$str = '';
	foreach ($res as $k => $v) {
		$str .= "<a href = '{$url}{$v['id']}'>{$v['cate_name']}</a>>";
	}
	return $str;
}
echo displayLink(4, 'cate.php?page=1&cid=');