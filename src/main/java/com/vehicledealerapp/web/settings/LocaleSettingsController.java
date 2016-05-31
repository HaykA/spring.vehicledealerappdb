package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.web.util.LocaleResourceResolver.View.redirectTo;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
						localeService.findEnabledCountries());
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
}
