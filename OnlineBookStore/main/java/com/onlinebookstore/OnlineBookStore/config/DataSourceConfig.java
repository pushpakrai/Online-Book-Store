package com.onlinebookstore.OnlineBookStore.config;

import javax.sql.DataSource;
//import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.beans.factory.annotation.Value;


@Configuration
public class DataSourceConfig {
	
	@Value("${custom.datasource.url}")
    private String databaseUrl;

    @Value("${custom.datasource.username}")
    private String username;

    @Value("${custom.datasource.password}")
    private String password;

    @Value("${custom.datasource.driver-class-name}")
    private String driverClassName;

	@Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(databaseUrl);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

}

