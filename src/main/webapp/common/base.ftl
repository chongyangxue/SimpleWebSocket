<@html.doctype />
<head>
	<meta charset="utf-8">
    <title>SimpletWebApp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Sachiel">

    <script type="text/javascript" src="${base}/js/jquery.min.js"></script>

    <style type="text/css">
      body {
        padding-top: 15px;
        padding-bottom: 40px;
      }
    </style>   

<@block name="head" />
</head>
<@html.body>
 

 <div>
      <@block name="content" />
      <hr>
		<footer style="text-align:center;font-size:9pt">
		<p>Copyright &copy; 2014 www.sachiel.net All Rights Reserved.</p>
		</footer>
</div>
</@html.body>
</html>