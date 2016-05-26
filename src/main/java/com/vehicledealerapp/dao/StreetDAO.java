package com.vehicledealerapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.general.entities.Street;

public interface StreetDAO extends JpaRepository<Street, Long> {

}
