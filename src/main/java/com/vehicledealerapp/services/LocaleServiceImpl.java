package com.vehicledealerapp.services;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import com.vehicledealerapp.dao.CityDAO;
import com.vehicledealerapp.dao.ContinentDAO;
import com.vehicledealerapp.dao.CountryDAO;
import com.vehicledealerapp.persistence.general.entities.City;
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
		continentDAO.saveAndFlush(continent);
	}

	@Override
	public List<Country> findEnabledCountriesOrCountriesHavingCities() {
		//throw new UnsupportedOperationException();
		return countryDAO.findDistinctByEnabledOrCitiesNotNull(true);
	}

	@Override
	public Country readCountry(long id) {
		return countryDAO.findOne(id);
	}

	@Override
	@ModifyingTransactionalServiceMethod
	public void deleteCitiesByIds(String... cityIds) {
		try {
			cityDAO.delete(
					cityDAO.findAll(
							Arrays.<String>asList(cityIds).stream()
								.map(Long::parseLong)
								.collect(Collectors.toList())));
		} catch (NumberFormatException | NullPointerException ex) {}
	}
	
	@Override
	@ModifyingTransactionalServiceMethod
	public void deleteCity(City city) {
		cityDAO.delete(city);
	}

	@Override
	@ModifyingTransactionalServiceMethod
	public void updateCity(City city) {
		cityDAO.saveAndFlush(city);
	}

	@Override
	public List<City> findCitiesByCountrySortedByName(Country country) {
		return cityDAO.findByCountryOrderByName(country);
	}
	
	@Override
	public List<City> findCitiesByCountrySortedByPostalCode(Country country) {
		return cityDAO.findByCountryOrderByPostalCode(country);
	}
}
