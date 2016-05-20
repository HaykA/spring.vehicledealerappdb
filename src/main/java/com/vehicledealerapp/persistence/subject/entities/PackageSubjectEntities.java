package com.vehicledealerapp.persistence.subject.entities;

public final class PackageSubjectEntities {
	private PackageSubjectEntities() {}
	
	public static String getName() {
		return PackageSubjectEntities.class.getPackage().getName();
	}
}
