/* 
* @Author: anchen
* @Date:   2016-05-03 17:24:07
* @Last Modified by:   anchen
* @Last Modified time: 2016-05-03 19:32:53
*/
//加密方法
  function navgeek_encode(str){
    var unix_time=Math.round(new Date().getTime()/1000);
    var ng_key='liuxue'+unix_time;
    var key=CryptoJS.enc.Latin1.parse(ng_key);
    var iv=CryptoJS.enc.Latin1.parse(ng_key);
    var encrypted = CryptoJS.AES.encrypt(str,key,{iv:iv,mode:CryptoJS.mode.CBC,padding:CryptoJS.pad.ZeroPadding});
    return encrypted;
  }

  //用户注册
  function regist(){
    var reg_first_name=$('#reg_first_name').val();
    var reg_last_name=$('#reg_last_name').val();
    var reg_username=$('#reg_username').val();
    var reg_re_username=$('#reg_re_username').val();
    var reg_password=$('#reg_password').val();
    reg_password=$.md5(reg_password);
    var reg_year=$('#reg_year').val();
    var reg_month=$('#reg_month').val();
    var reg_day=$('#reg_day').val();
    var reg_sex  = $('input[name="reg_sex"]:checked').val();
    var unix_time=Math.round(new Date().getTime()/1000);

    //判断 姓名
    if(reg_first_name=='' || reg_last_name==''){
      window.location.href="/user/login/status/10009";
    }
    //判断 用户名
    if(reg_username=='' || reg_re_username==''){
      window.location.href="/user/login/status/10010";
    }
    //判断 密码
    if(reg_password==''){
      window.location.href="/user/login/status/10011";
    }
    //判断 生日有效性
    if(reg_year=='' || reg_month=='' || reg_day==''){
      window.location.href="/user/login/status/10012";
    }
    //判断 2次用户名输入
    if(reg_username!=reg_re_username){
      window.location.href="/user/login?status=10004";
    }else{
      var name=reg_first_name+reg_last_name;
      var birthday=reg_year+'-'+reg_month+'-'+reg_day;
      var str='nickname='+name+'&username='+reg_username+'&password='+reg_password+'&birthday='+birthday+'&sex='+reg_sex;
      var encode_str=navgeek_encode(str);
      setUserInfo(1,reg_username,unix_time,encode_str.toString());
    }
  }

  //用户登录
  function login(){
    var login_username=$('#login_username').val();
    var login_password=$('#login_password').val();
    if(login_username=='' || login_password==''){
      window.location.href="/user/login/status/10008";
    }else{
      login_password=$.md5(login_password);
      var unix_time=Math.round(new Date().getTime()/1000);
      var str='username='+login_username+'&password='+login_password;
      var encode_str=navgeek_encode(str);
      setUserInfo(2,login_username,unix_time,encode_str.toString());
    }
  }  

  //设置用户信息
  function setUserInfo(tag,username,unix_time,encode_str){
    $.ajax({
      type: "POST",
      url: "/user/setUserInfo",
      data: {utime:unix_time,str:encode_str},
      dataType: "json",
      success: function(data){
          if(tag==1){
            window.location.href="/user/PostRegister?utime="+unix_time+"&username="+username;
          }else{
            window.location.href="/user/PostLogin?utime="+unix_time+"&username="+username;
          }
        }
    });
  }

  function user_info(){
    var username=$('#username').val();
    var email=$('#email').val();
    var other_email=$('#other_email').val();
    var mobile=$('#mobile').val();
    var home_url=$('#home_url').val();
    var qq_no=$('#qq_no').val();
    var location=$('#location').val();
    var wechat_no=$('#wechat_no').val();
    var interest1=$('#interest1').val();
    var interest2=$('#interest2').val();
    var interest3=$('#interest3').val();
    var unix_time=Math.round(new Date().getTime()/1000);
    if(username!='' || email!='' ||other_email!='' || mobile!='' || home_url!='' ||qq_no!='' ||location!='' || wechat_no!='' || interest1!='' || interest2!='' || interest3!=''){
      var str='email='+email+'&other_email='+other_email+'&mobile='+mobile+'&home_url='+home_url+'&qq_no='+qq_no+'&location='+location+'&wechat_no='+wechat_no+'&interest1='+interest1+'&interest2='+interest2+'&interest3='+interest3;
      var encode_str=navgeek_encode(str);
      setInfos(username,unix_time,encode_str.toString());
    }
  }

 //设置用户信息
  function setInfos(username,unix_time,encode_str){
    $.ajax({
      type: "POST",
      url: "/user/Introduce",
      data: {tag:1,utime:unix_time,str:encode_str},
      dataType: "json",
      success: function(data){
          if(data==1){
            window.location.href="/user/introduce/status/10000";
          }else{
            window.location.href="/user/introduce/status/10014";
          }
        }
    });
  }

