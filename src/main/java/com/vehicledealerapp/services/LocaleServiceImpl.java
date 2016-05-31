package com.vehicledealerapp.services;

import java.util.List;

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
	public List<Country> findEnabledCountries() {
		return countryDAO.findByEnabledOrderByName(true);
	}
	
	@Override
	@ModifyingTransactionalServiceMethod
	public void updateContinent(Continent continent) {
		continentDAO.saveAndFlush(continent);
	}

	@Override
	public Country readCountry(long id) {
		return countryDAO.findOne(id);
	}

	@Override
	@ModifyingTransactionalServiceMethod
	public void updateCountry(Country country) {
		countryDAO.saveAndFlush(country);
	}

	@Override
	public List<Country> findEnabledCountriesByContinent(Continent continent) {
		return countryDAO.findByContinentAndEnabledOrderByName(continent, true);
	}

}
