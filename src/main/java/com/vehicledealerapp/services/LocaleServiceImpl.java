package com.vehicledealerapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.vehicledealerapp.dao.CityDAO;
import com.vehicledealerapp.dao.ContinentDAO;
import com.vehicledealerapp.dao.CountryDAO;
import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

@ReadOnlyTransactionalService
public class LocaleServiceImpl implements LocaleService {

	private final CountryDAO countryDAO;
	private final ContinentDAO continentDAO;
	private final CityDAO cityDAO;
	
	@Autowired
	public LocaleServiceImpl(CountryDAO countryDAO,
			ContinentDAO continentDAO,
			CityDAO cityDAO) {
		this.countryDAO = countryDAO;
		this.continentDAO = continentDAO;
		this.cityDAO = cityDAO;
	}
	
	@Override
	public List<Continent> findAllContinents() {
		return continentDAO.findAll();
	}
	
	@Override
	public List<Country> findEnabledCountries() {
		return countryDAO.findByEnabled(true);
	}
	
	@Override
	@ModifyingTransactionalServiceMethod
	public void updateContinent(Continent continent) {
		System.out.println("Saving continent");
		continentDAO.saveAndFlush(continent);
	}

	@Override
	public List<Country> findEnabledCountriesOrCountriesHavingCities() {
		//throw new UnsupportedOperationException();
		return countryDAO.findByEnabledOrCitiesNotNull(true);
	}

	@Override
	public Country readCountry(long id) {
		return countryDAO.findOne(id);
	}
}
