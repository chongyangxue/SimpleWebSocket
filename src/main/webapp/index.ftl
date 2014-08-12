<@override name="head">
<script language="javascript">
$(function(){
	var socket = new WebSocket('ws://10.1.80.69:4700/websocket'); 

	socket.onopen = function(event) { 
  		// 发送一个初始化消息
  		var cmd = $("#command").val();
  		
  		socket.send(cmd);
  		socket.onopen = function(event) {  
            $("#result").val(event.data); 
        };  
        
  		// 监听消息
  		socket.onmessage = function(event) { 
    		$("#result").val(event.data);
  		};

  		socket.onclose = function(event) { 
    		console.log('Client notified socket has closed', event); 
  		};
  		//socket.close();
  	};
  	
  	$("#sendMsg").click(function(){
  		socket.send($("#command").val()); 
  	});
});
</script>
</@override>

<@override name="content">
 <div>
 	命令：<input type="text" name="command" id="command"></input>
 	<input type="button" value="执行" id="sendMsg"> </input>
 	结果：<input type="text" name="result" id="result"></input>
 </div>

</@override>
<@extends name="/common/base.ftl"/>