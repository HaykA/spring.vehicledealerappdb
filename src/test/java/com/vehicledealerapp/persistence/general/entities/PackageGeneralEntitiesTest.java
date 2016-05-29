package com.vehicledealerapp.persistence.general.entities;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PackageGeneralEntitiesTest {

	@Test
	public void general_entities_package_name_is_appropriate() {
		assertEquals(PackageGeneralEntities.getName(),
				this.getClass().getPackage().getName());
	}
	
	@Test
	public void city_class_belongs_to_general_entities_package() {
		assertEquals(PackageGeneralEntities.getName(),
				City.class.getPackage().getName());
	}


}
