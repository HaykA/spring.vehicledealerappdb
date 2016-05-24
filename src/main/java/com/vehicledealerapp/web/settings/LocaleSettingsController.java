package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.util.InternalResourceResolver.CONTINENT;
import static com.vehicledealerapp.util.InternalResourceResolver.CONTINENTS;
import static com.vehicledealerapp.util.InternalResourceResolver.CONTINENTS_CONTINENT;
import static com.vehicledealerapp.util.InternalResourceResolver.RM_SETTINGS_LOCALE;
import static com.vehicledealerapp.util.InternalResourceResolver.SETTINGS_LOCALE_CONTINENT;
import static com.vehicledealerapp.util.InternalResourceResolver.SETTINGS_LOCALE_CONTINENTS;
import static com.vehicledealerapp.util.InternalResourceResolver.redirectTo;

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

import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.persistence.shared.entities.Country;
import com.vehicledealerapp.services.LocaleService;

@Controller
@RequestMapping(RM_SETTINGS_LOCALE)
public class LocaleSettingsController {

	private final LocaleService localeService;
	
	@Autowired
	LocaleSettingsController(LocaleService localeService) {
		this.localeService = localeService;
	}
	
	@InitBinder(CONTINENT)
	void initBinderContinent(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	@RequestMapping(path = CONTINENTS, method = RequestMethod.GET)
	ModelAndView readAllContinents() {
		return new ModelAndView(SETTINGS_LOCALE_CONTINENTS,
				CONTINENTS, localeService.findAllContinents())
				.addObject("countriesHavingCities",
						localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	@RequestMapping(path=CONTINENTS_CONTINENT, method = RequestMethod.GET)
	ModelAndView readContinent(@PathVariable Continent continent) {
		return new ModelAndView(SETTINGS_LOCALE_CONTINENT, CONTINENT, continent);
	}
	
	@RequestMapping(path=CONTINENTS_CONTINENT, method = RequestMethod.POST)
	String toggleContinentCountries(@Valid Continent continent, BindingResult bindingResult) {
		localeService.updateContinent(continent);
		return redirectTo(SETTINGS_LOCALE_CONTINENTS);
	}
	
	@RequestMapping(path = "countries/cities", method = RequestMethod.GET)
	ModelAndView readAvailableCountries() {
		return new ModelAndView("settings/locale/countries/cities",
				"countries",
					localeService.findEnabledCountriesOrCountriesHavingCities());
	}
	
	@RequestMapping(path = "countries/{country}/cities", method = RequestMethod.GET)
	ModelAndView readCountry(Country country) {
		return new ModelAndView("settings/locale/countries/cities",
				"countries",
					localeService.findEnabledCountriesOrCountriesHavingCities())
			.addObject("country", country);
	}
}
