<?php
/**
 * @Author: anchen
 * @Date:   2016-04-28 18:54:02
 * @Last Modified by:   anchen
 * @Last Modified time: 2016-04-28 19:32:06
 */

class Func{
    public function php_decode($utime,$str){
        $privateKey = "liuxue".$utime;
        $iv="liuxue".$utime;
        $encryptedData = base64_decode($str);
        $decrypted = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $privateKey, $encryptedData, MCRYPT_MODE_CBC, $iv);
        $arr=explode('&',$decrypted);
        for($i=0;$i<count($arr);$i++){
            $arr_one[$i]=explode('=',$arr[$i]);
            $arr_two[$arr_one[$i][0]]=$arr_one[$i][1];
        }
        return $arr_two;
    }







}