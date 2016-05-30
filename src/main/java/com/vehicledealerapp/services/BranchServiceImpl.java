package com.vehicledealerapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vehicledealerapp.dao.BranchDAO;
import com.vehicledealerapp.persistence.general.entities.Branch;

@ReadOnlyTransactionalService
public class BranchServiceImpl implements BranchService {
	private final BranchDAO branchDAO;	
	
	@Autowired
	public BranchServiceImpl(BranchDAO branchDAO) {
		this.branchDAO = branchDAO;
	}

	@Override
	public Page<Branch> findAll(Pageable pageable) {
		return branchDAO.findAll(pageable);
	}
	
	

}
