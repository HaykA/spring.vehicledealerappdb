package com.vehicledealerapp.web.util;

import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;

public final class LocaleResourceResolver {
	private LocaleResourceResolver() {}

	public static final class Mapping {
		public static final String ROOT = "";
		public static final String INDEX = '/' + View.INDEX;
		public static final String SETTINGS = '/' + View.SETTINGS;
		public static final String SETTINGS_LOCALE = '/' + View.SETTINGS_LOCALE;
	}
	
	public static final class Path {
		public static final String CONTINENTS = LocaleAttributes.CONTINENTS;
		public static final String CONTINENTS_CLEANCONTINENT = CONTINENTS + "/{" + LocaleAttributes.CONTINENT + '}';
		public static final String COUNTRIES = LocaleAttributes.COUNTRIES;
		public static final String COUNTRIES_CLEANCOUNTRY = COUNTRIES + "/{" + LocaleAttributes.COUNTRY + '}';
		public static final String CONTINENTS_CLEANCONTINENT_COUNTRIES = CONTINENTS_CLEANCONTINENT + "/" + COUNTRIES;
	}
	
	public static final class View {
		private static final String REDIRECT_PREFIX = "redirect:";
		public static final String REDIRECT = REDIRECT_PREFIX + '/';
		
		public static final String INDEX = "index";
		public static final String SETTINGS = "settings";
		public static final String SETTINGS_LOCALE = SETTINGS + "/locale";
		public static final String SETTINGS_LOCALE_CONTINENT = SETTINGS_LOCALE + '/' + LocaleAttributes.CONTINENT;
		public static final String SETTINGS_LOCALE_CONTINENTS = SETTINGS_LOCALE + '/' + LocaleAttributes.CONTINENTS;
		public static final String SETTINGS_LOCALE_COUNTRY = SETTINGS_LOCALE + '/' + LocaleAttributes.COUNTRY;
		public static final String SETTINGS_LOCALE_COUNTRIES = SETTINGS_LOCALE + '/' + LocaleAttributes.COUNTRIES;

		
		public static String redirectTo(String target) {
			return REDIRECT + target;
		}
		
		public static String redirectTo(String mapping, String path) {
			return REDIRECT_PREFIX + mapping + '/' + path;
		}
		
		public static String getSettingsLocaleCountriesByContinent(Continent continent) {
			return getSettingsLocaleCountriesByContinentId(continent.getId());
		}
		
		public static String getSettingsLocaleCountriesByContinentId(long continentId) {
			return getSettingsLocaleCountriesByContinentId(String.valueOf(continentId));
		}
		
		public static String getSettingsLocaleCountriesByContinentId(String continentId) {
			return SETTINGS_LOCALE_CONTINENTS + '/' + continentId + '/' + LocaleAttributes.COUNTRIES;
		}
		
		public static String redirectToSettingsLocaleCountry(Country country) {
			return redirectTo(SETTINGS_LOCALE_COUNTRIES + "/" + country.getId());
		}
	}
}
