package com.vehicledealerapp.web;

import static com.vehicledealerapp.util.InternalResourceResolver.INDEX;
import static com.vehicledealerapp.util.InternalResourceResolver.ROOT;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicledealerapp.services.LocaleService;

@Controller
@RequestMapping(ROOT)
class IndexController {
		
	private final LocaleService localeService;
	
	@Autowired
	IndexController(LocaleService localeService) {
		this.localeService = localeService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	ModelAndView index(Locale locale) {
		return new ModelAndView(INDEX,
			"enabledContinents", localeService.findEnabledContinents())
				.addObject("disabledContinents", localeService.findDisabledContinents());
	}
}
