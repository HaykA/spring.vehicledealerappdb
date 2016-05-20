package com.vehicledealerapp.test;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.vehicledealerapp.persistence.general.entities.PackageGeneralEntitiesTest;
import com.vehicledealerapp.persistence.general.valueobjects.PackageGeneralValueObjectsTest;
import com.vehicledealerapp.persistence.shared.entities.PackageSharedEntitiesTest;
import com.vehicledealerapp.persistence.subject.entities.PackageSubjectEntitiesTest;
import com.vehicledealerapp.persistence.system.entities.PackageSystemEntitiesTest;

@RunWith(Suite.class)
@SuiteClasses({
	PackageGeneralEntitiesTest.class,
	PackageGeneralValueObjectsTest.class,
	
	PackageSharedEntitiesTest.class,
	PackageSubjectEntitiesTest.class,
	PackageSystemEntitiesTest.class
	
	
})
public class PackageTestSuite {}
