package com.vehicledealerapp.persistence.system.entities;

public final class PackageSystemEntities {
	private PackageSystemEntities() {}
	
	public static String getName() {
		return PackageSystemEntities.class.getPackage().getName();
	}
}
