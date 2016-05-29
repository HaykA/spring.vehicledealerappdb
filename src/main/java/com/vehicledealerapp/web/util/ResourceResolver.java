package com.vehicledealerapp.web.util;

import com.vehicledealerapp.persistence.general.entities.City;
import com.vehicledealerapp.persistence.shared.entities.Country;

public final class ResourceResolver {
	private ResourceResolver() {}

	public static final class Attribute {
		public static final String CONTINENT = "continent";
		public static final String CONTINENTS = "continents";
		public static final String COUNTRY = "country";
		public static final String COUNTRIES = "countries";
		public static final String CITY = "city";
		public static final String CITIES = "cities";
		
	}
	
	public static final class Mapping {
		public static final String ROOT = "";
		public static final String INDEX = '/' + View.INDEX;
		public static final String SETTINGS = '/' + View.SETTINGS;
		public static final String SETTINGS_LOCALE = '/' + View.SETTINGS_LOCALE;
		public static final String SETTINGS_BRANCH = '/' + View.SETTINGS_BRANCH;
	}
	
	public static final class Path {
		public static final String CONTINENTS = Attribute.CONTINENTS;
		public static final String CONTINENTS_CLEANCONTINENT = CONTINENTS + "/{" + Attribute.CONTINENT + '}';
		public static final String COUNTRIES_CITIES = Attribute.COUNTRIES + '/' + Attribute.CITIES;
		public static final String COUNTRIES_CLEANCOUNTRY_CITIES = Attribute.COUNTRIES + "/{" + Attribute.COUNTRY + "}/" + Attribute.CITIES;
		public static final String CITIES_CLEANCITY = Attribute.CITIES + "/{" + Attribute.CITY + '}';
				
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
		
		public static final String SETTINGS_BRANCH = SETTINGS + "/branch";
		
		public static String redirectTo(String target) {
			return REDIRECT + target;
		}
		
		
		
		public static String getSettingsLocaleCitiesByCountryId(Country country) {
			return getSettingsLocaleCitiesByCountryId(country.getId());
		}
		
		public static String getSettingsLocaleCitiesByCountryId(long countryId) {
			return getSettingsLocaleCitiesByCountryId(String.valueOf(countryId));
		}
		
		public static String getSettingsLocaleCitiesByCountryId(String countryId) {
			return SETTINGS_LOCALE_COUNTRIES + '/' + countryId + '/' + Attribute.CITIES;
		}


		public static String redirectToSettingsLocaleCitiesByCountry(Country country) {
			return redirectToSettingsLocaleCitiesByCountryId(country.getId());
		}
		
		public static String redirectToSettingsLocaleCitiesByCountryId(long countryId) {
			return redirectToSettingsLocaleCitiesByCountryId(String.valueOf(countryId));
		}
		
		public static String redirectToSettingsLocaleCitiesByCountryId(String countryId) {
			System.out.println(redirectTo(getSettingsLocaleCitiesByCountryId(countryId)));
			return redirectTo(getSettingsLocaleCitiesByCountryId(countryId));
		}
		
		public static String redirectToSettingsLocaleCity(City city) {
			return redirectTo(SETTINGS_LOCALE_CITIES + "/" + city.getId());
		}
		
		public static String redirectTo(String mapping, String path) {
			return REDIRECT_PREFIX + mapping + '/' + path;
		}
	}
}
