package com.vehicledealerapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.shared.entities.Continent;

public interface ContinentDAO  extends JpaRepository<Continent, Long> {}
