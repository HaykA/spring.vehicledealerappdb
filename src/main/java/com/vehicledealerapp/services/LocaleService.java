package com.vehicledealerapp.services;

import java.util.List;

import com.vehicledealerapp.persistence.general.entities.City;
import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

public interface LocaleService {
	List<Continent> findAllContinents();
	void updateContinent(Continent continent);
	
	Country readCountry(long id);
	List<Country> findEnabledCountries();
	List<Country> findEnabledCountriesOrCountriesHavingCities();
	List<Country> findEnabledCountriesOrCountriesHavingCitiesByContinentSortedByName(Continent continent);
	void updateCountry(Country country);
	
	List<City> findCitiesByCountrySortedByName(Country country);
	List<City> findCitiesByCountrySortedByPostalCode(Country country);
	void deleteCity(City city);
	void deleteCitiesByIds(String... cityIds);
	void updateCity(City city);

}
