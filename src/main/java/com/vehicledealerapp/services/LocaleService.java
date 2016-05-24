package com.vehicledealerapp.services;

import java.util.List;

import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

public interface LocaleService {
	List<Continent> findAllContinents();
	List<Country> findEnabledCountries();
	void updateContinent(Continent continent);
}
