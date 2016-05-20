package com.vehicledealerapp.services;

import java.util.List;

import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

public interface LocaleService {
	List<Continent> findAllContinents();
	List<Continent> findEnabledContinents();
	List<Continent> findDisabledContinents();
	List<Country> findAllCountries();
	List<Country> findEnabledCountries();
	List<Country> findDisabledCountries();
	void executeMaintenance();
}
