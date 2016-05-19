package com.vehicledealerapp.util;

public final class Tools {
	private Tools() {}
	
	public static String capitalize(String value) {
		if (value != null) {
			if (value.length() == 1) {
				return value.toUpperCase();
			} else if (value.length() > 1) {
				return value.toUpperCase().charAt(0) + value.substring(1);
			}
		}
		return value;
	}
}
