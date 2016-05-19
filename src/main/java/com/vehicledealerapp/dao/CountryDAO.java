package com.vehicledealerapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.entities.shared.Country;

public interface CountryDAO  extends JpaRepository<Country, Long> {
	List<Country> findAll();
	List<Country> findByEnabled(boolean enabled);
}
