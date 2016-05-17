package com.vehicledealerapp.dao;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

@Configuration
@EnableJpaRepositories
public class CreateDAOBeans {

	@Autowired
	private DataSource dataSource;
	
	@Bean
	LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean factory
			= new LocalContainerEntityManagerFactoryBean();
		factory.setDataSource(dataSource);
		factory.setPackagesToScan(
				"com.vehicledealerapp.entities.shared",
				"com.vehicledealerapp.entities.subject",
				"com.vehicledealerapp.entities.system",
				"com.vehicledealerapp.entities.valueobjects");
		
		HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
		adapter.setShowSql(true);
		factory.setJpaVendorAdapter(adapter);
		factory.getJpaPropertyMap().put("hibernate.format_sql", true);
		factory.getJpaPropertyMap().put("hibernate.use_sql_comments", true);
		return factory;
	}
	
	@Bean
	JpaTransactionManager transactionManager() {
		return new JpaTransactionManager(entityManagerFactory().getObject());
	}
	
	@Bean
	PersistenceExceptionTranslationPostProcessor persistenceExceptionTranslationPostProcessor() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
}
