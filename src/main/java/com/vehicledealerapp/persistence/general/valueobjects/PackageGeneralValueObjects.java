package com.vehicledealerapp.persistence.general.valueobjects;

public final class PackageGeneralValueObjects {
	private PackageGeneralValueObjects() {}
	
	public static String getName() {
		return PackageGeneralValueObjects.class.getPackage().getName();
	}
}
