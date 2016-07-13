<?php 
//返回的操作状态
$status=Yii::app()->request->getParam('status');

$error=array(
'10000'=>'操作成功！',
'10001'=>'该账户已经被注册，请更换用户名！',
'10002'=>'注册失败,请稍后再试！',
'10003'=>'注册失败,请重新操作！',
'10004'=>'两次用户名输入有误！',
'10005'=>'该用户名不存在，请重新输入！',
'10006'=>'密码错误，请重新输入！',
'10007'=>'用户状态异常，请联系管理员！',
'10008'=>'用户名或者密码不能为空！',
'10009'=>'姓或名不能为空！',
'10010'=>'用户名不能为空！',
'10011'=>'密码不能为空！',
'10012'=>'请选择正确的生日！',
'10013'=>'数据导入失败,请稍后再试！',
'10014'=>'用户信息修改失败,请稍后再试！'
);
if($status==null){
    $err='未知错误，请联系管理员！';
}else{
    $err=$error[$status];
}

if(@$status>10000 && $status!=null ){ ?>
<div class="alert alert-danger alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" 
      aria-hidden="true">
      &times;
    </button>
    <?php echo $err;?>
</div>
<?php }elseif($status==10000){ ?>
<div class="alert alert-success alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" 
      aria-hidden="true">
      &times;
    </button>
    <?php echo $err;?>
</div>
<?php }?>