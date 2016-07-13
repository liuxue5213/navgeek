


<!-- ALERT START -->
<?php $this->renderPartial('//layouts/alert');?>
<!-- ALERT END -->

<form action="/user/for_upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="submit" value="上传">
</form>