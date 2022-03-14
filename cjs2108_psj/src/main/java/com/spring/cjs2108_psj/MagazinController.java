package com.spring.cjs2108_psj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/magazin")
public class MagazinController {
	
	
	@RequestMapping(value="/magazinMain", method = RequestMethod.GET)
	public String magazinMainGet() {
		return "magazin/magazinMain";
	}
	@RequestMapping(value="/magazin2022men", method = RequestMethod.GET)
	public String magazin2022menGet() {
		return "magazin/magazin2022men";
	}
	@RequestMapping(value="/magazin2022men2", method = RequestMethod.GET)
	public String magazin2022men2Get() {
		return "magazin/magazin2022men2";
	}
	@RequestMapping(value="/magazin2022Cu", method = RequestMethod.GET)
	public String magazin2022Get() {
		return "magazin/magazin2022Cu";
	}
	@RequestMapping(value="/magazinMiranda", method = RequestMethod.GET)
	public String magazinMirandaGet() {
		return "magazin/magazinMiranda";
	}
	@RequestMapping(value="/magazinCu", method = RequestMethod.GET)
	public String magazinCuGet() {
		return "magazin/magazinCu";
	}
	@RequestMapping(value="/magazinFung", method = RequestMethod.GET)
	public String magazinFungGet() {
		return "magazin/magazinFung";
	}
	@RequestMapping(value="/magazinKa", method = RequestMethod.GET)
	public String magazinKaGet() {
		return "magazin/magazinKa";
	}
	@RequestMapping(value="/magazinNigo", method = RequestMethod.GET)
	public String magazinNigoGet() {
		return "magazin/magazinNigo";
	}
	@RequestMapping(value="/magazinPo", method = RequestMethod.GET)
	public String magazinPoGet() {
		return "magazin/magazinPo";
	}
	
}
