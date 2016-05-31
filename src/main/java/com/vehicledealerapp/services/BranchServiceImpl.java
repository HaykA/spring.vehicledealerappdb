package com.vehicledealerapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.vehicledealerapp.dao.BranchDAO;
import com.vehicledealerapp.dao.CountryDAO;
import com.vehicledealerapp.persistence.general.entities.Branch;
import com.vehicledealerapp.persistence.shared.entities.Country;

@ReadOnlyTransactionalService
public class BranchServiceImpl implements BranchService {
	private final BranchDAO branchDAO;
	private final CountryDAO countryDAO;
	
	@Autowired
	public BranchServiceImpl(BranchDAO branchDAO,
			CountryDAO countryDAO) {
		this.branchDAO = branchDAO;
		this.countryDAO = countryDAO;
	}

	@Override
	public List<Branch> findAll() {
		return branchDAO.findAll();
	}

	@Override
	public List<Country> findEnabledCountries() {
		return countryDAO.findByEnabledOrderByName(true);
	}

	@Override
	@ModifyingTransactionalServiceMethod
	public void updateBranch(Branch branch) {
		branchDAO.save(branch);
	}

	@Override
	@ModifyingTransactionalServiceMethod
	public void deleteBranch(Branch branch) {
		branchDAO.delete(branch);
	}

	@Override
	public List<Country> findEnabledCountriesOrCountriesHavingBranches(Branch branch) {
		return countryDAO.findByEnabledOrBranchesContaining(true, branch);
	}
}
