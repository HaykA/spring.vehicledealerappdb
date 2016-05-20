package com.vehicledealerapp.persistence.subject.entities;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PackageSubjectEntitiesTest {

	@Test
	public void subject_entities_package_name_is_appropriate() {
		assertEquals(PackageSubjectEntities.getName(),
				this.getClass().getPackage().getName());
	}
	
}
