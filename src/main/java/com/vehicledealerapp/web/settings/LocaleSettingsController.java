package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.web.util.ResourceResolver.View.redirectTo;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
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
import com.vehicledealerapp.web.util.ResourceResolver.Attribute;
import com.vehicledealerapp.web.util.ResourceResolver.Mapping;
import com.vehicledealerapp.web.util.ResourceResolver.Path;
import com.vehicledealerapp.web.util.ResourceResolver.View;
@Controller
@RequestMapping(Mapping.SETTINGS_LOCALE)
public class LocaleSettingsController {

	private final LocaleService localeService;
	
	@Autowired
	LocaleSettingsController(LocaleService localeService) {
		this.localeService = localeService;
	}
	
	@InitBinder(Attribute.CONTINENT)
	void initBinderContinent(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	@InitBinder(Attribute.CITY)
	void initBinderCity(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	/**
	 * doGet continents - Forwards continents.jsp
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	String localeSettings() {
		return View.SETTINGS_LOCALE;
	}
	
	/**
	 * doGet continents - Forwards continents.jsp
	 * @return
	 */
	@RequestMapping(path = Path.CONTINENTS, method = RequestMethod.GET)
	ModelAndView readAllContinents() {
		return new ModelAndView(View.SETTINGS_LOCALE_CONTINENTS,
				Attribute.CONTINENTS, localeService.findAllContinents());
	}
	
	/**
	 * doGet continent - Forwards continent.jsp
	 * @param continent
	 * @return
	 */
	@RequestMapping(path = Path.CONTINENTS_CLEANCONTINENT, method = RequestMethod.GET)
	ModelAndView readContinent(@PathVariable Continent continent) {
		return new ModelAndView(View.SETTINGS_LOCALE_CONTINENT, Attribute.CONTINENT, continent);
	}
	
	/**
	 * doPost continent - Updates enabled countries and redirects to doGet continents
	 * @param continent
	 * @param bindingResult
	 * @return
	 */
	@RequestMapping(path = Path.CONTINENTS_CLEANCONTINENT, method = RequestMethod.POST)
	String toggleContinentCountries(@Valid Continent continent, BindingResult bindingResult) {
		localeService.updateContinent(continent);
		return redirectTo(View.SETTINGS_LOCALE_CONTINENTS);
	}
	
	/**
	 * doGet cities - Forwards cities.jsp
	 * @param countryId
	 * @return
	 */
	@RequestMapping(path = Path.COUNTRIES_CITIES, method = RequestMethod.GET)
	ModelAndView readAvailableCountries(String countryId) {
		return new ModelAndView(View.SETTINGS_LOCALE_CITIES,
				Attribute.COUNTRIES,
					localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	/**
	 * doGet cities - redirects to cities.jsp
	 * @param country
	 * @return
	 */
	@RequestMapping(path = Path.COUNTRIES_CITIES, params = Attribute.COUNTRY, method = RequestMethod.GET)
	String readCities(String country) {
		return redirectTo(View.getSettingsLocaleCitiesByCountryId(country));
	}
	
	/**
	 * doGet cities - Forwards cities.jsp
	 * @param country
	 * @return
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES, method = RequestMethod.GET)
	ModelAndView readCities(@PathVariable Country country, Pageable pageable, String sort) {
		ModelAndView modelAndView =  new ModelAndView(View.SETTINGS_LOCALE_CITIES,
				Attribute.COUNTRIES,
					localeService.findEnabledCountriesOrCountriesHavingCities())
			.addObject(Attribute.COUNTRY, country);
		if ("name".equalsIgnoreCase(sort)) {
			modelAndView.addObject(Attribute.CITIES, localeService.findCitiesByCountrySortedByName(country));
		} else if ("postalcode".equalsIgnoreCase(sort)) {
			modelAndView.addObject(Attribute.CITIES, localeService.findCitiesByCountrySortedByPostalCode(country));
		} else {
			modelAndView.addObject(Attribute.CITIES, country.getCities());
		}
		return modelAndView;
	}
	
	
	
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES, method = RequestMethod.POST)
	String readCities(@Valid City city, BindingResult bindingResult) {
		return redirectTo(Mapping.SETTINGS_LOCALE, Path.COUNTRIES_CITIES);
	}
	
	/**
	 * doGet city - Forwards city.jsp
	 * @param city
	 * @return
	 */
	@RequestMapping(path = Path.CITIES_CLEANCITY, method = RequestMethod.GET)
	ModelAndView readCity(@PathVariable City city) {
		return new ModelAndView(View.SETTINGS_LOCALE_CITY, Attribute.CITY, city)
				.addObject(Attribute.COUNTRIES,
						localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	@RequestMapping(path = Path.CITIES_CLEANCITY, method = RequestMethod.POST)
	String updateCity(@Valid City city) {
		localeService.updateCity(city);
		return View.redirectToSettingsLocaleCity(city);
	}
	
	@RequestMapping(path = Path.CITIES_CLEANCITY, params="remove", method = RequestMethod.POST)
	String removeCity(@PathVariable City city) {
		localeService.deleteCity(city);
		return View.redirectTo(Mapping.SETTINGS_LOCALE, Path.COUNTRIES_CITIES);
	}
	
	/**
	 * doGet city - Forwards city.jsp
	 * @param city
	 * @return
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES, params = Attribute.CITY, method = RequestMethod.POST)
	String removeCity(String[] city, @PathVariable Country country) {
		localeService.deleteCitiesByIds(city);
		return View.redirectToSettingsLocaleCitiesByCountry(country);
	}
	
	/* CREATING NEW CITY */
	@RequestMapping(path = "cities/new", method = RequestMethod.GET)
	ModelAndView newCity() {
		return new ModelAndView("settings/locale/newcity", "countries", localeService.findEnabledCountries())
				.addObject(new City());
	}
	
	@RequestMapping(path = "cities/new", method = RequestMethod.POST)
	String saveCity(@Valid City city, BindingResult bindingResult) {
		localeService.updateCity(city);
		return "redirect:/settings/locale/countries/" + city.getCountry().getId() + "/cities";
	}
	
	@RequestMapping(path = "countries/{country}/cities/new", method = RequestMethod.GET)
	ModelAndView newCityForCountry(@PathVariable Country country) {
		return new ModelAndView("settings/locale/newcity", "countries", localeService.findEnabledCountries())
				.addObject(Attribute.COUNTRY, country)
				.addObject(new City(country));
	}
	
	@RequestMapping(path = "countries/{country}/cities/new", method = RequestMethod.POST)
	String addCityToCountry(@Valid City city, BindingResult bindingResult) {
		return saveCity(city, bindingResult);
	}


}
