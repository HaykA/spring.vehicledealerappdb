package com.vehicledealerapp.persistence.general.valueobjects;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PackageGeneralValueObjectsTest {

	@Test
	public void general_valueobjects_package_name_is_appropriate() {
		assertEquals(PackageGeneralValueObjects.getName(),
				this.getClass().getPackage().getName());
	}
	
}
