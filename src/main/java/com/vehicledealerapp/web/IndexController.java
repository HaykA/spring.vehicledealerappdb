package com.vehicledealerapp.web;

import static com.vehicledealerapp.util.InternalResourceResolver.INDEX;
import static com.vehicledealerapp.util.InternalResourceResolver.ROOT;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicledealerapp.services.CountryService;

@Controller
@RequestMapping(ROOT)
class IndexController {
		
	private final CountryService countryService;
	
	@Autowired
	IndexController(CountryService countryService) {
		this.countryService = countryService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	ModelAndView index(Locale locale) {
		return new ModelAndView(INDEX, "countries", countryService.findAll());
	}
}
