package com.vehicledealerapp.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vehicledealerapp.persistence.general.entities.Branch;

public interface BranchService {
	Page<Branch> findAll(Pageable pageable);
}
