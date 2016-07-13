<?php
/**
 * @Author: anchen
 * @Date:   2016-04-23 14:21:37
 * @Last Modified by:   anchen
 * @Last Modified time: 2016-04-23 14:23:35
 */
class HelpController extends CController{
    //条款
    public function actionTerms(){
        $this->render('terms',array());
    }
    //数据使用政策
    public function actionPrivacy(){
        $this->render('privacy',array());
    }
    //Cookie 使用政策
    public function actionCookies(){
        $this->render('cookies',array());
    }








    



}