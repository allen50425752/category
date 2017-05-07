<?php 
include("db.inc.php");

function getList($link=null, $pid=0, &$result=array(), $spac=0){
	$spac = $spac + 6;
    $sql = "select * from `category` where `pid` = $pid";
    $res = mysqli_query($link, $sql);
    while($row = mysqli_fetch_assoc($res)){
        $row['cate_name']=str_repeat('&nbsp',$spac).'|--'.$row['cate_name'];
        $result[] = $row;
        getList($link, $row['id'], $result, $spac);
    }
    return $result;
}

// echo '<pre>';
// print_r($res);
function display($link, $pid=0, $selected=0){
	$res = getList($link, $pid);
	$str = "<select>";
	foreach ($res as $k => $v) {
		$selectedstr = '';
		if($v['id'] == $selected){
			$selectedstr = 'selected';
		}
		$str.=  "<option {$selectedstr}>{$v['cate_name']}</option>";
	}
	$str.= "</select>";
	return $str;
}

echo display($link, 0, 4);

//==============================================================================//
function getCategoryPath($link=null, $cid=0, &$result=array()){
    $sql = "select * from `category` where `id` = $cid";
    $res = mysqli_query($link, $sql);
    while($row = mysqli_fetch_assoc($res)){
        $result[] = $row;
        getCategoryPath($link, $row['pid'], $result);
    }
    krsort($result);
    return $result;
}
function displayLink($link, $url='cate.php?cid='){
	$res = getCategoryPath($link, 10);
	$str = '';
	foreach ($res as $k => $v) {
		$str .= "<a href='{$v['id']}'>{$v['cate_name']}</a>>";
	}
	return $str;
}
echo displayLink($link , 'cate.php?page=1&cid=');