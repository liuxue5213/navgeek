<!DOCTYPE html>
<html lang="zh-CN">
 	<head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
    	<!-- CSS -->
  		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap.min.css" />
  		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap-theme.min.css" />
  	 	<!-- JS -->
  		<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.min.js" type="text/javascript"></script>
  		<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap.min.js"></script>  
  	</head>
    <?php 


    ?>
 	<body >
       <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">
                        <?php $this->renderPartial('//layouts/header'); ?>
                        <div class="span8">
                    <ul class="nav nav-tabs">
                    <!--class="active" pills -->
                        <li>
                            <a href="/site/index">我的收藏</a>
                        </li>
                        <li>
                            <a href="/site/refernavs">推荐导航</a>
                        </li>
                        <li>
                            <a href="/site/refernews">推荐新闻</a>
                        </li>

                        <?php if(Yii::app()->session['user_info']){?>
                         <li class="dropdown pull-center">
                             <a href="#" data-toggle="dropdown" class="dropdown-toggle"><?php echo Yii::app()->session['user_info']['nickname'];?><strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/user/introduce">个人中心</a>
                                </li>
                                <li>
                                    <a href="/user/setting">偏好设置</a>
                                </li>
                                <li>
                                    <a href="/user/upload">导入书签</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="/user/logout">退出</a>
                                </li>
                            </ul>
                        </li>    
                        
                        <?php }else{ ?>
                        <li>
                            <a href="/user/login">登录</a>
                        </li>   
                        <?php  }?>
                    </ul>
                        </div>
                        <div class="well1"><?php echo $content;?></div>
                        <?php $this->renderPartial('//layouts/footer'); ?>
                    </div>
                </div>
            </div>
        </div>

  	</body>
</html>