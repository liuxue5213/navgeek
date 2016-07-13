<?php
/**
 * @Author: anchen
 * @Date:   2016-04-13 11:42:47
 * @Last Modified by:   anchen
 * @Last Modified time: 2016-07-13 10:15:06
 */

class UserController extends CController{
    /*
    登录方法
     */
    public function actionLogin(){
        // $redis = new redis();  
        // $result = $redis->connect('127.0.0.1',6379);  
        // var_dump($result); //结果：bool(true)  

        $this->render('login',array());
    }


    /*
    设置用户信息
     */
    public function actionSetUserInfo(){
        $str=Yii::app()->request->getParam('str');
        $utime=Yii::app()->request->getParam('utime');
        //解密
        $arr=Func::php_decode($utime,$str);
        // 设置session变量：
        if($arr['username']){
            Yii::app()->session[$arr['username']]=array('ctime'=>$utime,'data'=>$str);
            echo '1';
        }else{
            echo '0';
        }
    }

    /*
    新用户注册
     */
    public function actionPostRegister(){
        $username=Yii::app()->request->getParam('username');
        $utime=Yii::app()->request->getParam('utime');
        $session=Yii::app()->session[$username];
        $time=date('Y-m-d H:i:s');
        $asql="";
        $bsql="";
        //判断数据时间
        if($utime==$session['ctime']){
            //判断 用户是否注册
            $csql="SELECT count(id) as cid FROM nav_users WHERE username='$username' ";
            $cdata=Yii::app()->db->createCommand($csql)->queryRow();
            if($cdata['cid']>0){
                $this->redirect(array('/user/login','status'=>10001)); 
                die();
            }else{
                // $transaction=Yii::app()->db->beginTransaction();
                // try{
                    //解密
                    $dec_data=Func::php_decode($session['ctime'],$session['data']);
                    foreach ($dec_data as $key => $value) {
                        $asql.="$key,";
                        $bsql.="'$value',";
                    }

                    $sql="insert into nav_users(".$asql."updated_time,created_time,status)values(".$bsql."'$time','$time',1)";
                    $cadd=Yii::app()->db->createCommand($sql)->execute();
                    //提交事务
                    if($cadd>0){
                        // $transaction->commit();
                        $usql="SELECT id,nickname,username,status FROM nav_users WHERE username='$username' ";
                        $uinfo=Yii::app()->db->createCommand($usql)->queryRow();
                        $id=$uinfo['id'];

                        //注册成功 删除用户数据session   设置新的用户信息session
                        unset(Yii::app()->session[$username]);
                        Yii::app()->session['user_info']=array('id'=>$id,'username'=>$uinfo['nickname'],'nickname'=>$uinfo['nickname'],'status'=>'1');
                        
                        //插入日志
                        $log_sql="insert into nav_users_logs(user_id,type,log,created_time)values($id,'user','用户注册','$time')";
                        Yii::app()->db->createCommand($log_sql)->execute();
                        // 插入 默认分类
                        $group_sql="insert into nav_group_type(name,status,author,updated_time,created_time)values('未分类',1,$id,now(),now() )";
                        Yii::app()->db->createCommand($group_sql)->execute();
                        // $transaction->commit();
                        $this->redirect(array('/site/index?id='.$id,'status'=>10000));
                    }else{
                        // $transaction->rollback();
                        $this->redirect(array('/user/login','status'=>10003));
                    }
                // }catch (Exception $e) {
                //     $transaction->rollback();
                //     $this->redirect(array('/user/login','status'=>10002));
                // }
            }
        }else{
            $this->redirect(array('/user/login','status'=>10003));
        }
    }

    /*
    用户退出登录  删除session
     */
    public function actionlogout(){
        //插入日志
        $id=Yii::app()->session['user_info']['id'];
        $time=date('Y-m-d H:i:s');
        $log_sql="insert into nav_users_logs(user_id,type,log,created_time)values($id,'user','用户退出登录','$time')";
        Yii::app()->db->createCommand($log_sql)->execute();
        //删除session
        unset(Yii::app()->session['user_info']);
        $this->redirect(array('/user/login'));
    }



    /*
    用户管理  登录
     */
    public function actionPostLogin(){
        $utime=Yii::app()->request->getParam('utime');
        $username=Yii::app()->request->getParam('username');
        $session=Yii::app()->session[$username];
        $time=date('Y-m-d H:i:s');

        //解密  获取到登陆的用户名 密码 
        $dec_data=Func::php_decode($session['ctime'],$session['data']);
        $username=$dec_data['username'];
        $password=$dec_data['password'];

        //查询用户信息
        $sql="SELECT id,nickname,username,password,status FROM nav_users WHERE username='$username' ";
        $db_user_info=Yii::app()->db->createCommand($sql)->queryRow();

        if($db_user_info['status']>0){
            if($db_user_info!=null){
                if($db_user_info['password']==trim($password)){
                    $id=$db_user_info['id'];
                    unset(Yii::app()->session[$username]);
                    Yii::app()->session['user_info']=array('id'=>$id,'nickname'=>$db_user_info['nickname'],'username'=>$db_user_info['username'],'status'=>'1');
                    //插入日志
                    $log_sql="insert into nav_users_logs(user_id,type,log,created_time)values($id,'user','用户登录','$time')";
                    Yii::app()->db->createCommand($log_sql)->execute();
                    $this->redirect(array('/site/index','name'=>$db_user_info['nickname'],'status'=>10000));
                }else{
                    $this->redirect(array('/user/login','status'=>10006));
                }
            }else{
                $this->redirect(array('/user/login','status'=>10005));
            }
        }else{
            $this->redirect(array('/user/login','status'=>10007));
        }
    }




    public function actionSetting(){
        $this->render('setting',array());
    }

    /*
    完善个人信息
    */
    public function actionIntroduce(){
        // $this->layout = '//layouts/column1';
        $tag=Yii::app()->request->getParam('tag');
        if($tag=='1'){
            $asql='';
            $bsql='';
            $str=Yii::app()->request->getParam('str');
            $utime=Yii::app()->request->getParam('utime');
            $user_id=Yii::app()->session['user_info']['id'];

            //解密数据
            $arr=Func::php_decode($utime,$str);
            foreach ($arr as $key => $value) {
                $asql.="$key,";
                $bsql.="'$value',";
            }

            //获取数据库中 存在的数量
            $cnum = Yii::app()->db->createCommand()
                ->select('max(id) as id')
                ->from('nav_users_info')
                ->where("user_id=$user_id and status=1")
                ->queryRow();
            $id=$cnum['id'];
            //软删除  重复数据
            if($id){
                $usql="update nav_users_info set status=0,updated_time=now() where id=$id";
                Yii::app()->db->createCommand($usql)->execute();
            }
            
            $sql="insert into nav_users_info(user_id,".$asql."updated_time,created_time,status)values($user_id,".$bsql."now(),now(),1)";
            $rs=Yii::app()->db->createCommand($sql)->execute();
            if($rs>0){
                echo "1";
            }else{
                echo "0";
            } 
        }elseif($tag==2){
            

        }else{
            $session=Yii::app()->session['user_info'];
            if($session['id']){
                $id=$session['id'];
                $sql="SELECT * FROM nav_users_info WHERE user_id='$id' ORDER BY id DESC limit 1 ";
                $row=Yii::app()->db->createCommand($sql)->queryRow();
            }else{
                $row=array();
            }
            $this->render('introduce',array('info'=>$row));
        }
    }



    /*
    上传页面
     */
    public function actionUpload(){
        $this->render('upload',array());
    }
    /*
    接收上传的文件  
    并将数据  插入到数据库中
     */
    public function actionFor_Upload(){
        $content=file_get_contents($_FILES['file']['tmp_name']);
        $arr=self::get_links($content);
        //URL地址
        $link=$arr[2];
        //标题
        $title=$arr[4];
        $image_url='';
        $session=Yii::app()->session['user_info'];
        $author=$session['id'];

        if($session==null){
            $this->redirect(array('/user/upload','status'=>10013));
            die();
        }else{
            //获取数据库中的默认分类ID
            $tg_id=Yii::app()->db->createCommand("select id from nav_group_type where author=$author ")->queryRow();
            if(isset($tg_id)){
                $post_type=$tg_id['id'];
            }else{
                $post_type='1';
            }

            $transaction=Yii::app()->db->beginTransaction();
            try{
                //拼接 插入SQL语句
                if(count($link)>0){
                    $sql="INSERT INTO nav_titles(title,url,image_url,author,post_type,status,updated_time,created_time) VALUES";
                    for ($i=0;$i<count($link);$i++){
                        //转义 特殊字符
                        $atitle=addslashes($title[$i]);
                        $ahref=addslashes($link[$i]);
                        $sql.="('$atitle','$ahref','$image_url','$author',$post_type,'1',now(),now() ),";
                    }
                    $sql=strval(substr($sql,0,-1));
                    $rs=Yii::app()->db->createCommand($sql)->execute();
                }
                if($rs>0){
                    //提交事务会真正的执行数据库操作
                    $transaction->commit();
                    $this->redirect(array('/user/upload','status'=>10000));
                }else{
                   $transaction->rollback();
                   $this->redirect(array('/user/upload','status'=>10013));
                }
            }catch (Exception $e) {
                $transaction->rollback();
                $this->redirect(array('/user/upload','status'=>10013));
            }
        }  
    }
    /*
    正则 表达式  获取数据
     */
    public static function get_links($content) {  
        $pattern = '/<a(.*?) href="(.*?)" (.*?)>(.*?)<\/a>/i';  
        preg_match_all($pattern, $content, $m);  
        return $m;  
    }



    

    



}