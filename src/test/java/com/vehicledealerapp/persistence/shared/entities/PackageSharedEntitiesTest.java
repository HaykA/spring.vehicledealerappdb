package com.vehicledealerapp.persistence.shared.entities;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PackageSharedEntitiesTest {
	@Test
	public void shared_entities_package_name_is_appropriate() {
		assertEquals(PackageSharedEntities.getName(),
				this.getClass().getPackage().getName());
	}
	
	@Test
	public void continent_class_belongs_to_shared_entities_package() {
		assertEquals(PackageSharedEntities.getName(),
				Continent.class.getPackage().getName());
	}
	
	@Test
	public void country_class_belongs_to_shared_entities_package() {
		assertEquals(PackageSharedEntities.getName(),
				Country.class.getPackage().getName());
	}
	
	@Test
	public void currency_class_belongs_to_shared_entities_package() {
		assertEquals(PackageSharedEntities.getName(),
				Currency.class.getPackage().getName());
	}
}
