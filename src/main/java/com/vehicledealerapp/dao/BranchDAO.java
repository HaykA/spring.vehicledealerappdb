package com.vehicledealerapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.general.entities.Branch;

public interface BranchDAO extends JpaRepository<Branch, Long> {}
