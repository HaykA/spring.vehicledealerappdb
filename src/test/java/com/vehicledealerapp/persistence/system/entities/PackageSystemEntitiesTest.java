package com.vehicledealerapp.persistence.system.entities;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PackageSystemEntitiesTest {

	@Test
	public void system_entities_package_name_is_appropriate() {
		assertEquals(PackageSystemEntities.getName(),
				this.getClass().getPackage().getName());
	}
	
}
