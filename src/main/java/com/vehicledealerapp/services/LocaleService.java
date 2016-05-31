package com.vehicledealerapp.services;

import java.util.List;

import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

public interface LocaleService {
	List<Continent> findAllContinents();
	void updateContinent(Continent continent);
	
	Country readCountry(long id);
	List<Country> findEnabledCountries();
	List<Country> findEnabledCountriesByContinent(Continent continent);
	void updateCountry(Country country);

}
