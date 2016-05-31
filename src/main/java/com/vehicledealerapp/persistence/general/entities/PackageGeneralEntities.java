package com.vehicledealerapp.persistence.general.entities;

public final class PackageGeneralEntities {
	private PackageGeneralEntities() {}
	
	public static String getName() {
		return PackageGeneralEntities.class.getPackage().getName();
	}
}
