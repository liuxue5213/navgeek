<!-- ALERT START -->
<?php $this->renderPartial('//layouts/alert');?>
<!-- ALERT END -->
<!-- USER_INFO START -->
  <form class="form-horizontal" id="form">
    <fieldset>
        <h3><b>完善个人信息</b></h3>
        <div class="control-group">
          <div class="controls">
            <label for="email">主邮箱</label>
            <input id="email" type="text" name="email" class="input-xlarge" value="<?php echo $info['email'];?>">
            <label for="other_email">其他邮箱</label>
            <input id="other_email" type="text" name="other_email" class="input-xlarge" value="<?php echo $info['other_email'];?>">
          </div>
        </div><br> 

        <div class="control-group">
          <div class="controls">
            <label for="home_url">个人主页</label>
            <input id="home_url" type="text" name="home_url" class="input-xlarge" value="<?php echo $info['home_url'];?>">
            <label for="mobile">移动电话</label>
            <input id="mobile" type="text" name="mobile" class="input-xlarge" value="<?php echo $info['mobile'];?>">
          </div>
        </div><br> 

        <div class="control-group">
          <div class="controls">
            <label for="wechat_no">微信号</label>
            <input id="wechat_no" type="text" name="wechat_no" class="input-xlarge" value="<?php echo $info['wechat_no'];?>">
            <label for="qq_no">QQ号</label>
            <input id="qq_no" type="text" name="qq_no" class="input-xlarge" value="<?php echo $info['qq_no'];?>">
          </div>
        </div><br> 

        <div class="control-group">
          <div class="controls">
            <label for="location">居住城市</label>
            <input id="location" type="text" name="location" class="input-xlarge" value="<?php echo $info['location'];?>">
            <label for="interest1">第一爱好</label>
            <input id="interest1" type="text" name="interest1" class="input-xlarge" value="<?php echo $info['interest1'];?>">
          </div>
        </div><br>

        <div class="control-group">
          <div class="controls">
            <label for="interest2">第二爱好</label>
            <input id="interest2" type="text" name="interest2" class="input-xlarge" value="<?php echo $info['interest2'];?>">
            <label for="interest3">第三爱好</label>
            <input id="interest3" type="text" name="interest3" class="input-xlarge" value="<?php echo $info['interest3'];?>">
          </div>
        </div><br>
        
        <input type="hidden" name="username" value="<?php echo $session=Yii::app()->session['user_info']['nickname'];?>">

        <div class="control-group">
        <div class="controls">
          <a class="btn btn-success" onclick="user_info()">确认填写</a>
        </div>
      </div>
    </fieldset>
  </form>
<!-- USER_INFO END -->

<!-- JS START -->
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/crypto-js/aes.js"></script> 
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/crypto-js/md5.js"></script> 
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/crypto-js/pad-zeropadding.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/md5.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/user/user.js"></script>
<!-- JS START -->