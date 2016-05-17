package com.vehicledealerapp.web;

import javax.servlet.Filter;

import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.vehicledealerapp.dao.CreateDAOBeans;
import com.vehicledealerapp.datasource.CreateDataSourceBean;
import com.vehicledealerapp.services.CreateServiceBeans;

public class Initializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { CreateDataSourceBean.class,
			CreateDAOBeans.class, CreateServiceBeans.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { CreateControllerBeans.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
	@Override
	protected Filter[] getServletFilters() {
		return new Filter[] { new OpenEntityManagerInViewFilter() };
	}

}
