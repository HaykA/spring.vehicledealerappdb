package com.vehicledealerapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.shared.entities.Country;

public interface CountryDAO  extends JpaRepository<Country, Long> {
	
	@EntityGraph(Country.WITH_CONTINENT)
	List<Country> findByEnabled(boolean enabled);
	
	/*
	@EntityGraph(Country.WITH_CONTINENT)
	List<Country> findByCityIsNotNull();*/
	
	List<Country> findByEnabledOrCitiesNotNull(boolean enabled);
}
