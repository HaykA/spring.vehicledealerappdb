package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.util.ResourceResolver.View.redirectTo;

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
import com.vehicledealerapp.persistence.general.entities.Street;
import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;
import com.vehicledealerapp.services.LocaleService;
import com.vehicledealerapp.util.ResourceResolver.Attribute;
import com.vehicledealerapp.util.ResourceResolver.Mapping;
import com.vehicledealerapp.util.ResourceResolver.Path;
import com.vehicledealerapp.util.ResourceResolver.View;
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
		return (country != null && !country.isEmpty())
				? redirectTo(View.redirectToSettingsLocaleCitiesByCountryId(country))
				: redirectTo(Mapping.SETTINGS_LOCALE, Path.COUNTRIES_CITIES);
	}
	
	/**
	 * doGet cities - Forwards cities.jsp
	 * @param country
	 * @return
	 */
	@RequestMapping(path = Path.COUNTRIES_CLEANCOUNTRY_CITIES, method = RequestMethod.GET)
	ModelAndView readCities(Country country) {
		return new ModelAndView(View.SETTINGS_LOCALE_CITIES,
				Attribute.COUNTRIES,
					localeService.findEnabledCountriesOrCountriesHavingCities())
			.addObject(Attribute.COUNTRY, country);
	}
	
	/**
	 * doGet city - Forwards city.jsp
	 * @param city
	 * @return
	 */
	@RequestMapping(path = Path.CITIES_CLEANCITY, method = RequestMethod.GET)
	ModelAndView readCity(City city) {
		return new ModelAndView(View.SETTINGS_LOCALE_CITY, Attribute.CITY, city)
				.addObject(Attribute.COUNTRIES,
						localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	/**
	 * doGet streets - Forwards streets.jsp
	 * @param city
	 * @return
	 */
	@RequestMapping(path = Path.CITIES_CLEANCITY_STREETS, method = RequestMethod.GET)
	ModelAndView readStreets(City city) {
		return new ModelAndView(View.SETTINGS_LOCALE_STREETS, Attribute.CITY, city);
	}
	
	/**
	 * doGet street - Forwards street.jsp
	 * @param street
	 * @return
	 */
	@RequestMapping(path = Path.STREETS_CLEANSTREET, method = RequestMethod.GET)
	ModelAndView readStreet(Street street) {
		return new ModelAndView(View.SETTINGS_LOCALE_STREET, Attribute.STREET, street);
	}

}
