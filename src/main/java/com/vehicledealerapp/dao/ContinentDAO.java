package com.vehicledealerapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.shared.entities.Continent;

public interface ContinentDAO  extends JpaRepository<Continent, Long> {
	List<Continent> findAll();
	List<Continent> findByEnabled(boolean enabled);
}
