package com.vehicledealerapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.vehicledealerapp.persistence.general.entities.Branch;
import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

public interface CountryDAO  extends JpaRepository<Country, Long> {
	
	@EntityGraph(Country.WITH_CONTINENT)
	List<Country> findByEnabledOrderByName(boolean enabled);

	@EntityGraph(Country.WITH_CONTINENT)
	List<Country> findByContinentAndEnabledOrderByName(Continent continent, boolean enabled);
	
	List<Country> findByEnabledOrBranchesContaining(boolean enabled, Branch branch);
}
