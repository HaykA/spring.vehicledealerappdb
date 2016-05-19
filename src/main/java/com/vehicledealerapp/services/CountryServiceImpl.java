package com.vehicledealerapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.vehicledealerapp.dao.CountryDAO;
import com.vehicledealerapp.entities.shared.Country;

@ReadOnlyTransactionalService
public class CountryServiceImpl implements CountryService {

	private final CountryDAO countryDAO;
	
	@Autowired
	public CountryServiceImpl(CountryDAO countryDAO) {
		this.countryDAO = countryDAO;
	}
	
	@Override
	public List<Country> findAll() {
		return countryDAO.findAll();
	}
	
	@Override
	public List<Country> findWhereEnabled() {
		return countryDAO.findByEnabled(true);
	}
	
	@Override
	public List<Country> findWhereDisabled() {
		return countryDAO.findByEnabled(false);
	}
	

}
