package com.socket;

import static org.jboss.netty.channel.Channels.pipeline;

import java.net.InetSocketAddress;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.jboss.netty.bootstrap.ServerBootstrap;
import org.jboss.netty.channel.ChannelPipeline;
import org.jboss.netty.channel.ChannelPipelineFactory;
import org.jboss.netty.channel.group.ChannelGroup;
import org.jboss.netty.channel.group.DefaultChannelGroup;
import org.jboss.netty.channel.socket.nio.NioServerSocketChannelFactory;
import org.jboss.netty.handler.codec.http.HttpChunkAggregator;
import org.jboss.netty.handler.codec.http.HttpRequestDecoder;
import org.jboss.netty.handler.codec.http.HttpResponseEncoder;

public class WebSocketServer {
	private final int port;  
	  
    public static ChannelGroup recipients = new DefaultChannelGroup(); 
    
    public static boolean hasMsg = false;
    
    private WebSocketServerHandler handler;
  
    public WebSocketServer(int port) {  
        this.port = port;  
    }  
  
    public void run() {  
        ServerBootstrap bootstrap = new ServerBootstrap(
        		new NioServerSocketChannelFactory(Executors.newCachedThreadPool(),
        				Executors.newCachedThreadPool()));  
        bootstrap.setPipelineFactory(new WebSocketServerPipelineFactory());  
        bootstrap.bind(new InetSocketAddress(port));  
        System.out.println("Web socket server started at port " + port + '.');
        /*ExecutorService service = Executors.newFixedThreadPool(1);
        service.execute(new Runnable(){
			@Override
			public void run() {
				 while(true){
			        	if(hasMsg){
			        		handler.sendMsgToAll();
			        	}
			        }
			}});*/
    }
    
    public class WebSocketServerPipelineFactory implements ChannelPipelineFactory {

    	public ChannelPipeline getPipeline() throws Exception {
    		ChannelPipeline pipeline = pipeline();
    		pipeline.addLast("decoder", new HttpRequestDecoder());
    		pipeline.addLast("aggregator", new HttpChunkAggregator(65536));
    		pipeline.addLast("encoder", new HttpResponseEncoder());
    		handler = new WebSocketServerHandler();
    		pipeline.addLast("handler", handler);
    		return pipeline;
    	}
    }
}
