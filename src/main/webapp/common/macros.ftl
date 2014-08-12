<#macro doctype>
<!DOCTYPE html>
<html lang="en">
</#macro>

<#macro head description="" keywords="" title="SCE运维管理系统" charset="UTF-8">
  <head>
    <meta charset="${charset}">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${description}">
    <meta name="Keywords" content="${keywords}"/>
    <#nested/>
        
  </head>
</#macro>

<#macro bootstrap>
	<link href="${base}/css/bootstrap.css" rel="stylesheet">
    <link href="${base}/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${base}/css/docs.css" rel="stylesheet">
    <link href="${base}/css/style.css" rel="stylesheet">
     <style type="text/css">
      body {
        padding-top: 30px;
        padding-bottom: 20px;
        font-size:12px;
      }
      footer{
   		 padding: 0px 20px;
    		text-align: center;
	}
    </style>
    <script type="text/javascript" src="${base}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/js/bootstrap.js"></script>
    <script src="${base}/js/jquery-form.js"></script>
    <script src="${base}/js/jquery.validate.js"></script>
    <script src="${base}/js/jquery.validate_cn.js"></script>
</#macro>


<#macro bootstrap_min>
	<link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/bootstrap-responsive.min.css" rel="stylesheet">
    <script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
</#macro>

<#macro sidemenu>
<div class="span3 bs-docs-sidebar"><ul class="nav nav-list bs-docs-sidenav">
<#list _menus as m>
      <li class="${m.active?string('active','')}"><a href="${m.action}" title="${m.description?default('')}"><i class="icon-chevron-right"></i>${m.title?default('None')}</a></li>
  </#list>
  </ul></div>
</#macro>
<#macro body>
<body>
<div class="container"> 
<#nested>
</div>
</body> <!-- container-->
</#macro>
<#macro tab_group>
<ul class="nav nav-tabs">
<#nested />
</ul>
</#macro>
<#macro tab action="#" desc="None" active=false>
<li ${active?string('class="active"', '')}>
   <a href="${action}">${desc}</a>
 </li>
</#macro>

<#macro breadcrumbs desc="">
<ul class="breadcrumb">
	<li><a href="/">Home</a> <span class="divider">/</span></li>
	<#list _navi as n>
	<#if n_has_next >
		<li><a href="${n.action?default('#')}">${n.title?default('')}</a> <span class="divider">/</span></li>		
	<#else>
		<li class="active">${n.title?default('')}</span></li>
	</#if>
	</#list>
	<#if desc?has_content >
	<li class="active">${desc}</li>
	</#if>
</ul>
</#macro>

<#macro dialog id title="no title" >
<div id="${id}" class="modal fade">
  <div class="modal-dialog">
 	 <div class="modal-content">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    		<h5 class="modal-title">${title}</h5>
  		</div>
  		<div class="modal-body">
  			<#nested />
 	 	</div>
  		<div class="modal-footer">
  			<button class="btn btn-success" id="${id}_ok" type="submit">确定</button>
    		<button class="btn" id="${id}_close">取消</button>
  		</div>
  	</div>
  </div>
</div>
<script language="javascript">
$('#${id}_close').click(function(){
	$('#${id}').modal('hide');
});

$('#${id}_ok').click(function(){
	$('#${id} form').submit();
});
</script>
</#macro>

<#macro dialog_show id title="no title">
<div id="${id}" class="modal" style="modal fade">
 <div class="modal-dialog">
 	 <div class="modal-content">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    		<h5>${title}</h5>
  		</div>
  		<div class="modal-body">
  			<#nested />
  		</div>
  		<div class="modal-footer">
    		<button class="btn" id="${id}_close">关闭</button>
  		</div>
  	</div>
  </div>
</div>
<script language="javascript">

$('#${id}').hide();
$('#${id}_close').click(function(){
	$('#${id}').modal('hide');
});
</script>
</#macro>

<#macro dialog_alert id title="Info">
<div id="${id}" class="modal fade">
   <div class="modal-dialog">
 	 <div class="modal-content">
  		<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    		<h4>${title}</h4>
 	    </div>
  		<div class="modal-body">
	  		<div class="alert alert-error" style="display:none;">
				<button type="button" class="close">&times;</button>
				<lable></lable> 
	  		</div>
	  		<div id="body_content">	
	  		</div>
  		</div>
  		<div class="modal-footer">
 			<button class="btn btn-success pull-right" id="${id}_close" type="submit">确定</button>
 		</div>
	  </div>
	</div>
</div>
<script language="javascript">
	$('#${id}_close').click(function(){
		$('#${id}').modal('hide');
	});
</script>
</#macro>

<#macro dialog_refresh id title="Info">
<div id="${id}" class="modal fade">
	<div class="modal-dialog">
 	  <div class="modal-content">
 	 	<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    		<h4>${title}</h4>
  		</div>
  		<div class="modal-body">
	  		<div id="body_content">
	  		</div>
	  	</div>
  		<div class="modal-footer">
  			<button class="btn btn-primary pull-right" id="${id}_close" type="submit">确定</button>
  		</div>
  	  </div>
	</div>
</div>
<script language="javascript">
	$('#${id}_close').click(function(){
		$('#${id}').modal('hide');
		document.location.reload();
	});
</script>
</#macro>