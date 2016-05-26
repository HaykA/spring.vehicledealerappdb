package com.vehicledealerapp.util;

public final class ResourceResolver {
	private ResourceResolver() {}

	public static final class Attribute {
		public static final String CONTINENT = "continent";
		public static final String CONTINENTS = "continents";
		public static final String COUNTRY = "country";
		public static final String COUNTRIES = "countries";
		public static final String CITY = "city";
		public static final String CITIES = "cities";
		public static final String STREET = "street";
		public static final String STREETS = "streets";
		
	}
	
	public static final class Mapping {
		public static final String ROOT = "";
		public static final String INDEX = '/' + View.INDEX;
		public static final String SETTINGS = '/' + View.SETTINGS;
		public static final String SETTINGS_LOCALE = '/' + View.SETTINGS_LOCALE;
	}
	
	public static final class Path {
		public static final String CONTINENTS = Attributes.CONTINENTS;
		public static final String CONTINENTS_CLEANCONTINENT = CONTINENTS + "/{" + Attribute.CONTINENT + '}';
		public static final String COUNTRIES_CITIES = Attribute.COUNTRIES + '/' + Attribute.CITIES;
		public static final String COUNTRIES_CLEANCOUNTRY_CITIES = Attribute.COUNTRIES + "/{" + Attribute.COUNTRY + "}/" + Attribute.CITIES;
		public static final String CITIES_CLEANCITY = Attribute.CITIES + "/{" + Attribute.CITY + '}';
		public static final String CITIES_CLEANCITY_STREETS = CITIES_CLEANCITY + '/' + Attribute.STREETS;
		public static final String STREETS_CLEANSTREET = Attribute.STREETS + "/{" + Attribute.STREET + '}';
		
	}
	
	public static final class View {
		private static final String REDIRECT_PREFIX = "redirect:";
		public static final String REDIRECT = REDIRECT_PREFIX + '/';
		
		public static final String INDEX = "index";
		public static final String SETTINGS = "settings";
		public static final String SETTINGS_LOCALE = SETTINGS + "/locale";
		public static final String SETTINGS_LOCALE_CONTINENT = SETTINGS_LOCALE + '/' + Attribute.CONTINENT;
		public static final String SETTINGS_LOCALE_CONTINENTS = SETTINGS_LOCALE + '/' + Attribute.CONTINENTS;
		public static final String SETTINGS_LOCALE_COUNTRY = SETTINGS_LOCALE + '/' + Attribute.COUNTRY;
		public static final String SETTINGS_LOCALE_COUNTRIES = SETTINGS_LOCALE + '/' + Attribute.COUNTRIES;
		public static final String SETTINGS_LOCALE_CITY = SETTINGS_LOCALE + '/' + Attribute.CITY;
		public static final String SETTINGS_LOCALE_CITIES = SETTINGS_LOCALE + '/' + Attribute.CITIES;
		public static final String SETTINGS_LOCALE_STREET = SETTINGS_LOCALE + '/' + Attribute.STREET;
		public static final String SETTINGS_LOCALE_STREETS = SETTINGS_LOCALE + '/' + Attribute.STREETS;
		
		public static String redirectTo(String target) {
			return REDIRECT + target;
		}
		
		public static String redirectToSettingsLocaleCitiesByCountryId(String countryId) {
			return SETTINGS_LOCALE_COUNTRIES + '/' + countryId + '/' + Attribute.CITIES;
		}
		
		public static String redirectTo(String mapping, String path) {
			return REDIRECT_PREFIX + mapping + '/' + path;
		}
	}
}
