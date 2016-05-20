package com.vehicledealerapp.persistence.shared.entities;

public final class PackageSharedEntities {
	private PackageSharedEntities() {}
	
	public static String getName() {
		return PackageSharedEntities.class.getPackage().getName();
	}
}
