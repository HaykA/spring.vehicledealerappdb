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
		return countryDAO.findByEnabled(true);
	}
	
	@Override
	@ModifyingTransactionalServiceMethod
	public void updateContinent(Continent continent) {
		System.out.println("Saving continent");
		continentDAO.saveAndFlush(continent);
	}
}
