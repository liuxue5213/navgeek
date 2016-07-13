<script type="text/javascript">
   $(function () { $('#1').collapse('show')});
</script>  

<div class="panel-group" id="accordion">
<?php
for ($i=0;$i<count($group);$i++) {  ?>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="<?php echo '#'.$group[$i]['id'];?>" onclick="shdden(this.href)">
                <?php echo $group[$i]['name'];?>
                </a>
            </h4>
        </div>

        <div id="<?php echo $group[$i]['id'];?>" class="panel-collapse collapse">
            <div class="panel-body">
            <?php 
                for ($k=0;$k<count($data);$k++){ 
                if($group[$i]['id']==$data[$k]['post_type']){   ?>
                    <a class="btn btn-default" style="width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" href="<?php echo $data[$k]['url'];?>"><?php echo $data[$k]['title'];?>
                    </a>
                <?php } } ?>
            </div>
        </div>
    </div>
<?php } ?>

</div>







