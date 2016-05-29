package com.vehicledealerapp.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.general.entities.City;
import com.vehicledealerapp.persistence.shared.entities.Country;


public interface CityDAO extends JpaRepository<City, Long> {
	
	Page<City> findByCountry(Country country, Pageable pageable);

	List<City> findByCountryOrderByName(Country country);
	
	List<City> findByCountryOrderByPostalCode(Country country);
	
	@Override
	@EntityGraph(City.WITH_COUNTRY)
	Page<City> findAll(Pageable pageable);
}
