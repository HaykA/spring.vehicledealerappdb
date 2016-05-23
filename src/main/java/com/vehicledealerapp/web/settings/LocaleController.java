package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.util.InternalResourceResolver.CONTINENTS;
import static com.vehicledealerapp.util.InternalResourceResolver.COUNTRIES;
import static com.vehicledealerapp.util.InternalResourceResolver._CONTINENTS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicledealerapp.persistence.shared.entities.Continent;
import com.vehicledealerapp.services.LocaleService;
import com.vehicledealerapp.util.Attributes;
import com.vehicledealerapp.util.InternalResourceResolver;

@Controller
@RequestMapping(_CONTINENTS)
public class LocaleController {

	private final LocaleService localeService;
	
	@Autowired
	LocaleController(LocaleService localeService) {
		this.localeService = localeService;
	}
	
	@InitBinder("continent")
	void initBinderContinent(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	@RequestMapping(method = RequestMethod.GET)
	ModelAndView readAllContinents() {
		return new ModelAndView(CONTINENTS,
				Attributes.CONTINENTS, localeService.findAllContinents());
	}
	
	@RequestMapping(path="{continent}", method = RequestMethod.GET)
	ModelAndView readContinent(@PathVariable Continent continent) {
		return new ModelAndView(COUNTRIES,
				Attributes.CONTINENT, continent);
	}
	
	@RequestMapping(path="{continent}", method = RequestMethod.POST)
	String editContinent(@PathVariable Continent continent) {
		localeService.updateContinent(continent);
		return InternalResourceResolver.redirectTo(CONTINENTS);
	}
	
	
}
