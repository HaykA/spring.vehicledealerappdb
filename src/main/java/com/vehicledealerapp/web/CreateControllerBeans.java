package com.vehicledealerapp.web;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.validation.beanvalidation.SpringValidatorAdapter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.vehicledealerapp.web.util.LocaleResourceResolver.Mapping;
import com.vehicledealerapp.web.util.LocaleResourceResolver.View;

@Configuration
@ComponentScan
@EnableWebMvc
@EnableSpringDataWebSupport
public class CreateControllerBeans extends WebMvcConfigurerAdapter {
	@Bean
	InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/JSP/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Bean
	MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource
			= new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:messagecodes");
		messageSource.setFallbackToSystemLocale(false);
		return messageSource;
	}
	
	@Bean
	LocalValidatorFactoryBean validatorFactory() {
		LocalValidatorFactoryBean factory = new LocalValidatorFactoryBean();
		factory.setValidationMessageSource(messageSource());
		return factory;
	}
	
	@Override
	public Validator getValidator() {
		return new SpringValidatorAdapter(this.validatorFactory().getValidator());
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LocaleChangeInterceptor());
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/core/**")
			.addResourceLocations("/images/core/");
		registry.addResourceHandler("/browser/core/css/**")
			.addResourceLocations("/browser/core/css/");
		registry.addResourceHandler("/browser/core/js/**")
			.addResourceLocations("/browser/core/js/");
		registry.addResourceHandler("/browser/3p/bootstrap/**")
			.addResourceLocations("/browser/3p/bootstrap/");
		registry.addResourceHandler("/browser/3p/fa/**")
		.addResourceLocations("/browser/3p/fa/");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController(Mapping.SETTINGS).setViewName(View.SETTINGS);
	}

}
