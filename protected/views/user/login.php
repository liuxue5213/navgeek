<!-- ALERT START -->
<?php $this->renderPartial('//layouts/alert');?>
<!-- ALERT END -->

<!-- LOGIN START -->
<form class="form-inline" role="form" method="post">
   <div class="form-group">
      <label class="sr-only" for="login_username">手机号邮箱</label>
      <input type="text" class="form-control" id="login_username" name="login_username" placeholder="请输入手机号或邮箱">
   </div>
   <div class="form-group">
      <label class="sr-only" for="login_password">密码</label>
      <input type="password" class="form-control" id="login_password" name="login_password" placeholder="请输入密码">
   </div>
   <a class="btn btn-primary" onclick="login()">登录</a>
</form>
<!-- LOGIN END -->

<!-- REGISTER START -->
  <form class="form-horizontal" id="form">
    <fieldset>
        <h3><b>注册</b></h3>
        <div class="control-group">
          <div class="controls">
            <input id="reg_first_name" type="text" placeholder="姓" name="reg_first_name" class="input-xlarge">
            <input id="reg_last_name" type="text"  placeholder="名" name="reg_last_name" class="input-xlarge">
          </div>
        </div><br> 
    	<div class="control-group">
          <div class="controls">
            <input type="text" id="reg_username" name="reg_username" placeholder="手机号或邮箱" class="input-xlarge">
          </div>
        </div><br>

        <div class="control-group">
          <div class="controls">
            <input id="reg_re_username" name="reg_re_username" type="text"  placeholder="再次输入手机号或邮箱" class="input-xlarge">
          </div>
        </div><br>

        <div class="control-group">
          <div class="controls">
            <input id="reg_password" type="password" name="reg_password" placeholder="创建密码" class="input-xlarge">
          </div>
        </div><br>

        <div class="control-group">
        	<label for="input01">生日</label>
          <div class="controls">
            <select id="reg_year" name="reg_year" class="span2">
              <option value="">年</option>
              <?php 
              $year=date('Y');
              for ($i=$year;$i>$year-100;$i--) { 
                echo "<option value='$i'>$i 年</option>";
              }
              ?>
            </select>

            <select id="reg_month" name="reg_month">
              <option value="">月</option>
              <?php 
              for ($i=1;$i<12;$i++) { 
                echo "<option value='$i'>$i 月</option>";
              }
              ?>
            </select>

            <select id="reg_day" name="reg_day">
              <option value="">日</option>
              <?php 
              for ($i=1;$i<31;$i++) { 
                echo "<option value='$i'>$i 日</option>";
              }
              ?>
            </select>

          </div>
        </div><br>

    	<div class="control-group">
          <div class="controls">
            <label for="reg_sex1">男</label>
            <input type="radio" name="reg_sex" id="reg_sex1" value="1" checked>
            <label for="reg_sex2">女</label>
            <input type="radio" name="reg_sex" id="reg_sex2" value="2">
          </div>
      </div><br>

      <p class="_58mv">点击注册，即表示你同意我们的<a href="/help/terms" target="_blank" rel="nofollow">条款</a>，且已阅读过我们的<a href="/help/privacy" target="_blank" rel="nofollow">数据使用政策</a>，包括 <a href="/help/cookies" target="_blank" rel="nofollow">Cookie 使用政策</a>。</p>

    	<div class="control-group">
        <div class="controls">
          <a class="btn btn-success" onclick="regist()">注册</a>
        </div>
      </div>

    </fieldset>
  </form>
<!-- REGISTER END -->

<!-- JS START -->
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/crypto-js/aes.js"></script> 
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/crypto-js/md5.js"></script> 
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/crypto-js/pad-zeropadding.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/md5.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/user/user.js"></script>
<!-- JS START -->

