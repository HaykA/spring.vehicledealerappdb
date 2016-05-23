package com.vehicledealerapp.web;

import static com.vehicledealerapp.util.InternalResourceResolver.INDEX;
import static com.vehicledealerapp.util.InternalResourceResolver.ROOT;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(ROOT)
class IndexController {
		
	@RequestMapping(method = RequestMethod.GET)
	String index(Locale locale) {
		return INDEX;
	}
}
