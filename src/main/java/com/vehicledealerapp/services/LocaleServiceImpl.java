package com.vehicledealerapp.services;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;

import com.vehicledealerapp.dao.ContinentDAO;
import com.vehicledealerapp.dao.CountryDAO;
import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

@ReadOnlyTransactionalService
public class LocaleServiceImpl implements LocaleService {

	private final CountryDAO countryDAO;
	private final ContinentDAO continentDAO;
	
	@Autowired
	public LocaleServiceImpl(CountryDAO countryDAO,
			ContinentDAO continentDAO) {
		this.countryDAO = countryDAO;
		this.continentDAO = continentDAO;
	}
	
	@Override
	public List<Continent> findAllContinents() {
		return continentDAO.findAll();
	}
	

	@Override
	public List<Continent> findEnabledContinents() {
		return continentDAO.findByEnabled(true);
	}

	@Override
	public List<Continent> findDisabledContinents() {
		return continentDAO.findByEnabled(false);
	}
	
	@Override
	public List<Country> findAllCountries() {
		return countryDAO.findAll();
	}
	
	@Override
	public List<Country> findEnabledCountries() {
		return countryDAO.findByEnabled(true);
	}
	
	@Override
	public List<Country> findDisabledCountries() {
		return countryDAO.findByEnabled(false);
	}
	
	@ModifyingTransactionalServiceMethod
	public void deleteAll() {
		countryDAO.deleteAll();
	}
	
	@ModifyingTransactionalServiceMethod
	public void update(Country country) {
		countryDAO.update(country);
	}

	@ModifyingTransactionalServiceMethod
	@Override
	public void executeMaintenance() {
		List<Country> countries
			= new ArrayList<>(new TreeSet<>(findAllCountries()));
		deleteAll();
		for (int i = 0; i < countries.size(); i++) {
			countries.get(i).setId(i + 1);
			update(countries.get(i));
		}
	}
}
