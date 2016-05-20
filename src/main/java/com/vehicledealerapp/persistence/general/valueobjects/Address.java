package com.vehicledealerapp.persistence.general.valueobjects;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.vehicledealerapp.persistence.general.entities.City;

@Embeddable
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String street;
	private String house;
	private String apt;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cityid")
	private City city;
}
