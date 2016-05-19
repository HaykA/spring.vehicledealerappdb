package com.vehicledealerapp.services;

import java.util.List;

import com.vehicledealerapp.entities.shared.Country;

public interface CountryService {
	List<Country> findAll();
	List<Country> findWhereEnabled();
	List<Country> findWhereDisabled();
}
