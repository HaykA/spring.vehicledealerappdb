package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.web.util.LocaleResourceResolver.View.redirectTo;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicledealerapp.persistence.general.entities.City;
import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;
import com.vehicledealerapp.services.LocaleService;
import com.vehicledealerapp.web.util.LocaleAttributes;
import com.vehicledealerapp.web.util.LocaleResourceResolver.Mapping;
import com.vehicledealerapp.web.util.LocaleResourceResolver.Path;
import com.vehicledealerapp.web.util.LocaleResourceResolver.View;
@Controller
@RequestMapping(Mapping.SETTINGS_LOCALE)
public class LocaleSettingsController {

	private final LocaleService localeService;
	
	@Autowired
	LocaleSettingsController(LocaleService localeService) {
		this.localeService = localeService;
	}
	
	@InitBinder(LocaleAttributes.CONTINENT)
	void initBinderContinent(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	@InitBinder(LocaleAttributes.COUNTRY)
	void initBinderCountryForm(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	@InitBinder(LocaleAttributes.CITY)
	void initBinderCity(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	/**
	 * LOCALE SETTINGS
	 * GET
	 * Forwards: settings/locale.jsp
	 * @return STRING
	 */
	@RequestMapping(method = RequestMethod.GET)
	String localeSettings() {
		return View.SETTINGS_LOCALE;
	}
	
	/**
	 * 1) ENABLE/DISABLE COUNTRIES > shows continents
	 * GET
	 * Path: continents
	 * Forwards: settings/locale/continents.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.CONTINENTS, method = RequestMethod.GET)
	ModelAndView readAllContinents() {
		return new ModelAndView(View.SETTINGS_LOCALE_CONTINENTS,
				LocaleAttributes.CONTINENTS, localeService.findAllContinents());
	}
	
	/**
	 * 1.1) ENABLE/DISABLE COUNTRIES > shows countries by continent
	 * GET
	 * Path: continents/{continent}
	 * Forwards: settings/locale/continent.jsp
	 * @param continent
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.CONTINENTS_CLEANCONTINENT, method = RequestMethod.GET)
	ModelAndView readContinent(@PathVariable Continent continent) {
		return new ModelAndView(View.SETTINGS_LOCALE_CONTINENT, LocaleAttributes.CONTINENT, continent);
	}
	
	/**
	 * 1.1) ENABLE/DISABLE COUNTRIES > updates countries "enabled"-state 
	 * POST
	 * Path: continents/{continent}
	 * Redirects to: (1)
	 * @param continent
	 * @param bindingResult
	 * @return STRING
	 */
	@RequestMapping(path = Path.CONTINENTS_CLEANCONTINENT, method = RequestMethod.POST)
	String updateContinent(@Valid Continent continent) {
		localeService.updateContinent(continent);
		return redirectTo(View.SETTINGS_LOCALE_CONTINENTS);
	}
	
	/**
	 * 2) EDIT COUNTRIES > shows the list of continents
	 * GET
	 * Path: countries
	 * Forwards: settings/locale/countries.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.COUNTRIES, method = RequestMethod.GET)
	ModelAndView readCountries() {
		return new ModelAndView(View.SETTINGS_LOCALE_COUNTRIES,
				LocaleAttributes.CONTINENTS,
					localeService.findAllContinents());
	}
	
	/**
	 * 2.1) EDIT COUNTRIES > gets the id of selected continent as parameter
	 * GET
	 * Path: countries?continent= 
	 * Redirects to:
	 * 		2.2	if continent selected
	 * 		2		if [empty] selected
	 * @param continent
	 * @return STRING
	 */
	@RequestMapping(path = Path.COUNTRIES, params = LocaleAttributes.CONTINENT, method = RequestMethod.GET)
	String readCountries(String continent) {
		return (continent != null && !continent.isEmpty())
				? redirectTo(View.getSettingsLocaleCountriesByContinentId(continent))
				: redirectTo(View.SETTINGS_LOCALE_COUNTRIES); 
	}
	
	/**
	 * 2.2) EDIT COUNTRIES > shows the list of continents and countries by continent
	 * GET
	 * Path: continents/{continent}/countries
	 * Forwards: settings/locale/countries.jsp
	 * @param continent
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.CONTINENTS_CLEANCONTINENT_COUNTRIES, method = RequestMethod.GET)
	ModelAndView readCountries(@PathVariable Continent continent) {
		return new ModelAndView(View.SETTINGS_LOCALE_COUNTRIES, LocaleAttributes.CONTINENT, continent)
				.addObject(LocaleAttributes.CONTINENTS, localeService.findAllContinents())
				.addObject(LocaleAttributes.COUNTRIES,
						localeService.findEnabledCountriesOrCountriesHavingCitiesByContinentSortedByName(continent));
	}
	
	/**
	 * 2.3) EDIT COUNTRIES > shows country
	 * GET
	 * Path: countries/{country}
	 * Forwards: settings/locale/country.jsp
	 * @param country
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY, method = RequestMethod.GET)
	ModelAndView readCountry(@PathVariable Country country) {
		return new ModelAndView(View.SETTINGS_LOCALE_COUNTRY, LocaleAttributes.COUNTRY, country);
	}
	
	/**
	 * 2.3) EDIT COUNTRIES > updates country
	 * POST
	 * Path: countries/{country}
	 * Redirects to: itself
	 * @param country
	 * @return
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY, method = RequestMethod.POST)
	String updateCountry(@Valid Country country) {
		localeService.updateCountry(country);
		return View.redirectToSettingsLocaleCountry(country);
	}
	
	/**
	 * 3) EDIT CITIES > shows the list of countries
	 * GET
	 * Path: cities
	 * Forwards: settings/locale/cities.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.CITIES, method = RequestMethod.GET)
	ModelAndView readAvailableCountries() {
		return new ModelAndView(View.SETTINGS_LOCALE_CITIES,
				LocaleAttributes.COUNTRIES,
					localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	/**
	 * 3.1) EDIT CITIES > gets the id of selected country as parameter
	 * GET
	 * Path: cities?country=
	 * Redirects to:
	 * 		3.2		if country selected
	 * 		3		if [empty] selected
	 * @param country
	 * @return STRING
	 */
	@RequestMapping(path = Path.CITIES, params = LocaleAttributes.COUNTRY, method = RequestMethod.GET)
	String readCities(String country) {
		return (country != null && !country.isEmpty())
				? redirectTo(View.getSettingsLocaleCitiesByCountryId(country))
				: redirectTo(Mapping.SETTINGS_LOCALE, Path.CITIES);
	}
	
	/**
	 * 3.2) EDIT CITIES > shows the list of countries and cities by country
	 * GET
	 * Path: countries/{country}/cities
	 * Forwards: settings/locale/cities.jsp
	 * @param country
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES, method = RequestMethod.GET)
	ModelAndView readCities(@PathVariable Country country, String sort) {
		ModelAndView modelAndView =  new ModelAndView(View.SETTINGS_LOCALE_CITIES,
				LocaleAttributes.COUNTRIES,
					localeService.findEnabledCountriesOrCountriesHavingCities())
			.addObject(LocaleAttributes.COUNTRY, country);
		if ("name".equalsIgnoreCase(sort)) {
			modelAndView.addObject(LocaleAttributes.CITIES, localeService.findCitiesByCountrySortedByName(country));
		} else if ("postalcode".equalsIgnoreCase(sort)) {
			modelAndView.addObject(LocaleAttributes.CITIES, localeService.findCitiesByCountrySortedByPostalCode(country));
		} else {
			modelAndView.addObject(LocaleAttributes.CITIES, country.getCities());
		}
		return modelAndView;
	}
	
	/**
	 * 3.2) EDIT CITIES > removes selected cities
	 * POST
	 * Path: countries/{country}/cities?city[]=
	 * Redirects to: itself
	 * @param city
	 * @return STRING
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES, params = LocaleAttributes.CITY, method = RequestMethod.POST)
	String removeCities(String[] city, @PathVariable Country country) {
		localeService.deleteCitiesByIds(city);
		return redirectTo(View.getSettingsLocaleCitiesByCountry(country));
	}
	
	/** 3.3) EDIT CITIES > shows city
	 * GET
	 * Path: cities/{city}
	 * Forwards settings/locale/city.jsp
	 * @param city
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.CITIES_CLEANCITY, method = RequestMethod.GET)
	ModelAndView readCity(@PathVariable City city) {
		return new ModelAndView(View.SETTINGS_LOCALE_CITY, LocaleAttributes.CITY, city)
				.addObject(LocaleAttributes.COUNTRIES,
						localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	/**
	 * 3.3) EDIT CITIES > updates city
	 * POST
	 * Path: cities/{city}
	 * Redirects to: itself
	 * @param city
	 * @return STRING
	 */
	@RequestMapping(path = Path.CITIES_CLEANCITY, method = RequestMethod.POST)
	String updateCity(@Valid City city) {
		localeService.updateCity(city);
		return View.redirectToSettingsLocaleCity(city);
	}
	
	/**
	 * 3.3) EDIT CITIES > remove city
	 * POST
	 * Path: cities/{city}?remove
	 * Redirects to: 3.2
	 * @param city
	 * @return STRING
	 */
	@RequestMapping(path = Path.CITIES_CLEANCITY, params="remove", method = RequestMethod.POST)
	String removeCity(@PathVariable City city) {
		localeService.deleteCity(city);
		return View.redirectTo(View.getSettingsLocaleCitiesByCountry(city.getCountry()));
	}
	
	/**
	 * 4) EDIT CITIES > ADD CITY TO COUNTRY > show new city form
	 * GET
	 * Path: countries/{country}/cities/new
	 * Forwards: settings/locale/newcity.jsp
	 * @param country
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES_NEW, method = RequestMethod.GET)
	ModelAndView newCityForCountry(@PathVariable Country country) {
		return new ModelAndView(View.SETTINGS_LOCALE_NEWCITY,
				LocaleAttributes.COUNTRIES, localeService.findEnabledCountries())
					.addObject(LocaleAttributes.COUNTRY, country)
					.addObject(new City(country));
	}
	
	/**
	 * 4.1) EDIT CITIES > ADD CITY TO COUNTRY > save city
	 * POST
	 * Path: countries/{country}/cities/new
	 * RETURNS: 5.1
	 * @param city
	 * @param bindingResult
	 * @return STRING
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES_NEW, method = RequestMethod.POST)
	String addCityToCountry(@Valid City city, BindingResult bindingResult) {
		return saveCity(city, bindingResult);
	}
	
	/**
	 * 5) NEW CITY > shows new city form
	 * GET
	 * Path: cities/new
	 * Forwards: settings/locale/newcity.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.CITIES_NEW, method = RequestMethod.GET)
	ModelAndView newCity() {
		return new ModelAndView(View.SETTINGS_LOCALE_NEWCITY,
				LocaleAttributes.COUNTRIES, localeService.findEnabledCountries())
				.addObject(new City());
	}
	
	/**
	 * 5.1) NEW CITY > saves city
	 * POST
	 * Path: cities/new
	 * Redirects to: 3.2
	 * @param city
	 * @param bindingResult
	 * @return STRING
	 */
	@RequestMapping(path = Path.CITIES_NEW, method = RequestMethod.POST)
	String saveCity(@Valid City city, BindingResult bindingResult) {
		localeService.updateCity(city);
		return redirectTo(View.getSettingsLocaleCitiesByCountry(city.getCountry()));
	}
}
