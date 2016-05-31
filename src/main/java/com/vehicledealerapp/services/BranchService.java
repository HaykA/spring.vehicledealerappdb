package com.vehicledealerapp.services;

import java.util.List;

import com.vehicledealerapp.persistence.general.entities.Branch;
import com.vehicledealerapp.persistence.shared.entities.Country;

public interface BranchService {
	List<Branch> findAll();
	List<Country> findEnabledCountries();
	void updateBranch(Branch branch);
}
