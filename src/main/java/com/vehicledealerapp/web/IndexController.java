package com.vehicledealerapp.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vehicledealerapp.util.ResourceResolver.Mapping;
import com.vehicledealerapp.util.ResourceResolver.View;

@Controller
@RequestMapping(Mapping.ROOT)
class IndexController {
		
	@RequestMapping(method = RequestMethod.GET)
	String index(Locale locale) {
		return View.INDEX;
	}
}
