package com.action;


import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.core.PriorityOrdered;
import org.springframework.stereotype.Component;

import com.socket.WebSocketServer;

@Component
public class ContextSupport implements BeanFactoryPostProcessor, PriorityOrdered{

	@Override
	public int getOrder() {
		return 1;
	}

	@Override
	public void postProcessBeanFactory(
			ConfigurableListableBeanFactory beanFactory) throws BeansException {
		new WebSocketServer(4700).run();
	}
}
