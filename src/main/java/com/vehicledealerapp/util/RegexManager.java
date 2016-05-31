package com.vehicledealerapp.util;

import java.util.regex.Pattern;

import com.vehicledealerapp.exceptions.CountryMatcherException;

public final class RegexManager {
	
	public static final String COUNTRY_REGEX
		= "^\\p{L}{2,}((-|\\s)\\p{L}{2,})*$";
	
	public static final String NULL_EMAIL_REGEX
	= "^(_?[a-zA-Z]+((\\.|_|-)?[a-zA-Z]+)*[a-zA-Z]*_?@(\\d|[a-zA-Z])+((\\.|_|-)?[a-zA-Z]+)*(\\.[a-zA-Z]{2,})+)?$";
	
	public static final String EMAIL_REGEX
		= "^_?[a-zA-Z]+((\\.|_|-)?[a-zA-Z]+)*[a-zA-Z]*_?@(\\d|[a-zA-Z])+((\\.|_|-)?[a-zA-Z]+)*(\\.[a-zA-Z]{2,})+$";
	
	private RegexManager() {}
	
	public static boolean matches(Pattern pattern, String value) {
		return pattern.matcher(value).matches();
	}
	
	public static boolean matches(String regex, String value) {
		return matches(Pattern.compile(regex), value);
	}
	
	public static boolean countryNameMatches(String name) {
		return matches(COUNTRY_REGEX, name);
	}
	
	public static String getValidatedCountryName(String name) {
		if (countryNameMatches(name)) {
			return name.toLowerCase();
		}
		throw new CountryMatcherException();
	}
}
